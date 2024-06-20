<?php
header("Content-Type: application/json");
include 'db_connect.php';

try {
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["id"])) {
        $id = filter_var($conn->real_escape_string($_POST["id"]), FILTER_VALIDATE_INT);

        if ($id) {
            $sql = "DELETE FROM resources WHERE id=$id";
            if ($conn->query($sql) === TRUE) {
                echo json_encode(["message" => "Record deleted successfully"]);
            } else {
                http_response_code(500);
                echo json_encode(["error" => "Error executing query: " . $sql . " - " . $conn->error]);
            }
        } else {
            http_response_code(400);
            echo json_encode(["error" => "Invalid ID"]);
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
