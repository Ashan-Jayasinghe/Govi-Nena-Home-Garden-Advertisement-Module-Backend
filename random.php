<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Allow CORS requests from any origin
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Include database connection
include 'db_connection.php';

// Function to generate random names (Sri Lankan names)
function generateRandomName() {
    $firstNames = ["Nimal", "Saman", "Kumara", "Chandana", "Dilshan", "Tharindu", "Anusha", "Pavithra", "Yasodha", "Rani"];
    $lastNames = ["Perera", "Kumari", "Fernando", "Wijesinghe", "Rajapaksha", "Jayasinghe", "Seneviratne", "Herath", "Gunaratne", "Dissanayake"];

    $firstName = $firstNames[array_rand($firstNames)];
    $lastName = $lastNames[array_rand($lastNames)];

    return $firstName . " " . $lastName;
}

// Password to be used for all users
$password = '123456As';

// Hash the password for security
$passwordHash = password_hash($password, PASSWORD_DEFAULT);

// Generate 100 users
for ($i = 0; $i < 100; $i++) {
    // Generate random email
    $email = strtolower(generateRandomName()) . rand(1000, 9999) . "@example.com";
    $name = generateRandomName();

    // Insert the user into the database
    $stmt = $conn->prepare("INSERT INTO users (name, email, password_hash) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $name, $email, $passwordHash);

    if ($stmt->execute()) {
        echo "User $name with email $email created successfully.<br>";
    } else {
        echo "Error creating user $name with email $email: " . $stmt->error . "<br>";
    }
}

// Close statement and connection
$stmt->close();
$conn->close();
?>