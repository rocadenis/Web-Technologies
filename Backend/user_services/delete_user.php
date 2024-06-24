<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/../database/db_connect.php';

$id = $_POST['id'];

$sql = "DELETE FROM users WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo json_encode(['message' => 'User deleted successfully']);
} else {
    echo json_encode(['error' => 'Error deleting user']);
}

$stmt->close();
$conn->close();
?>
