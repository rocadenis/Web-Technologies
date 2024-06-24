<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require '../../vendor/autoload.php';
require_once __DIR__ . '/../database/db_connect.php';

header('Content-Type: application/json');

function askGPT35($query, $apiKey) {
    $url = 'https://api.openai.com/v1/chat/completions';
    $headers = [
        "Content-Type: application/json",
        "Authorization: Bearer $apiKey"
    ];
    $body = json_encode([
        "model" => "gpt-4-turbo",
        "messages" => [
            [
                "role" => "system",
                "content" => "Dont use formatters as ```, output simple text only. Provide the response only using a single json structure in the response and nothing else. The most important thing in the query is the user prompt."
            ],
            [
                "role" => "user",
                "content" => $query
            ]
        ],
        "max_tokens" => 1024,
        "temperature" => 0
    ]);

    $options = [
        'http' => [
            'header'  => implode("\r\n", $headers),
            'method'  => 'POST',
            'content' => $body
        ]
    ];
    $context  = stream_context_create($options);
    $result = file_get_contents($url, false, $context);

    if ($result === FALSE) {
        $error = error_get_last();
        return ['error' => 'Failed to make request: ' . $error['message']];
    }

    return json_decode($result, true);
}

$query = isset($_GET['query']) ? $_GET['query'] : '';

if (empty($query)) {
    echo json_encode(["error" => "Query is empty"]);
    exit;
}

function processWords($sentence) {
    $stopWords = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'but', 'by', 'for', 'if', 'in', 'into', 'is', 'it', 'no', 'not', 'of', 'on', 'or', 'such', 'that', 'the', 'their', 'then', 'there', 'these', 'they', 'this', 'to', 'was', 'will', 'with'];
    $synonyms = [
        'js' => 'javascript',
        'py' => 'python',
        'cpp' => 'c++',
        'csharp' => 'c#',
        'rb' => 'ruby',
        'frontend' => 'front-end',
        'backend' => 'back-end',
        'html' => 'hypertext markup language',
        'css' => 'cascading style sheets',
        'sql' => 'structured query language',
        'nosql' => 'non-relational database',
        'ai' => 'artificial intelligence',
        'ml' => 'machine learning',
        'ux' => 'user experience',
        'ui' => 'user interface',
        'devops' => 'development operations',
        'api' => 'application programming interface',
        'tdd' => 'test driven development',
        'ci/cd' => 'continuous integration continuous deployment',
        'rest' => 'representational state transfer',
        'soap' => 'simple object access protocol',
        'graphql' => 'graph query language',
        'oop' => 'object oriented programming',
        'tutorial' => 'guide',
        'tutorials' => 'guide',
        'code' => 'source code',
        'website' => 'site',
        'orm' => 'object relational mapper'
    ];

    $words = explode(' ', strtolower($sentence));
    $filteredWords = array_diff($words, $stopWords);

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

$sql = "SELECT *, 
        (";
foreach ($words as $index => $word) {
    $word = $conn->real_escape_string($word);
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

    // Make the request to OpenAI API using the askGPT35 function
    $apiKey = 'sk-proj-ZiH2V0mV1grSHdQBKvIKT3BlbkFJQgkphVJcnqhMGyNvzEnB';
    $openaiQuery = 'Provide a summary for the following data: ' . json_encode($data);
    $openaiResponse = askGPT35($openaiQuery, $apiKey);

    if (isset($openaiResponse['error'])) {
        throw new Exception($openaiResponse['error']);
    }

    if (!isset($openaiResponse['choices'][0]['message']['content'])) {
        throw new Exception('Unexpected OpenAI response format');
    }

    $openaiSummary = json_decode($openaiResponse['choices'][0]['message']['content'], true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Error decoding OpenAI summary: ' . json_last_error_msg());
    }

    $data['openai_summary'] = $openaiSummary;

    echo json_encode($data);
} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}

$conn->close();
?>
