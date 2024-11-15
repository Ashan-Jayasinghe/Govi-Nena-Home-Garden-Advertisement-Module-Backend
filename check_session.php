<?php
session_start();
header('Content-Type: application/json');

// Set CORS headers to allow requests from the frontend (localhost:8100)
header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Allow the necessary request methods
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers

// Check if the session exists (user is logged in)
if (isset($_SESSION['user_id'])) {
    echo json_encode(true); // Session exists, user is logged in
} else {
    echo json_encode(false); // No session, user is not logged in
}
?>
