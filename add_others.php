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
    $category = 'Machineries';
    $subcategory = 'Others';
    $title = $_POST['title'];
    $stock = $_POST['stock'];
    $address = $_POST['address'];
    $mobile = $_POST['mobile'];
    $acceptTerms = isset($_POST['acceptTerms']) ? 1 : 0;

    // Prepare the statement for common attributes
    $stmt = $conn->prepare("INSERT INTO advertisements (category, subcategory, title, stock, address, mobile, accept_terms) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssissi", $category, $subcategory, $title, $stock, $address, $mobile, $acceptTerms);

    if (!$stmt->execute()) {
        echo json_encode(array('status' => 'error', 'message' => 'Execute failed: ' . $stmt->error));
        exit;
    }

    $advertisement_id = $stmt->insert_id;

    // Step 2: Insert unique attributes for Others
    $type = $_POST['type'];
    $condition = $_POST['condition'];
    $rentOrSell = $_POST['rentorsell'];
    $manufacturer = $_POST['manufacturer'];
    $price = $_POST['price'];

    $others_stmt = $conn->prepare("INSERT INTO advertisement_others (advertisement_id,type, condition, rent_or_sell, manufacturer, price) VALUES (?,?, ?, ?, ?, ?)");
    $others_stmt->bind_param("isssd", $advertisement_id, $condition, $rentOrSell, $manufacturer, $price);

    if (!$others_stmt->execute()) {
        echo json_encode(array('status' => 'error', 'message' => 'Execute failed: ' . $others_stmt->error));
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
    if (isset($_POST['specifications'])) {
        $specifications = json_decode($_POST['specifications'], true);
        foreach ($specifications as $specification) {
            $spec_stmt = $conn->prepare("INSERT INTO advertisement_specifications (advertisement_id, specification) VALUES (?, ?)");
            $spec_stmt->bind_param("is", $advertisement_id, $specification);
            if (!$spec_stmt->execute()) {
                echo json_encode(array('status' => 'error', 'message' => 'Specification upload failed: ' . $spec_stmt->error));
                exit;
            }
        }
    }

    // Success response
    echo json_encode(array('status' => 'success', 'message' => 'Other advertisement successfully submitted'));
    exit;
}

$conn->close();
?>
