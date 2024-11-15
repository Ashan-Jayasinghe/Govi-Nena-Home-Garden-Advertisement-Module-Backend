<?php
session_start();

// Allow CORS requests and credentials (required for sending cookies)
header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust to your frontend's domain
header("Access-Control-Allow-Credentials: true"); // Allows PHPSESSID to be sent with requests
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");


// Clear the session
session_unset();
session_destroy();

// Clear cookies if necessary
setcookie('PHPSESSID', '', time() - 3600, '/');

// Return success response
echo json_encode(array('status' => 'success', 'message' => 'Logged out successfully'));
?>
