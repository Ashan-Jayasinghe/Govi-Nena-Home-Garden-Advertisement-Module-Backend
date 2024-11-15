<?php

// Set secure session cookie parameters for localhost
session_set_cookie_params(array(
    'lifetime' => 0, // Session lasts until the browser is closed
    'path' => '/',   // Cookie available throughout the localhost domain
    'domain' => 'localhost', // Use 'localhost' for local development
    'secure' => false, // Set to true in production when using HTTPS
    'httponly' => true, // Prevent JavaScript access to the session cookie
    'samesite' => 'Lax'  // 'Lax' to allow CORS POST requests with cookies
));
session_start(); // Start the session after setting the cookie params

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Allow CORS requests and credentials (required for sending cookies)
header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust to your frontend's domain
header("Access-Control-Allow-Credentials: true"); // Allows PHPSESSID to be sent with requests
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Include database connection
include 'db_connection.php';

// Handle OPTIONS request for CORS preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Step 1: Get form inputs from the request body
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';

    // Step 2: Check if the email exists in the users table
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // User exists
        $user = $result->fetch_assoc();
        
        // Step 3: Verify the password hash
        if (password_verify($password, $user['password_hash'])) {
            // Step 4: Create session
            session_regenerate_id(true); // Regenerate session ID to prevent session fixation
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_name'] = $user['name'];
            $_SESSION['user_email'] = $user['email'];

            // Debugging: Check session variables (optional)
            error_log("Session Variables: " . print_r($_SESSION, true));

            // Step 5: Return success response without exposing user details in cookies
            echo json_encode(array(
                'status' => 'success',
                'message' => 'Login successful!',
            ));
        } else {
            // Step 6: Return error for incorrect password
            echo json_encode(array('status' => 'error', 'message' => 'Invalid credentials.'));
        }
    } else {
        // Step 7: Return error if email not found
        echo json_encode(array('status' => 'error', 'message' => 'Invalid credentials.'));
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
}
?>
