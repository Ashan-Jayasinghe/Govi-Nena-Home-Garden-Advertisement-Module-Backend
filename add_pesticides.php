<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Allow CORS requests from localhost:8100 (Ionic app)
header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

include 'db_connection.php';  // Include the database connection file

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Step 1: Insert common attributes into the advertisements table
    $category = $_POST['category'];   // 'Agro Chemicals' in this case
    $subcategory = $_POST['subcategory'];  // 'Pesticides'
    $title = $_POST['title'];
    $stock = $_POST['stock'];
    $address = $_POST['address'];
    $mobile = $_POST['mobile'];
    $acceptTerms = isset($_POST['acceptTerms']) ? 1 : 0;  // Convert checkbox value

    // Prepare the statement for common attributes
    $stmt = $conn->prepare("INSERT INTO advertisements (category, subcategory, title, stock, address, mobile, accept_terms) VALUES (?, ?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
        die("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param("sssissi", $category, $subcategory, $title, $stock, $address, $mobile, $acceptTerms);

    if (!$stmt->execute()) {
        die("Execute failed: " . $stmt->error);
    }

    $advertisement_id = $stmt->insert_id;  // Get the inserted advertisement ID

    // Step 2: Insert unique attributes for pesticides (without the 'specification' column)
    $type = $_POST['type'];
    $applicationRatio = $_POST['applicationRatio'];
    $price1L = $_POST['price1L'];
    $price5L = $_POST['price5L'];
    $price10L = $_POST['price10L'];

    $pesticides_stmt = $conn->prepare("INSERT INTO advertisement_pesticides (advertisement_id, type, application_ratio, price_1L, price_5L, price_10L) VALUES (?, ?, ?, ?, ?, ?)");
    if (!$pesticides_stmt) {
        die("Prepare failed: " . $conn->error);
    }

    $pesticides_stmt->bind_param("isdsss", $advertisement_id, $type, $applicationRatio, $price1L, $price5L, $price10L);

    if (!$pesticides_stmt->execute()) {
        die("Execute failed: " . $pesticides_stmt->error);
    }

    // Step 3: Insert images into advertisement_images table
    if (isset($_FILES['images'])) {
        $imageCount = count($_FILES['images']['name']);
        for ($i = 0; $i < $imageCount; $i++) {
            $imagePath = 'uploads/' . basename($_FILES['images']['name'][$i]);
            move_uploaded_file($_FILES['images']['tmp_name'][$i], $imagePath);

            $image_stmt = $conn->prepare("INSERT INTO advertisement_images (advertisement_id, image_path) VALUES (?, ?)");
            if (!$image_stmt) {
                die("Prepare failed: " . $conn->error);
            }

            $image_stmt->bind_param("is", $advertisement_id, $imagePath);

            if (!$image_stmt->execute()) {
                die("Execute failed: " . $image_stmt->error);
            }
        }
    }

    // Step 4: Insert specifications into advertisement_specifications table
    if (isset($_POST['specifications'])) {
        foreach ($_POST['specifications'] as $specification) {
            $spec_stmt = $conn->prepare("INSERT INTO advertisement_specifications (advertisement_id, specification) VALUES (?, ?)");
            if (!$spec_stmt) {
                die("Prepare failed: " . $conn->error);
            }

            $spec_stmt->bind_param("is", $advertisement_id, $specification);

            if (!$spec_stmt->execute()) {
                die("Execute failed: " . $spec_stmt->error);
            }
        }
    }

    // Success response
    echo json_encode(array('status' => 'success', 'message' => 'Pesticide advertisement successfully submitted'));
    
    $stmt->close();
}
$conn->close();
?>
