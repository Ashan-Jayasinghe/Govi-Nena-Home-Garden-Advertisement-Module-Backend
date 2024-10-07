<?php
session_start();

header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
header("Access-Control-Allow-Methods: POST, GET, OPTIONS"); // Allow the necessary request methods
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers

if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}

include 'db_connection.php';

// Query to fetch advertisements for the logged-in user
$user_id = $_SESSION['user_id'];
$stmt = $conn->prepare("SELECT title, description FROM advertisements WHERE user_id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$ads = array();
while ($row = $result->fetch_assoc()) {
    $ads[] = $row;
}

echo json_encode(array('status' => 'success', 'ads' => $ads));

$stmt->close();
$conn->close();
?>
