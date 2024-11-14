<?php
include 'db_connection.php';

header("Access-Control-Allow-Origin: http://localhost:8100");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

$category = $_GET['category'];
$uploadPath = "http://localhost/Govi-Nena-Home-Garden-Advertisement-Module-Backend/";
$ads = array();

// Modify SQL query to fetch all ads in the category, regardless of expiration
$sql = "SELECT a.*, i.image_path
        FROM advertisements a
        LEFT JOIN advertisement_images i ON a.id = i.advertisement_id
        WHERE a.category = ?
        AND a.is_active = 1";

$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $category);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    $ad_id = $row['id'];
    $row['isExpired'] = (strtotime($row['expires_at']) < time()) ? true : false; // Mark as expired or active

    if (!isset($ads[$ad_id])) {
        $ads[$ad_id] = $row;
        $ads[$ad_id]['images'] = array();
    }

    if ($row['image_path']) {
        $ads[$ad_id]['images'][] = $uploadPath . '/' . $row['image_path'];
    }
}

// Fetch unique attributes for each ad based on subcategory
foreach ($ads as $ad_id => $ad) {
    $subcategory = $ad['subcategory'];
    if ($subcategory) {
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
                continue 2; // Skip to the next ad if no valid unique table found
        }

        if ($uniqueTable) {
            $sqlUnique = "SELECT * FROM $uniqueTable WHERE advertisement_id = ?";
            $stmtUnique = $conn->prepare($sqlUnique);
            $stmtUnique->bind_param("i", $ad_id);
            $stmtUnique->execute();
            $resultUnique = $stmtUnique->get_result();

            if ($resultUnique->num_rows > 0) {
                $uniqueRow = $resultUnique->fetch_assoc();
                foreach ($uniqueRow as $key => $value) {
                    $ads[$ad_id][$key] = $value;
                }
            }
        }
    }
}

$ads = array_values($ads);
echo json_encode($ads);
$conn->close();
