<?php
include '../database/db_connect.php';
header("Content-Type: application/json");

$searchTerm = isset($_GET['q']) ? $conn->real_escape_string($_GET['q']) : '';
$language = isset($_GET['language']) ? $conn->real_escape_string($_GET['language']) : '';
$purpose = '';
$type = '';

// Extract purpose and type from the search term
preg_match('/(?:make|create|build) (.+?) (?:using|in|with) (.+?)(?:\.)/i', $searchTerm, $matches);

if (count($matches) >= 3) {
    $purpose = $conn->real_escape_string($matches[1]);
    $type = $conn->real_escape_string($matches[2]);
}

$sql = "SELECT * FROM resources WHERE (name LIKE '%$searchTerm%' OR description LIKE '%$searchTerm%' OR purpose LIKE '%$purpose%' OR type LIKE '%$type%' OR language LIKE '%$language%')";

$result = $conn->query($sql);
$data = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

echo json_encode($data);
$conn->close();
?>
