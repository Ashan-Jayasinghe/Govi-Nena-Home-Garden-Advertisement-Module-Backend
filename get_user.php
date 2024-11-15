<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');

// Include your database connection script
require 'db_connection.php';

// Define the base path for the uploaded images
$baseImagePath = 'http://localhost/Govi-Nena-Home-Garden-Advertisement-Module-Backend/';

// Get the user_id from the URL parameter
if (isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];

    // Prepare the SQL query to fetch user data
    $sql = "SELECT name, image_url FROM users WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        
        // Prepend the base image path to the image_url
        if ($user['image_url']) {
            $user['image_url'] = $baseImagePath . $user['image_url'];
        }

        echo json_encode($user);
    } else {
        echo json_encode(array('message' => 'User not found'));
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(array('message' => 'Invalid request'));
}
?>
