<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/../database/db_connect.php';

$name = $_POST['name'];
$email = $_POST['email'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT);
$is_admin = isset($_POST['is_admin']) ? 1 : 0;

$sql = "INSERT INTO users (name, email, password_hash, is_admin) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssi", $name, $email, $password, $is_admin);

if ($stmt->execute()) {
    echo json_encode(['message' => 'User added successfully']);
} else {
    echo json_encode(['error' => 'Error adding user']);
}

$stmt->close();
$conn->close();
?>
