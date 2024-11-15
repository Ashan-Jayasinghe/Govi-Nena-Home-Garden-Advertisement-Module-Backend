<?php
session_start();
include 'db_connection.php';  // Include the database connection file

// Set CORS headers to allow requests from the frontend (localhost:8100)
header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Check if the user is authenticated
if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}
$user_id = $_SESSION['user_id'];

// Check for the existence of the 'uploads' folder and create it if it doesn't exist
$uploadDir = 'uploads/';
if (!is_dir($uploadDir)) {
    if (!mkdir($uploadDir, 0777, true)) {
        echo json_encode(array('status' => 'error', 'message' => 'Failed to create uploads directory.'));
        exit();
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Step 1: Insert common attributes into the advertisements table
    $category = 'Fertilizer';
    $subcategory = $_POST['subcategory'];
    $title = $_POST['title'];
    $stock = $_POST['stock'];
    $address = $_POST['address'];
    $mobile = $_POST['mobile'];
    $description = $_POST['description'];
    $acceptTerms = isset($_POST['acceptTerms']) ? 1 : 0;

        // Set the expiration date to 30 days from now
        $expires_at = date('Y-m-d H:i:s', strtotime('+30 days'));

        // By default, set the advertisement to active
        $is_active = true;

    // Prepare the statement for common attributes
    $stmt = $conn->prepare("INSERT INTO advertisements (category, subcategory, title, stock, address, mobile, accept_terms, user_id, description,expires_at, is_active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssissiissi", $category, $subcategory, $title, $stock, $address, $mobile, $acceptTerms, $user_id, $description,$expires_at,$is_active);

    if (!$stmt->execute()) {
        echo json_encode(array('status' => 'error', 'message' => 'Execute failed: ' . $stmt->error));
        exit();
    }

    $advertisement_id = $stmt->insert_id;

    // Step 2: Insert unique attributes for Inorganic Fertilizers
    $type = $_POST['type'];
    $npkRatio = $_POST['npkRatio'];  // NPK Ratio for inorganic fertilizers
    $method = $_POST['method'];  // Method of application
    $unit = $_POST['unit'];
    $amount = $_POST['amount'];
    $price = $_POST['price'];

    $inorganic_stmt = $conn->prepare("INSERT INTO advertisement_inorganic (advertisement_id, type, npk, method, unit, amount, price) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $inorganic_stmt->bind_param("issssdd", $advertisement_id, $type, $npkRatio, $method, $unit, $amount, $price);

    if (!$inorganic_stmt->execute()) {
        echo json_encode(array('status' => 'error', 'message' => 'Execute failed: ' . $inorganic_stmt->error));
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
    echo json_encode(array('status' => 'success', 'message' => 'Inorganic fertilizer advertisement successfully submitted'));
    exit;
}

$conn->close();
?>