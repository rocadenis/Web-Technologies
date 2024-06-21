<?php
require_once __DIR__ . '/../database/db_connect.php';
header('Content-Type: application/json');

$query = isset($_GET['query']) ? $_GET['query'] : '';

if (empty($query)) {
    echo json_encode(["error" => "Query is empty"]);
    exit;
}

// Funcția de procesare a cuvintelor
function processWords($sentence) {
    $stopWords = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'but', 'by', 'for', 'if', 'in', 'into', 'is', 'it', 'no', 'not', 'of', 'on', 'or', 'such', 'that', 'the', 'their', 'then', 'there', 'these', 'they', 'this', 'to', 'was', 'will', 'with'];
    $synonyms = [
        'js' => 'javascript',
        'py' => 'python',
        'cpp' => 'c++',
        'csharp' => 'c#',
        'tutorial' => 'guide',
        'code' => 'source code',
        'website' => 'site',
    ];

    // Conversie la minuscule și despărțirea în cuvinte
    $words = explode(' ', strtolower($sentence));
    $filteredWords = array_diff($words, $stopWords);
    
    // Înlocuirea sinonimelor
    foreach ($filteredWords as &$word) {
        if (isset($synonyms[$word])) {
            $word = $synonyms[$word];
        }
    }
    
    return array_values($filteredWords);
}

$words = processWords($query);

if (count($words) < 2) {
    echo json_encode(["error" => "Please enter at least two meaningful words for the search."]);
    exit;
}

// Construirea interogării SQL dinamice
$sql = "SELECT *, 
        (";
foreach ($words as $index => $word) {
    $word = $conn->real_escape_string($word); // Escapare pentru siguranță
    if ($index > 0) {
        $sql .= " + ";
    }
    $sql .= "(CASE WHEN name LIKE '%$word%' THEN 1 ELSE 0 END 
            + CASE WHEN description LIKE '%$word%' THEN 1 ELSE 0 END 
            + CASE WHEN language LIKE '%$word%' THEN 1 ELSE 0 END 
            + CASE WHEN type LIKE '%$word%' THEN 1 ELSE 0 END)";
}
$sql .= ") AS match_count 
         FROM resources 
         HAVING match_count >= 2
         ORDER BY match_count DESC";

try {
    $result = $conn->query($sql);
    if (!$result) {
        throw new Exception("Database Error [{$conn->errno}] {$conn->error}");
    }

    $data = [];

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
    } else {
        $data = ["message" => "No results found."];
    }

    echo json_encode($data);
} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}

$conn->close();
?>
