<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

header('Content-Type: application/json');
require_once __DIR__ . '/../database/db_connect.php';

// Get data from POST request
$input = json_decode(file_get_contents("php://input"), true);

if (isset($input['name']) && isset($input['email']) && isset($input['password'])) {
    $name = $input['name'];
    $email = $input['email'];
    $password = $input['password'];
    $password_hash = password_hash($password, PASSWORD_DEFAULT);

    // Check if the email already exists
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        echo json_encode(["success" => false, "message" => "Email already registered."]);
        $stmt->close();
    } else {
        // Insert the new user
        $stmt->close();
        $stmt = $conn->prepare("INSERT INTO users (name, email, password_hash) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $name, $email, $password_hash);

        if ($stmt->execute()) {
            echo json_encode(["success" => true, "message" => "User registered successfully."]);
        } else {
            echo json_encode(["success" => false, "message" => "Error: " . $stmt->error]);
        }
        $stmt->close();
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid input. Data received: " . json_encode($input)]);
}

$conn->close();
?>
