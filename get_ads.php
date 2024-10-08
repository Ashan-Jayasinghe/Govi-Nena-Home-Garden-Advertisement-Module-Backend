<?php
include 'db_connection.php';

header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$category = $_GET['category'];

if ($category) {
    $query = $conn->prepare("SELECT * FROM advertisements WHERE category = ?");
    $query->bind_param('s', $category);
    $query->execute();
    $result = $query->get_result();
    
    $ads = array();
    
    while ($row = $result->fetch_assoc()) {
        $ads[] = $row;
    }
    
    if (count($ads) > 0) {
        echo json_encode(array('status' => 'success', 'ads' => $ads));
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'No ads found'));
    }
    
    $query->close();
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Category not specified'));
}

$conn->close();
?>
