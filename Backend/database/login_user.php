<?php
include 'db_connect.php';

$email = $_POST['email'];
$password = $_POST['password'];

$sql = "SELECT id, name, password_hash";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->bind_result($id, $name, $hashed_password);
$stmt->fetch();

if (password_verify($password, $hashed_password)) {
    session_start();
    $_SESSION['user_id'] = $id;
    $_SESSION['name'] = $name;
    echo "Login successful!";
} else {
    echo "Invalid email or password!";
}

$stmt->close();
$conn->close();
?>
