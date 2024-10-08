<?php
include 'db_connection.php';

header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$category = $_GET['category'];

if ($category) {
    // Join the advertisements table with the relevant unique attributes and images tables
    $query = $conn->prepare("
        SELECT 
            a.*, 
            d.condition_, 
            d.rent_or_sell, 
            d.manufacturer, 
            d.price, 
            i.image_path 
        FROM 
            advertisements a 
        LEFT JOIN 
            advertisement_dryers d ON a.id = d.advertisement_id 
        LEFT JOIN 
            advertisement_images i ON a.id = i.advertisement_id 
        WHERE 
            a.category = ?
    ");
    $query->bind_param('s', $category);
    $query->execute();
    $result = $query->get_result();
    
    $ads = array();
    
    while ($row = $result->fetch_assoc()) {
        // If you want to handle multiple images, you can group them
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
