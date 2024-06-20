<?php
include '../../db_connect.php';
header('Content-Type: application/json');

$sentence = isset($_GET['query']) ? $_GET['query'] : '';

if (empty($sentence)) {
    echo json_encode(["error" => "Query is empty"]);
    exit;
}

function processQuery($sentence) {
    $keywords = [];

    $languages = ['JavaScript', 'Node.js', 'C++', 'C', 'C#', 'Python'];
    foreach ($languages as $language) {
        if (stripos($sentence, $language) !== false) {
            $keywords['language'] = $language;
            break;
        }
    }

    if (stripos($sentence, 'tutorial') !== false) {
        $keywords['type'] = 'tutorial';
    } elseif (stripos($sentence, 'source code') !== false) {
        $keywords['type'] = 'source code';
    } elseif (stripos($sentence, 'site') !== false) {
        $keywords['type'] = 'site';
    }

    return $keywords;
}

$keywords = processQuery($sentence);

if (empty($keywords)) {
    echo json_encode(["error" => "No keywords found in query"]);
    exit;
}

$language = isset($keywords['language']) ? $keywords['language'] : '';
$type = isset($keywords['type']) ? $keywords['type'] : '';

$sql = "SELECT * FROM resources WHERE 1=1";
if (!empty($language)) {
    $sql .= " AND language LIKE '%$language%'";
}
if (!empty($type)) {
    $sql .= " AND type LIKE '%$type%'";
}

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
