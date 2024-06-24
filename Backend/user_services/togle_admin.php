<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/../database/db_connect.php';

$id = $_POST['id'];
$is_admin = $_POST['is_admin'];

$sql = "UPDATE users SET is_admin = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $is_admin, $id);

if ($stmt->execute()) {
    echo json_encode(['message' => 'Admin status updated successfully']);
} else {
    echo json_encode(['error' => 'Error updating admin status']);
}

$stmt->close();
$conn->close();
?>
