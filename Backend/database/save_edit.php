<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"]) && isset($_POST["column"]) && isset($_POST["editval"])) {
    $id = $conn->real_escape_string($_POST["id"]);
    $column = $conn->real_escape_string($_POST["column"]);
    $editval = $conn->real_escape_string($_POST["editval"]);

    $sql = "UPDATE resources SET $column = '$editval' WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "Record updated successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
} else {
    echo "Error: Invalid input";
}

$conn->close();
?>
