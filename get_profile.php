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

// Assuming you store user profile data in the session
echo json_encode(array(
    'status' => 'success',
    'user' => array(
        'name' => $_SESSION['user_name'],
        'email' => $_SESSION['user_email']
    )
));
?>
