<?php
$host = '127.0.0.1'; // Since your MySQL is running on localhost
$db = 'govinena'; // Your database name
$user = 'root'; // MySQL user
$pass = ''; // MySQL password
$port = 3307; // The custom MySQL port you're using

// Create a new connection
$conn = new mysqli($host, $user, $pass, $db, $port);

// Check for connection errors
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
