<?php
include 'db_connect.php';

$sql = "SELECT id, name, url, description FROM resources";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["id"]. "</td>
                <td contenteditable='true' onBlur='saveToDatabase(this, \"name\", " . $row["id"] . ")'>" . $row["name"]. "</td>
                <td contenteditable='true' onBlur='saveToDatabase(this, \"url\", " . $row["id"] . ")'><a href='" . $row["url"]. "'>" . $row["url"]. "</a></td>
                <td contenteditable='true' onBlur='saveToDatabase(this, \"description\", " . $row["id"] . ")'>" . $row["description"]. "</td>
                <td>
                    <button class='btn' onclick='deleteRow(" . $row["id"] . ")'>Delete</button>
                </td>
              </tr>";
    }
} else {
    echo "<tr><td colspan='5'>No results</td></tr>";
}
$conn->close();
?>
