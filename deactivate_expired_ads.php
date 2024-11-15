<?php
include 'db_connection.php';  // Include database connection file

// Get current time
$current_time = date('Y-m-d H:i:s');

// Deactivate ads that have expired
$sql = "UPDATE advertisements SET is_active = TRUE WHERE expires_at < ? AND is_active = FALSE";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $current_time);

if ($stmt->execute()) {
    echo "Expired ads deactivated successfully.";
} else {
    echo "Failed to deactivate expired ads.";
}

$stmt->close();
$conn->close();
?>
