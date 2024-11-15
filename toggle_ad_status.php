<?php
session_start();
include 'db_connection.php';

header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-HTTP-Method-Override");

// Check for the user session
if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}

$user_id = $_SESSION['user_id'];

// Handle preflight OPTIONS request for CORS
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Check if request is POST but using PUT method override
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_SERVER['HTTP_X_HTTP_METHOD_OVERRIDE']) && $_SERVER['HTTP_X_HTTP_METHOD_OVERRIDE'] == 'PUT') {
    // Get input data
    $data = json_decode(file_get_contents('php://input'), true);

    // Validate input data
    if (!isset($data['id']) || !isset($data['is_active'])) {
        echo json_encode(array('status' => 'error', 'message' => 'Invalid input.'));
        exit();
    }

    $ad_id = (int)$data['id'];
    $is_active = $data['is_active'] ? 1 : 0;

    // Update advertisement's is_active status
    $stmt = $conn->prepare("UPDATE advertisements SET is_active = ? WHERE id = ? AND user_id = ?");
    $stmt->bind_param("iii", $is_active, $ad_id, $user_id);

    if ($stmt->execute()) {
        echo json_encode(array('status' => 'success', 'message' => 'Advertisement status updated successfully.'));
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'Failed to update advertisement status.'));
    }

    $stmt->close();
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Invalid request method.'));
}

$conn->close();
?>
