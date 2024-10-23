<?php
// session_start();
// include 'db_connection.php';  // Include the database connection file

// Set CORS headers to allow requests from the frontend (localhost:8100)
// header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
// header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
// header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Allow the necessary request methods
// header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers

// Handle preflight OPTIONS request for CORS
// if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
//     http_response_code(200);
//     exit();
// }

// Ensure the user is logged in
// if (!isset($_SESSION['user_id'])) {
//     echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
//     exit();
// }
// $user_id = $_SESSION['user_id']; // Get the logged-in user ID from session

// Check if the request method is POST
// if ($_SERVER['REQUEST_METHOD'] == 'POST') {

//     $data = json_decode(file_get_contents('php://input'), true);
//     if (!isset($data['ad_id']) || empty($data['ad_id'])) {
//         echo json_encode(array('status' => 'error', 'message' => 'Advertisement ID is missing.'));
//         exit();
//     }
//     $ad_id = $data['ad_id'];
//     // Insert into saved_ads table
//     $stmt = $conn->prepare("INSERT INTO saved_ads (user_id, ad_id) VALUES (?, ?)");
//     $stmt->bind_param("ii", $user_id, $ad_id);

//     // Execute the query and check for success
//     if ($stmt->execute()) {
//         echo json_encode(array('status' => 'success', 'message' => 'Advertisement saved successfully.'));
//     } else {
//         echo json_encode(array('status' => 'error', 'message' => 'Failed to save the advertisement.'));
//     }

//     $stmt->close(); // Close the prepared statement
// } else {
//     echo json_encode(array('status' => 'error', 'message' => 'Invalid request method.'));
// }

//$conn->close(); // Close the database connection

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

    // Check if the ad is already saved
    $checkStmt = $conn->prepare("SELECT id FROM saved_ads WHERE user_id = ? AND ad_id = ?");
    $checkStmt->bind_param("ii", $user_id, $ad_id);
    $checkStmt->execute();
    $result = $checkStmt->get_result();

    if ($result->num_rows > 0) {
        echo json_encode(array('status' => 'error', 'message' => 'Advertisement already saved.'));
        $checkStmt->close();
        exit();
    }
    $checkStmt->close();

    // Insert into saved_ads table
    $stmt = $conn->prepare("INSERT INTO saved_ads (user_id, ad_id) VALUES (?, ?)");
    $stmt->bind_param("ii", $user_id, $ad_id);

    // Execute the query and check for success
    if ($stmt->execute()) {
        echo json_encode(array('status' => 'success', 'message' => 'Advertisement saved successfully.'));
    } else {
        error_log("Error saving ad: " . $stmt->error);  // Log the error
        echo json_encode(array('status' => 'error', 'message' => 'Failed to save the advertisement.'));
    }

    $stmt->close(); // Close the prepared statement
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Invalid request method.'));
}

$conn->close(); // Close the database connection

?>




