<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

header('Content-Type: application/json');
require_once __DIR__ . '/../database/db_connect.php';

// Initialize response array
$response = array('success' => false, 'message' => '');

// Ensure the user is logged in
if (!isset($_SESSION['user_id'])) {
    http_response_code(401); // Unauthorized
    $response['message'] = 'User not logged in';
    echo json_encode($response);
    exit;
}

// Get the input data
$input = json_decode(file_get_contents("php://input"), true);

// Log received input for debugging
error_log('Received input: ' . print_r($input, true));

if (!isset($input['current-password']) || !isset($input['new-password'])) {
    http_response_code(400); // Bad Request
    $response['message'] = 'Invalid input. Data received: ' . json_encode($input);
    echo json_encode($response);
    exit;
}

$currentPassword = $input['current-password'];
$newPassword = $input['new-password'];
$userId = $_SESSION['user_id'];

// Validate new password (you can add more validation rules here)
if (strlen($newPassword) < 6) {
    http_response_code(400); // Bad Request
    $response['message'] = 'New password must be at least 6 characters long';
    echo json_encode($response);
    exit;
}

// Fetch the current password hash from the database
$stmt = $conn->prepare("SELECT password_hash FROM users WHERE id = ?");
if (!$stmt) {
    http_response_code(500); // Internal Server Error
    $response['message'] = 'Database prepare error: ' . $conn->error;
    echo json_encode($response);
    exit;
}
$stmt->bind_param("i", $userId);
$stmt->execute();
$stmt->bind_result($passwordHash);
$stmt->fetch();
$stmt->close();

// Verify the current password
if (!password_verify($currentPassword, $passwordHash)) {
    http_response_code(400); // Bad Request
    $response['message'] = 'Current password is incorrect';
    echo json_encode($response);
    exit;
}

// Hash the new password
$newPasswordHash = password_hash($newPassword, PASSWORD_DEFAULT);

// Update the user's password
$stmt = $conn->prepare("UPDATE users SET password_hash = ? WHERE id = ?");
if (!$stmt) {
    http_response_code(500); // Internal Server Error
    $response['message'] = 'Database prepare error: ' . $conn->error;
    echo json_encode($response);
    exit;
}
$stmt->bind_param("si", $newPasswordHash, $userId);

if ($stmt->execute()) {
    $response['success'] = true;
    $response['message'] = 'Password updated successfully';
} else {
    // Log the error for debugging
    error_log("Database error: " . $stmt->error);
    http_response_code(500); // Internal Server Error
    $response['message'] = 'Database error: ' . $stmt->error;
}
$stmt->close();

echo json_encode($response);
$conn->close();
?>
