<?php
header("Content-Type: text/html; charset=UTF-8");
require_once __DIR__ . '/../database/db_connect.php';

try {
    $sql = "SELECT * FROM resources";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>" . htmlspecialchars($row["id"], ENT_QUOTES, 'UTF-8') . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"name\", " . htmlspecialchars($row["id"], ENT_QUOTES, 'UTF-8') . ")'>" . htmlspecialchars($row["name"], ENT_QUOTES, 'UTF-8') . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"url\", " . htmlspecialchars($row["id"], ENT_QUOTES, 'UTF-8') . ")'><a href='" . htmlspecialchars($row["url"], ENT_QUOTES, 'UTF-8') . "'>" . htmlspecialchars($row["url"], ENT_QUOTES, 'UTF-8') . "</a></td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"description\", " . htmlspecialchars($row["id"], ENT_QUOTES, 'UTF-8') . ")'>" . htmlspecialchars($row["description"], ENT_QUOTES, 'UTF-8') . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"language\", " . htmlspecialchars($row["id"], ENT_QUOTES, 'UTF-8') . ")'>" . htmlspecialchars($row["language"], ENT_QUOTES, 'UTF-8') . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"type\", " . htmlspecialchars($row["id"], ENT_QUOTES, 'UTF-8') . ")'>" . htmlspecialchars($row["type"], ENT_QUOTES, 'UTF-8') . "</td>
                    <td>
                        <button class='btn' onclick='deleteRow(" . htmlspecialchars($row["id"], ENT_QUOTES, 'UTF-8') . ")'>Delete</button>
                    </td>
                  </tr>";
        }
    } else {
        echo "<tr><td colspan='7'>No results</td></tr>";
    }
} catch (Exception $e) {
    http_response_code(500);
    echo "<tr><td colspan='7'>Error: " . htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8') . "</td></tr>";
}

$conn->close();
?>
