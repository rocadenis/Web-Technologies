<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

header('Content-Type: application/json');
require_once __DIR__ . '/../database/db_connect.php';
// Get data from POST request
$data = json_decode(file_get_contents("php://input"), true);

if (isset($data['email']) && isset($data['password'])) {
    $email = $data['email'];
    $password = $data['password'];

    // Prepare and bind
    $stmt = $conn->prepare("SELECT id, password_hash FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($user_id, $password_hash);
    $stmt->fetch();

    if ($stmt->num_rows > 0 && password_verify($password, $password_hash)) {
        // Login successful, set session variables
        $_SESSION['user_id'] = $user_id; // Assuming 'id' is a unique identifier for the user
        $_SESSION['email'] = $email; // Store email in session to use later if needed

        // Optionally, set a session cookie with a custom expiration
        setcookie(session_name(), session_id(), [
            'expires' => time() + 86400, // 1 day from now
            'path' => '/',
            'domain' => $_SERVER['HTTP_HOST'],
            'secure' => true, // Set to true if using HTTPS
            'httponly' => true, // This helps mitigate XSS attacks
            'samesite' => 'Lax' // Helps mitigate CSRF attacks
        ]);

        echo json_encode(["success" => true, "message" => "Login successful."]);
    } else {
        echo json_encode(["success" => false, "message" => "Invalid email or password."]);
    }

    $stmt->close();
} else {
    echo json_encode(["success" => false, "message" => "Invalid input. Data received: " . json_encode($data)]);
}

$conn->close();
?>
