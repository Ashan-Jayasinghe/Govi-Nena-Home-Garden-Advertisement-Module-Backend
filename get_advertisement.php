<?php
include 'db_connection.php';

header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if (isset($_GET['id'])) {
    $ad_id = $_GET['id'];
    $sql = "SELECT * FROM advertisements WHERE id = ?";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $ad_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $ad = $result->fetch_assoc();
        echo json_encode($ad); // Return advertisement details as JSON
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'Advertisement not found.'));
    }
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Invalid request.'));
}

$conn->close();
?>
