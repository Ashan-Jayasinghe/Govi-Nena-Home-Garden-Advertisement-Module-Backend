<?php
session_start();
include 'db_connection.php';

// Set CORS headers to allow requests from the frontend (localhost:8100)
header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Allow the necessary request methods
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers

if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}
$user_id = $_SESSION['user_id'];

$stmt = $conn->prepare("SELECT name, email, image_url FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->bind_result($name, $email, $image_url);
$stmt->fetch();

$baseUrl = "http://localhost/Govi-Nena-Home-Garden-Advertisement-Module-Backend/";
$profileImageUrl = $image_url ? $baseUrl . $image_url : null;

if ($name) {

    
    echo json_encode(array(
        'status' => 'success',
        'user' => array(
            'id' => $user_id,
            'name' => $name,
            'email' => $email,
            'profile_image' => $profileImageUrl  // Return profile image path
        )
    ));
} else {
    echo json_encode(array('status' => 'error', 'message' => 'User not found.'));
}

$stmt->close();
$conn->close();
?>