<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/../database/db_connect.php';

$id = $_POST['id'];
$column = $_POST['column'];
$editval = $_POST['editval'];

$sql = "UPDATE users SET $column = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $editval, $id);

if ($stmt->execute()) {
    echo json_encode(['message' => 'User updated successfully']);
} else {
    echo json_encode(['error' => 'Error updating user']);
}

$stmt->close();
$conn->close();
?>
