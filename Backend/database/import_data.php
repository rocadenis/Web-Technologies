<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['file']) && isset($_POST['type'])) {
    $fileType = $_POST['type'];
    $file = $_FILES['file']['tmp_name'];
    
    if ($fileType == 'csv') {
        $handle = fopen($file, 'r');
        while (($data = fgetcsv($handle, 1000, ',')) !== FALSE) {
            $name = $conn->real_escape_string($data[0]);
            $url = $conn->real_escape_string($data[1]);
            $description = $conn->real_escape_string($data[2]);
            $sql = "INSERT INTO resources (name, url, description) VALUES ('$name', '$url', '$description')";
            $conn->query($sql);
        }
        fclose($handle);
        echo "CSV data imported successfully.";
    } elseif ($fileType == 'json') {
        $data = json_decode(file_get_contents($file), true);
        foreach ($data as $row) {
            $name = $conn->real_escape_string($row['name']);
            $url = $conn->real_escape_string($row['url']);
            $description = $conn->real_escape_string($row['description']);
            $sql = "INSERT INTO resources (name, url, description) VALUES ('$name', '$url', '$description')";
            $conn->query($sql);
        }
        echo "JSON data imported successfully.";
    }
}
$conn->close();
?>
