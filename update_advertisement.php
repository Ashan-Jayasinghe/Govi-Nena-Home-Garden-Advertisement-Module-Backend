<?php
session_start();

// Set CORS headers to allow requests from the frontend (localhost:8100)
header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT"); // Allow the necessary request methods, including PUT
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit();
}

if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}

include 'db_connection.php';

// Retrieve the advertisement data from the request body
$data = json_decode(file_get_contents('php://input'), true);

// Log incoming data for debugging
error_log(print_r($data, true)); // This will log the incoming JSON data

// Validate the data
if (isset($data['advertisement_id']) && isset($data['title']) && isset($data['category'])) {
    // Sanitize inputs to prevent SQL injection
    $advertisement_id = mysqli_real_escape_string($conn, $data['advertisement_id']);
    $title = mysqli_real_escape_string($conn, $data['title']);
    $category = mysqli_real_escape_string($conn, $data['category']);
    $subcategory = mysqli_real_escape_string($conn, $data['subcategory']);
    $stock = mysqli_real_escape_string($conn, $data['stock']);
    $address = mysqli_real_escape_string($conn, $data['address']);
    $mobile = mysqli_real_escape_string($conn, $data['mobile']);
    $price = mysqli_real_escape_string($conn, $data['price']);
    $description = mysqli_real_escape_string($conn, $data['description']);

    // Update advertisement query
    $query = "UPDATE advertisements SET 
                title = '$title',
                category = '$category',
                subcategory = '$subcategory',
                stock = '$stock',
                address = '$address',
                mobile = '$mobile',
                description = '$description'
              WHERE id = '$advertisement_id' AND user_id = '{$_SESSION['user_id']}'";

    // Log the query for debugging
    error_log("Executing query: $query"); // Log the query

    // Execute the query
    if (mysqli_query($conn, $query)) {
        // If update is successful
        echo json_encode(['status' => 'success', 'message' => 'Advertisement updated successfully.']);
    } else {
        // If query fails, log the error
        error_log("Error executing query: " . mysqli_error($conn)); // Log the error
        echo json_encode(['status' => 'error', 'message' => 'Failed to update advertisement.']);
    }
} else {
    // If required fields are missing, log the error
    echo json_encode(['status' => 'error', 'message' => 'Invalid data provided.']);
}

mysqli_close($conn); // Close the database connection
?>