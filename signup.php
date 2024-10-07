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
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';

    // Step 2: Validate email format
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(array('status' => 'error', 'message' => 'Invalid email format'));
        exit();
    }

    // Step 3: Validate password strength
    // Password must be at least 8 characters, include one uppercase, one lowercase, and one number
    if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$/', $password)) {
        echo json_encode(array('status' => 'error', 'message' => 'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, and a number.'));
        exit();
    }

    // Step 4: Hash the password for security
    $passwordHash = password_hash($password, PASSWORD_DEFAULT);

    // Step 5: Check if the email already exists in the users table
    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Step 6: If the email exists, return an error response
        echo json_encode(array('status' => 'error', 'message' => 'Email already exists'));
        exit();
    } else {
        // Step 7: Insert the new user into the users table
        $stmt = $conn->prepare("INSERT INTO users (name, email, password_hash) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $name, $email, $passwordHash);

        if ($stmt->execute()) {
            // Step 8: Send a success response if the user is registered
            echo json_encode(array('status' => 'success', 'message' => 'User registered successfully'));
        } else {
            // Step 9: Handle any errors during insertion
            echo json_encode(array('status' => 'error', 'message' => 'Signup failed: ' . $stmt->error));
        }
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
}
?>
