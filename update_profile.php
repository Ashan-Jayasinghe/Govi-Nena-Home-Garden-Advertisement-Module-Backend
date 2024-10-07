<?php
session_start();

// Set CORS headers to allow requests from the frontend (localhost:8100)
header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Allow the necessary request methods
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers


if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}

include 'db_connection.php';

$name = isset($_POST['name']) ? $_POST['name'] : '';
$email = isset($_POST['email']) ? $_POST['email'] : '';
$user_id = $_SESSION['user_id'];


// Initialize profileImage variable to store the image path
$profileImagePath = null;

if (isset($_FILES['profileImage']) && $_FILES['profileImage']['error'] == 0) {
    $fileTmp = $_FILES['profileImage']['tmp_name'];
    $fileName = time() . '_' . $_FILES['profileImage']['name'];  // Add a timestamp to the filename to avoid conflicts
    $fileDest = 'uploads/profile_images/' . $fileName;

    // Ensure the uploads directory exists
    if (!is_dir('uploads/profile_images')) {
        mkdir('uploads/profile_images', 0777, true);
    }

    if (move_uploaded_file($fileTmp, $fileDest)) {
        $profileImagePath = $fileDest;  // Set the profile image path to be stored in the DB
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'Failed to upload image.'));
        exit();
    }
}

// Update name, email, and profile image in the database
if ($profileImagePath) {
    $stmt = $conn->prepare("UPDATE users SET name = ?, email = ?, image_url = ? WHERE id = ?");
    $stmt->bind_param("sssi", $name, $email, $profileImagePath, $user_id);
} else {
    // If no image was uploaded, just update name and email
    $stmt = $conn->prepare("UPDATE users SET name = ?, email = ? WHERE id = ?");
    $stmt->bind_param("ssi", $name, $email, $user_id);
}
if ($stmt->execute()) {
    $_SESSION['user_name'] = $name;
    $_SESSION['user_email'] = $email;

    if ($profileImagePath) {
        $_SESSION['user_profile_image'] = $profileImagePath;  // Store the profile image in the session as well
    }
    echo json_encode(array('status' => 'success', 'message' => 'Profile updated successfully.'));
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Failed to update profile.'));
}

$stmt->close();
$conn->close();
?>
