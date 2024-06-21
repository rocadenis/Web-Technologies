<?php
header("Content-Type: text/html; charset=UTF-8");
include 'db_connect.php';


try {
    $sql = "SELECT * FROM resources";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>" . htmlspecialchars($row["id"]) . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"name\", " . htmlspecialchars($row["id"]) . ")'>" . htmlspecialchars($row["name"]) . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"url\", " . htmlspecialchars($row["id"]) . ")'><a href='" . htmlspecialchars($row["url"]) . "'>" . htmlspecialchars($row["url"]) . "</a></td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"description\", " . htmlspecialchars($row["id"]) . ")'>" . htmlspecialchars($row["description"]) . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"language\", " . htmlspecialchars($row["id"]) . ")'>" . htmlspecialchars($row["language"]) . "</td>
                    <td contenteditable='true' onBlur='saveToDatabase(this, \"type\", " . htmlspecialchars($row["id"]) . ")'>" . htmlspecialchars($row["type"]) . "</td>
                    <td>
                        <button class='btn' onclick='deleteRow(" . htmlspecialchars($row["id"]) . ")'>Delete</button>
                    </td>
                  </tr>";
        }
    } else {
        echo "<tr><td colspan='7'>No results</td></tr>";
    }
} catch (Exception $e) {
    http_response_code(500);
    echo "<tr><td colspan='7'>Error: " . $e->getMessage() . "</td></tr>";
}

$conn->close();
?>
