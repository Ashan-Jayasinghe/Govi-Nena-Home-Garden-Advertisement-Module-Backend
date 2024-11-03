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

$user_id = $_SESSION['user_id'];
$current_password = isset($_POST['currentPassword']) ? $_POST['currentPassword'] : '';
$new_password = isset($_POST['newPassword']) ? $_POST['newPassword'] : '';

// Fetch the current hashed password from the database
$stmt = $conn->prepare("SELECT password_hash FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->bind_result($hashed_password);
$stmt->fetch();
$stmt->close();

// Verify the current password
if (!password_verify($current_password, $hashed_password)) {
    echo json_encode(array('status' => 'error', 'message' => 'Current password is incorrect.'));
    exit();
}

// Hash the new password
$new_password_hash = password_hash($new_password, PASSWORD_BCRYPT);

// Update the password in the database
$stmt = $conn->prepare("UPDATE users SET password_hash = ? WHERE id = ?");
$stmt->bind_param("si", $new_password_hash, $user_id);

if ($stmt->execute()) {
    echo json_encode(array('status' => 'success', 'message' => 'Password updated successfully.'));
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Failed to update password.'));
}

$stmt->close();
$conn->close();
?>