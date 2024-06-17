<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["name"]) && isset($_POST["url"]) && isset($_POST["description"])) {
    $name = $conn->real_escape_string($_POST["name"]);
    $url = $conn->real_escape_string($_POST["url"]);
    $description = $conn->real_escape_string($_POST["description"]);

    $sql = "INSERT INTO resources (name, url, description) VALUES ('$name', '$url', '$description')";

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Error: Invalid input";
}

$conn->close();
?>
