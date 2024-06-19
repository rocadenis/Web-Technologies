<?php
include 'db_connect.php';

try {
    $sql = "SELECT id, name, url, description FROM resources";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>" . htmlspecialchars($row["id"]) . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"name\", " . htmlspecialchars($row["id"]) . ")'>" . htmlspecialchars($row["name"]) . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"url\", " . htmlspecialchars($row["id"]) . ")'><a href='" . htmlspecialchars($row["url"]) . "'>" . htmlspecialchars($row["url"]) . "</a></td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"description\", " . htmlspecialchars($row["id"]) . ")'>" . htmlspecialchars($row["description"]) . "</td>
                    <td>
                        <button class='btn' onclick='deleteRow(" . htmlspecialchars($row["id"]) . ")'>Delete</button>
                    </td>
                  </tr>";
        }
    } else {
        echo "<tr><td colspan='5'>No results</td></tr>";
    }
} catch (Exception $e) {
    http_response_code(500);
    echo "Error: " . $e->getMessage();
}

$conn->close();
?>
