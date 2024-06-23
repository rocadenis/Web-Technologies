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

if (!isset($input['new-email'])) {
    http_response_code(400); // Bad Request
    $response['message'] = 'Invalid input. Data received: ' . json_encode($input);
    echo json_encode($response);
    exit;
}

$newEmail = $input['new-email'];

// Validate the new email
if (!filter_var($newEmail, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400); // Bad Request
    $response['message'] = 'Invalid email format';
    echo json_encode($response);
    exit;
}

$userId = $_SESSION['user_id'];

// Check if the new email already exists
$stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
if (!$stmt) {
    http_response_code(500); // Internal Server Error
    $response['message'] = 'Database prepare error: ' . $conn->error;
    echo json_encode($response);
    exit;
}
$stmt->bind_param("s", $newEmail);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    $response['message'] = 'Email already in use.';
    echo json_encode($response);
    $stmt->close();
    exit;
} else {
    $stmt->close();

    // Update the user's email
    $stmt = $conn->prepare("UPDATE users SET email = ? WHERE id = ?");
    if (!$stmt) {
        http_response_code(500); // Internal Server Error
        $response['message'] = 'Database prepare error: ' . $conn->error;
        echo json_encode($response);
        exit;
    }
    $stmt->bind_param("si", $newEmail, $userId);

    if ($stmt->execute()) {
        $response['success'] = true;
        $response['message'] = 'Email updated successfully';
    } else {
        // Log the error for debugging
        error_log("Database error: " . $stmt->error);
        http_response_code(500); // Internal Server Error
        $response['message'] = 'Database error: ' . $stmt->error;
    }
    $stmt->close();
}

echo json_encode($response);
$conn->close();
?>
