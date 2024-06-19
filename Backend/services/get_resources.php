<?php
include '../database/db_connect.php';
header("Content-Type: application/json");

$sql = "SELECT * FROM resources";
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
