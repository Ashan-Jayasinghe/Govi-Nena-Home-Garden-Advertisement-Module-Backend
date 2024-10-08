<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Allow CORS requests from any origin
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

include 'db_connection.php';  // Include the database connection file

// Check for the existence of the 'uploads' folder and create it if it doesn't exist
$uploadDir = 'uploads/';
if (!is_dir($uploadDir)) {
    if (!mkdir($uploadDir, 0777, true)) {
        echo json_encode(array('status' => 'error', 'message' => 'Failed to create uploads directory.'));
        exit;
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Step 1: Insert common attributes into the advertisements table
    $category = $_POST['category'];
    $subcategory = $_POST['subcategory'];
    $title = $_POST['title'];
    $stock = $_POST['stock'];
    $address = $_POST['address'];
    $mobile = $_POST['mobile'];
    $description = $_POST['description'];
    $acceptTerms = isset($_POST['acceptTerms']) ? 1 : 0;
    // Prepare the statement for common attributes
    $stmt = $conn->prepare("INSERT INTO advertisements (category, subcategory, title, stock, address, mobile, accept_terms,description) VALUES (?, ?, ?, ?, ?, ?, ?,?)");
    $stmt->bind_param("sssissis", $category, $subcategory, $title, $stock, $address, $mobile, $acceptTerms,$description);

    if (!$stmt->execute()) {
        echo json_encode(array('status' => 'error', 'message' => 'Execute failed: ' . $stmt->error));
        exit;
    }

    $advertisement_id = $stmt->insert_id;

    // Step 2: Insert unique attributes for pesticides
    $type = $_POST['type'];
    $applicationRatio = $_POST['applicationRatio'];
    $price1L = $_POST['price1L'];
    $price5L = $_POST['price5L'];
    $price10L = $_POST['price10L'];

    $pesticides_stmt = $conn->prepare("INSERT INTO advertisement_pesticides (advertisement_id, type, application_ratio, price_1L, price_5L, price_10L) VALUES (?, ?, ?, ?, ?, ?)");
    $pesticides_stmt->bind_param("isdsss", $advertisement_id, $type, $applicationRatio, $price1L, $price5L, $price10L);

    if (!$pesticides_stmt->execute()) {
        echo json_encode(array('status' => 'error', 'message' => 'Execute failed: ' . $pesticides_stmt->error));
        exit;
    }

    // Step 3: Insert images into advertisement_images table
    if (isset($_FILES['images'])) {
        $imageCount = count($_FILES['images']['name']);
        for ($i = 0; $i < $imageCount; $i++) {
            $imagePath = $uploadDir . basename($_FILES['images']['name'][$i]);
            move_uploaded_file($_FILES['images']['tmp_name'][$i], $imagePath);

            $image_stmt = $conn->prepare("INSERT INTO advertisement_images (advertisement_id, image_path) VALUES (?, ?)");
            $image_stmt->bind_param("is", $advertisement_id, $imagePath);
            if (!$image_stmt->execute()) {
                echo json_encode(array('status' => 'error', 'message' => 'Image upload failed: ' . $image_stmt->error));
                exit;
            }
        }
    }

    // Step 4: Insert specifications into advertisement_specifications table
    // if (isset($_POST['specifications'])) {
    //     $specifications = json_decode($_POST['specifications'], true);
    //     foreach ($specifications as $specification) {
    //         $spec_stmt = $conn->prepare("INSERT INTO advertisement_specifications (advertisement_id, specification) VALUES (?, ?)");
    //         $spec_stmt->bind_param("is", $advertisement_id, $specification);
    //         if (!$spec_stmt->execute()) {
    //             echo json_encode(array('status' => 'error', 'message' => 'Specification upload failed: ' . $spec_stmt->error));
    //             exit;
    //         }
    //     }
    // }

    // Success response
    echo json_encode(array('status' => 'success', 'message' => 'Pesticide advertisement successfully submitted'));
    exit;
}

$conn->close();
?>
