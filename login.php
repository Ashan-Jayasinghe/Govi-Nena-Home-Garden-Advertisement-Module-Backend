<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Allow CORS requests from any origin
header("Access-Control-Allow-Origin: *");
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
            // Step 4: Create session (or token if needed)
            session_start();
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['user_name'] = $user['name'];

            // Step 5: Return success response
            echo json_encode(array(
                'status' => 'success',
                'message' => 'Login successful!',
                'user' => array(
                    'id' => $user['id'],
                    'name' => $user['name']
                )
            ));
        } else {
            // Step 6: Return error for incorrect password
            echo json_encode(array('status' => 'error', 'message' => 'Incorrect password.'));
        }
    } else {
        // Step 7: Return error if email not found
        echo json_encode(array('status' => 'error', 'message' => 'Email not found.'));
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
}
?>
