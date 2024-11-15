<?php
session_start();
include 'db_connection.php';  // Include the database connection file

header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Check if user is authenticated
if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}

$user_id = $_SESSION['user_id']; // Get user ID from session

// Define the upload path for images
$uploadPath = "http://localhost/Govi-Nena-Home-Garden-Advertisement-Module-Backend/";

// Initialize an array to store saved advertisements
$ads = array();

// SQL to get all saved advertisements with images
$sql = "SELECT a.*, i.image_path
        FROM advertisements a
        INNER JOIN saved_ads s ON a.id = s.ad_id  -- Fetch only saved ads
        LEFT JOIN advertisement_images i ON a.id = i.advertisement_id
        WHERE s.user_id = ? 
        AND a.is_active = 1";  // Filter by logged-in user ID

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id); // Bind the user ID

// Execute the query
$stmt->execute();
$result = $stmt->get_result();

// Fetch saved advertisements and store them in the ads array
while ($row = $result->fetch_assoc()) {
    $ad_id = $row['id'];
    $row['isExpired'] = (strtotime($row['expires_at']) < time()) ? true : false; // Mark as expired or active

    if (!isset($ads[$ad_id])) {
        $ads[$ad_id] = $row; // Basic advertisement data
        $ads[$ad_id]['images'] = array(); // Initialize images array
    }

    // Append image paths
    if ($row['image_path']) {
        $ads[$ad_id]['images'][] = $uploadPath . '/' . $row['image_path']; // Prepend the upload path to image
    }
}

// Now retrieve unique attributes based on subcategory from the fetched ads
foreach ($ads as $ad_id => $ad) {
    $subcategory = $ad['subcategory']; // Get subcategory from the advertisement

    if ($subcategory) {
        // Determine the unique table based on the subcategory
        $uniqueTable = '';
        switch ($subcategory) {
            case 'Inorganic':
                $uniqueTable = 'advertisement_inorganic';
                break;
            case 'Organic':
                $uniqueTable = 'advertisement_organic';
                break;
            case 'Pesticides':
                $uniqueTable = 'advertisement_pesticides';
                break;
            case 'Plant Growth Regulators':
                $uniqueTable = 'advertisement_pgr';
                break;
            case 'Seedlings':
                $uniqueTable = 'advertisement_seedlings';
                break;
            case 'Seeds':
                $uniqueTable = 'advertisement_seeds';
                break;
            case 'Tubers':
                $uniqueTable = 'advertisement_tuber';
                break;
            case 'Dryers':
                $uniqueTable = 'advertisement_dryers';
                break;
            case 'Harvesting Machines':
                $uniqueTable = 'advertisement_harvesting_machines';
                break;
            case 'Tractors':
                $uniqueTable = 'advertisement_tractor';
                break;
            case 'Tillages':
                $uniqueTable = 'advertisement_tillages';
                break;
            case 'Sprayers':
                $uniqueTable = 'advertisement_sprayers';
                break;
            case 'Planting Machines':
                $uniqueTable = 'advertisement_planting_machines';
                break;
            case 'Others':
                $uniqueTable = 'advertisement_others';
                break;
            case 'Irrigation Systems':
                $uniqueTable = 'advertisement_irrigation_systems';
                break;
            default:
                continue 2; // Skip to the next ad if no valid unique table is found
        }

        // Prepare SQL to join with the unique attributes table
        $sqlUnique = "SELECT * FROM $uniqueTable WHERE advertisement_id = ?";
        $stmtUnique = $conn->prepare($sqlUnique);
        $stmtUnique->bind_param("i", $ad_id);
        $stmtUnique->execute();
        $resultUnique = $stmtUnique->get_result();

        // Fetch unique attributes and append them to the corresponding advertisement
        if ($resultUnique->num_rows > 0) {
            $uniqueRow = $resultUnique->fetch_assoc();
            foreach ($uniqueRow as $key => $value) {
                $ads[$ad_id][$key] = $value; // Append unique attributes to the ad
            }
        }
    }
}

// Reindex the array to return a clean response
$ads = array_values($ads);

// Return the saved advertisements along with their unique attributes and images
echo json_encode(array('status' => 'success', 'data' => $ads)); // Return as structured response
$conn->close();
?>
