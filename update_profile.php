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

$name = isset($_POST['name']) ? $_POST['name'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';
$user_id = $_SESSION['user_id'];

// Handle file upload (optional)
if (isset($_FILES['profile_image'])) {
    $fileTmp = $_FILES['profile_image']['tmp_name'];
    $fileName = $_FILES['profile_image']['name'];
    $fileDest = 'uploads/profile_images/' . $fileName;
    move_uploaded_file($fileTmp, $fileDest);
    // Update user profile image in DB (if needed)
}

// Update name and email
$stmt = $conn->prepare("UPDATE users SET name = ?, email = ? WHERE id = ?");
$stmt->bind_param("ssi", $name, $email, $user_id);

if ($stmt->execute()) {
    $_SESSION['user_name'] = $name;
    $_SESSION['user_email'] = $email;
    echo json_encode(array('status' => 'success', 'message' => 'Profile updated successfully.'));
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Failed to update profile.'));
}

$stmt->close();
$conn->close();
?>
