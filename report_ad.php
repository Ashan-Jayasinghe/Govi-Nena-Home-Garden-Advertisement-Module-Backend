<?php
// Start session for user authentication
session_start();

// Include the database connection file
include 'db_connection.php'; // Adjust the path to match your project structure

// Set CORS headers to allow requests from the frontend
header("Access-Control-Allow-Origin: http://localhost:8100"); // Update with your frontend URL if different
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Check if the user is authenticated
if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}

$user_id = $_SESSION['user_id']; // Retrieve the logged-in user ID

// Handle only POST requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and validate POST data
    $advertisement_id = isset($_POST['advertisement_id']) ? intval($_POST['advertisement_id']) : null;
    $reason = isset($_POST['reason']) ? trim($_POST['reason']) : null;
    $comments = isset($_POST['comments']) ? trim($_POST['comments']) : null;
    $email = isset($_POST['email']) ? trim($_POST['email']) : null;

    // Check for required fields
    if (!$advertisement_id || !$reason) {
        echo json_encode(array('status' => 'error', 'message' => 'Missing required fields: advertisement_id and reason.'));
        exit();
    }

    // Optional email validation
    if ($email && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(array('status' => 'error', 'message' => 'Invalid email address.'));
        exit();
    }

    // Prepare and execute the SQL query to insert the report
    $stmt = $conn->prepare(
        "INSERT INTO reports (advertisement_id, reason, comments, email, created_at) 
         VALUES (?, ?, ?, ?, NOW())"
    );
    $stmt->bind_param("isss", $advertisement_id, $reason, $comments, $email);

    // Execute the statement and check for success
    if ($stmt->execute()) {
        echo json_encode(array('status' => 'success', 'message' => 'Report submitted successfully.'));
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'Failed to submit report: ' . $stmt->error));
    }

    // Close the prepared statement
    $stmt->close();
} else {
    // Handle invalid request methods
    echo json_encode(array('status' => 'error', 'message' => 'Invalid request method.'));
}

// Close the database connection
$conn->close();
?>