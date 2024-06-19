<?php
header("Content-Type: application/json");
include 'db_connect.php';

try {
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"]) && isset($_POST["column"]) && isset($_POST["editval"])) {
        $id = filter_var($conn->real_escape_string($_POST["id"]), FILTER_VALIDATE_INT);
        $column = filter_var($conn->real_escape_string($_POST["column"]), FILTER_SANITIZE_STRING);
        $editval = filter_var($conn->real_escape_string($_POST["editval"]), FILTER_SANITIZE_STRING);

        if ($id && $column && $editval) {
            $sql = "UPDATE resources SET $column = '$editval' WHERE id = $id";

            if ($conn->query($sql) === TRUE) {
                echo json_encode(["message" => "Record updated successfully"]);
            } else {
                http_response_code(500);
                echo json_encode(["error" => "Error: " . $conn->error]);
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
