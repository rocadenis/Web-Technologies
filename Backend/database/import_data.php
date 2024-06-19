<?php
header("Content-Type: application/json");
include 'db_connect.php';

try {
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['file']) && isset($_POST['type'])) {
        $fileType = filter_var($_POST['type'], FILTER_SANITIZE_STRING);
        $file = $_FILES['file']['tmp_name'];
        
        if ($fileType == 'csv') {
            $handle = fopen($file, 'r');
            if ($handle !== FALSE) {
                // Optional: Clear existing data if needed
                // $conn->query("TRUNCATE TABLE resources");

                // Skip the header row
                $headers = fgetcsv($handle, 1000, ',');
                if ($headers !== FALSE && count($headers) === 3) {
                    while (($data = fgetcsv($handle, 1000, ',')) !== FALSE) {
                        if (count($data) === 3) {
                            $name = filter_var($conn->real_escape_string($data[0]), FILTER_SANITIZE_STRING);
                            $url = filter_var($conn->real_escape_string($data[1]), FILTER_VALIDATE_URL);
                            $description = filter_var($conn->real_escape_string($data[2]), FILTER_SANITIZE_STRING);

                            if ($name && $url && $description) {
                                $sql = "INSERT INTO resources (name, url, description) VALUES ('$name', '$url', '$description')";
                                $conn->query($sql);
                            }
                        }
                    }
                    fclose($handle);
                    echo json_encode(["message" => "CSV data imported successfully."]);
                } else {
                    http_response_code(400);
                    echo json_encode(["error" => "Invalid CSV format."]);
                }
            } else {
                http_response_code(500);
                echo json_encode(["error" => "Error opening the file."]);
            }
        } elseif ($fileType == 'json') {
            $data = json_decode(file_get_contents($file), true);
            if (is_array($data)) {
                // Optional: Clear existing data if needed
                // $conn->query("TRUNCATE TABLE resources");

                foreach ($data as $row) {
                    if (isset($row['name']) && isset($row['url']) && isset($row['description'])) {
                        $name = filter_var($conn->real_escape_string($row['name']), FILTER_SANITIZE_STRING);
                        $url = filter_var($conn->real_escape_string($row['url']), FILTER_VALIDATE_URL);
                        $description = filter_var($conn->real_escape_string($row['description']), FILTER_SANITIZE_STRING);

                        if ($name && $url && $description) {
                            $sql = "INSERT INTO resources (name, url, description) VALUES ('$name', '$url', '$description')";
                            $conn->query($sql);
                        }
                    }
                }
                echo json_encode(["message" => "JSON data imported successfully."]);
            } else {
                http_response_code(400);
                echo json_encode(["error" => "Invalid JSON format."]);
            }
        } else {
            http_response_code(400);
            echo json_encode(["error" => "Invalid file type."]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["error" => "Invalid input."]);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
}

$conn->close();
?>
