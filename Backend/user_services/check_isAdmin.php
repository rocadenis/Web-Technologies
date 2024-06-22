<?php
session_start();

header('Content-Type: application/json');

$response = [
    'authenticated' => false,
    'is_admin' => false
];

if (isset($_SESSION['user_id'])) {
    require_once __DIR__ . '/../database/db_connect.php';
    $user_id = $_SESSION['user_id'];
    $stmt = $conn->prepare("SELECT is_admin FROM users WHERE id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $stmt->bind_result($is_admin);
    $stmt->fetch();
    $stmt->close();
    $conn->close();

    $response['authenticated'] = true;
    $response['is_admin'] = $is_admin;
}

echo json_encode($response);
?>
