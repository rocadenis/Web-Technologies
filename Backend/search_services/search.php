<?php
include '../database/db_connect.php'; 
header('Content-Type: application/json'); 

$query = isset($_GET['query']) ? $_GET['query'] : ''; 

if (empty($query)) { 
    echo json_encode(["error" => "Query is empty"]);
    exit;
}

function processWords($sentence) {
    // cuvinte pe care le ignoram
    $stopWords = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'but', 'by', 'for', 'if', 'in', 'into', 'is', 'it', 'no', 'not', 'of', 'on', 'or', 'such', 'that', 'the', 'their', 'then', 'there', 'these', 'they', 'this', 'to', 'was', 'will', 'with', 'want', 'to', 'make', 'give', 'me'];
    
    $synonyms = [
        'js' => 'javascript',
        'py' => 'python',
        'cpp' => 'c++',
        'csharp' => 'c#',
        'tutorials' => 'tutorial',
        'codes' => 'source code',
        'websites' => 'site',
    ];
    
    $programmingLanguages = ['javascript', 'node.js', 'c++', 'c', 'c#'];
    $resourceTypes = ['tutorial', 'site', 'source code'];
    $imageWords = ['image', 'photo', 'picture', 'graphic'];
    $soundWords = ['sound', 'audio', 'music'];
    
    // impart propozitia in cuvinte si eliminam cuvintele de stop
    $words = explode(' ', strtolower($sentence));
    $filteredWords = array_diff($words, $stopWords);
    
    $keywords = [];
    $language = '';
    $contentType = '';
    $type = '';
    $strictType = false;
    $strictLanguage = false;
    
    // procesam fiecare cuvant pentru a gasi sinonime, limbaje de programare si tipuri de resurse
    foreach ($filteredWords as &$word) {
        if (isset($synonyms[$word])) {
            $word = $synonyms[$word];
        }
        if (in_array($word, $programmingLanguages)) {
            $language = $word;
            $strictLanguage = true;
        }
        if (in_array($word, $resourceTypes)) {
            $type = $word;
            $strictType = true;
        }
        if (in_array($word, $imageWords)) {
            $contentType = 'image';
        }
        if (in_array($word, $soundWords)) {
            $contentType = 'sound';
        }
        $keywords[] = $word;
    }
    
    // returnam cuvintele cheie si alte informatii gasite
    return ['keywords' => array_values($keywords), 'language' => $language, 'type' => $type, 'contentType' => $contentType, 'strictType' => $strictType, 'strictLanguage' => $strictLanguage];
}

$processedQuery = processWords($query);
$words = $processedQuery['keywords'];
$language = $processedQuery['language'];
$type = $processedQuery['type'];
$contentType = $processedQuery['contentType'];
$strictType = $processedQuery['strictType'];
$strictLanguage = $processedQuery['strictLanguage'];

if (count($words) < 2) { 
    echo json_encode(["error" => "Please enter at least two meaningful words for the search."]);
    exit;
}

// mesaje de depanare pentru a verifica valorile procesate
error_log('Keywords: ' . json_encode($words));
error_log('Language: ' . $language);
error_log('Type: ' . $type);
error_log('Content Type: ' . $contentType);
error_log('Strict Type: ' . json_encode($strictType));
error_log('Strict Language: ' . json_encode($strictLanguage));


$sql = "SELECT *, 
        (";
foreach ($words as $index => $word) {
    $word = $conn->real_escape_string($word); // aici escapam cuvintele pentru siguranta
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
         WHERE language IN ('javascript', 'node.js', 'c++', 'c#')";

// adaugam filtre pentru diferite specificatii de limbaj, tipul de informatie
if ($strictLanguage && !empty($language)) {
    $sql .= " AND language = '$language'";
} elseif (!empty($language)) {
    $sql .= " AND language LIKE '%$language%'";
}

if ($strictType && !empty($type)) {
    $sql .= " AND type = '$type'";
} elseif (!empty($type)) {
    $sql .= " AND type LIKE '%$type%'";
}

if (!empty($contentType)) {
    if ($contentType == 'image') {
        $sql .= " AND type IN ('illustration', 'photo', 'graphic')";
    } elseif ($contentType == 'sound') {
        $sql .= " AND type IN ('audio', 'music')";
    }
}

$sql .= " HAVING match_count >= 2
         ORDER BY match_count DESC";

error_log('SQL Query: ' . $sql);

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
        error_log('No results found');
        $data = []; 
     }

    echo json_encode($data); // returnam datele ca JSON
} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}

$conn->close();
?>
