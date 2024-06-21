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
                $conn->begin_transaction();

                $conn->query("TRUNCATE TABLE resources");

                $conn->query("ALTER TABLE resources AUTO_INCREMENT = 1");

                $header = fgetcsv($handle, 1000, ',');

                $expectedHeader = ['ID', 'Name', 'URL', 'Description', 'Language', 'Type'];
                if ($header !== $expectedHeader) {
                    throw new Exception("CSV format invalid. Expected header: " . implode(',', $expectedHeader));
                }

                while (($data = fgetcsv($handle, 1000, ',')) !== FALSE) {
                    if (count($data) == 6) {
                        $id = filter_var($data[0], FILTER_SANITIZE_NUMBER_INT);
                        $name = filter_var($conn->real_escape_string($data[1]), FILTER_SANITIZE_STRING);
                        $url = filter_var($conn->real_escape_string($data[2]), FILTER_VALIDATE_URL);
                        $description = filter_var($conn->real_escape_string($data[3]), FILTER_SANITIZE_STRING);
                        $language = filter_var($conn->real_escape_string($data[4]), FILTER_SANITIZE_STRING);
                        $type = filter_var($conn->real_escape_string($data[5]), FILTER_SANITIZE_STRING);

                        if ($id && $name && $url && $description && $language && $type) {
                            $sql = "INSERT INTO resources (id, name, url, description, language, type) VALUES ('$id', '$name', '$url', '$description', '$language', '$type')";
                            $conn->query($sql);
                        }
                    }
                }

                fclose($handle);
                $conn->commit();
                echo json_encode(["message" => "CSV data imported successfully."]);
            } else {
                http_response_code(500);
                echo json_encode(["error" => "Failed to open the CSV file."]);
            }
        } elseif ($fileType == 'json') {
            $data = json_decode(file_get_contents($file), true);
            if (is_array($data)) {

                $conn->begin_transaction();

                $conn->query("TRUNCATE TABLE resources");

                // Reset auto increment
                $conn->query("ALTER TABLE resources AUTO_INCREMENT = 1");

                foreach ($data as $row) {
                    if (isset($row['id'], $row['name'], $row['url'], $row['description'], $row['language'], $row['type'])) {
                        $id = filter_var($row['id'], FILTER_SANITIZE_NUMBER_INT);
                        $name = filter_var($conn->real_escape_string($row['name']), FILTER_SANITIZE_STRING);
                        $url = filter_var($conn->real_escape_string($row['url']), FILTER_VALIDATE_URL);
                        $description = filter_var($conn->real_escape_string($row['description']), FILTER_SANITIZE_STRING);
                        $language = filter_var($conn->real_escape_string($row['language']), FILTER_SANITIZE_STRING);
                        $type = filter_var($conn->real_escape_string($row['type']), FILTER_SANITIZE_STRING);

                        if ($id && $name && $url && $description && $language && $type) {
                            $sql = "INSERT INTO resources (id, name, url, description, language, type) VALUES ('$id', '$name', '$url', '$description', '$language', '$type')";
                            $conn->query($sql);
                        }
                    }
                }

                $conn->commit();
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
    // Rollback transaction in case of error
    $conn->rollback();
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
}

$conn->close();
?>
