<?php
include 'db_connect.php';

$type = $_GET['type'] ?? 'csv';
$data = [];
$sql = "SELECT id, name, url, description FROM resources";
$result = $conn->query($sql);

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

if ($type == 'json') {
    header('Content-Type: application/json');
    header('Content-Disposition: attachment; filename="data.json"');
    echo json_encode($data);
} else {
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="data.csv"');
    $output = fopen('php://output', 'w');
    fputcsv($output, ['ID', 'Name', 'URL', 'Description']);
    foreach ($data as $row) {
        fputcsv($output, $row);
    }
    fclose($output);
}

$conn->close();
?>
