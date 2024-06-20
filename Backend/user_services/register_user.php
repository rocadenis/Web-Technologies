<?php
header('Content-Type: application/json');
include '../database/db_connect.php';

// Get data from POST request
$data = json_decode(file_get_contents("php://input"), true);

if (isset($data['name']) && isset($data['email']) && isset($data['password'])) {
    $name = $data['name'];
    $email = $data['email'];
    $password = $data['password'];
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
    echo json_encode(["success" => false, "message" => "Invalid input. Data received: " . json_encode($data)]);
}

$conn->close();
?>
