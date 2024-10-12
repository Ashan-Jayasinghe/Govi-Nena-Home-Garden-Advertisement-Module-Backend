<?php
session_start(); // Start the session

// Include your database connection
include 'db_connection.php';

header("Access-Control-Allow-Origin: http://localhost:8100"); // Adjust the origin to match your frontend
header("Access-Control-Allow-Credentials: true"); // Allow credentials such as cookies to be sent
header('Access-Control-Allow-Methods: DELETE,OPTIONS');
header("Access-Control-Allow-Headers: Content-Type, Authorization"); // Allow specific headers

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(array('status' => 'error', 'message' => 'User not authenticated.'));
    exit();
}
$user_id = $_SESSION['user_id'];

// Get the ID of the advertisement to delete
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $input = json_decode(file_get_contents('php://input'), true);
    $adId = isset($input['id']) ? $input['id'] : null;
    
    if ($adId) {
        // Prepare the SQL query to check advertisement ownership
        $sqlCheck = "SELECT user_id FROM advertisements WHERE id = ?";
        $stmtCheck = $conn->prepare($sqlCheck);
        $stmtCheck->bind_param("i", $adId);
        $stmtCheck->execute();
        $result = $stmtCheck->get_result();

        if ($result->num_rows > 0) {
            $advertisement = $result->fetch_assoc();
            if ($advertisement['user_id'] == $user_id) {
                // User is authorized to delete this advertisement
                $sql = "DELETE FROM advertisements WHERE id = ?";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("i", $adId);

                if ($stmt->execute()) {
                    echo json_encode(array('status' => 'success', 'message' => 'Advertisement deleted successfully'));
                } else {
                    echo json_encode(array('status' => 'error', 'message' => 'Failed to delete advertisement'));
                }

                $stmt->close();
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'You are not authorized to delete this advertisement'));
            }
        } else {
            echo json_encode(array('status' => 'error', 'message' => 'Advertisement not found'));
        }

        $stmtCheck->close();
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'Invalid advertisement ID'));
    }
} else {
    echo json_encode(array('status' => 'error', 'message' => 'Invalid request method'));
}

$conn->close();
?>
