<?php
session_start();

// Set CORS headers to allow requests from the frontend (localhost:8100)
header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Allow the necessary request methods
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers


if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}

include 'db_connection.php';

$password = isset($_POST['password']) ? $_POST['password'] : '';
$user_id = $_SESSION['user_id'];

// Hash the new password
$password_hash = password_hash($password, PASSWORD_BCRYPT);

$stmt = $conn->prepare("UPDATE users SET password_hash = ? WHERE id = ?");
$stmt->bind_param("si", $password_hash, $user_id);

if ($stmt->execute()) {
    echo json_encode(array('status' => 'success', 'message' => 'Password updated successfully.'));
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Failed to update password.'));
}

$stmt->close();
$conn->close();
?>
