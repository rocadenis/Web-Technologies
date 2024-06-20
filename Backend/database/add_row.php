<?php
header("Content-Type: application/json");
include '../../db_connect.php';

try {
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["name"]) && isset($_POST["url"]) && isset($_POST["description"]) && isset($_POST["language"]) && isset($_POST["type"])) {
        $name = filter_var($conn->real_escape_string($_POST["name"]), FILTER_SANITIZE_STRING);
        $url = filter_var($conn->real_escape_string($_POST["url"]), FILTER_VALIDATE_URL);
        $description = filter_var($conn->real_escape_string($_POST["description"]), FILTER_SANITIZE_STRING);
        $language = filter_var($conn->real_escape_string($_POST["language"]), FILTER_SANITIZE_STRING);
        $type = filter_var($conn->real_escape_string($_POST["type"]), FILTER_SANITIZE_STRING);

        if ($url) {
            $sql = "INSERT INTO resources (name, url, description, language, type) VALUES ('$name', '$url', '$description', '$language', '$type')";
            if ($conn->query($sql) === TRUE) {
                echo json_encode(["message" => "New record created successfully"]);
            } else {
                http_response_code(500);
                echo json_encode(["error" => "Error executing query: " . $sql . " - " . $conn->error]);
            }
        } else {
            http_response_code(400);
            echo json_encode(["error" => "Invalid URL"]);
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
