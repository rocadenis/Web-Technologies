<?php
header("Content-Type: application/json");
include 'db_connect.php';

try {
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["name"]) && isset($_POST["email"]) && isset($_POST["password"])) {
        $name = filter_var($conn->real_escape_string($_POST["name"]), FILTER_SANITIZE_STRING);
        $email = filter_var($conn->real_escape_string($_POST["email"]), FILTER_VALIDATE_EMAIL);
        $password = password_hash($conn->real_escape_string($_POST["password"]), PASSWORD_DEFAULT);
        $is_admin = 'No'; // Default for regular users

        if ($name && $email && $password) {
            $sql = "INSERT INTO users (name, email, password_hash, is_admin) VALUES ('$name', '$email', '$password', '$is_admin')";

            if ($conn->query($sql) === TRUE) {
                echo json_encode(["message" => "Registration successful!"]);
            } else {
                http_response_code(500);
                echo json_encode(["error" => "Error executing query: " . $conn->error]);
            }
        } else {
            http_response_code(400);
            echo json_encode(["error" => "Invalid input"]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["error" => "Invalid input"]);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
}

$conn->close();
?>
