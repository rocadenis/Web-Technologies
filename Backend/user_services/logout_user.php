<?php
session_start();  // Start the session if not already started

header('Content-Type: application/json');

// Check if the user is logged in
if (isset($_SESSION['user_id'])) {
    // Unset all of the session variables.
    $_SESSION = array();

    // If it's desired to kill the session, also delete the session cookie.
    // Note: This will destroy the session, and not just the session data!
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
    }

    // Finally, destroy the session.
    session_destroy();

    // Send a success response to the client
    echo json_encode(["success" => true, "message" => "Logout successful."]);
} else {
    // If no session exists, indicate that the user was not logged in
    echo json_encode(["success" => false, "message" => "No user was logged in."]);
}
?>
