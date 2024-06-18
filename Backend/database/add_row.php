<?php
include 'db_connect.php';

try {
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["name"]) && isset($_POST["url"]) && isset($_POST["description"])) {
        $name = $conn->real_escape_string($_POST["name"]);
        $url = $conn->real_escape_string($_POST["url"]);
        $description = $conn->real_escape_string($_POST["description"]);

        $sql = "INSERT INTO resources (name, url, description) VALUES ('$name', '$url', '$description')";

        if ($conn->query($sql) === TRUE) {
            echo "New record created successfully";
        } else {
            http_response_code(500);
            echo "Error executing query: " . $sql . " - " . $conn->error;
        }
    } else {
        http_response_code(400);
        echo "Error: Invalid input";
    }
} catch (Exception $e) {
    http_response_code(500);
    echo "Error: " . $e->getMessage();
}

$conn->close();
?>
