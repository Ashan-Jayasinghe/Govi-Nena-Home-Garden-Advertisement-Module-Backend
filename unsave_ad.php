<?php
session_start();
include 'db_connection.php';  // Include the database connection file

// Set CORS headers to allow requests from the frontend (localhost:8100)
header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Allow the necessary request methods
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers

// Handle preflight OPTIONS request for CORS
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Ensure the user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}
$user_id = $_SESSION['user_id']; // Get the logged-in user ID from session

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $data = json_decode(file_get_contents('php://input'), true);
    if (!isset($data['ad_id']) || empty($data['ad_id'])) {
        echo json_encode(array('status' => 'error', 'message' => 'Advertisement ID is missing.'));
        exit();
    }
    $ad_id = $data['ad_id'];

    // Delete the saved ad from saved_ads table
    $stmt = $conn->prepare("DELETE FROM saved_ads WHERE user_id = ? AND ad_id = ?");
    $stmt->bind_param("ii", $user_id, $ad_id);

    // Execute the query and check for success
    if ($stmt->execute()) {
        echo json_encode(array('status' => 'success', 'message' => 'Advertisement unsaved successfully.'));
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'Failed to unsave the advertisement.'));
    }

    $stmt->close(); // Close the prepared statement
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Invalid request method.'));
}

$conn->close(); // Close the database connection
?>
