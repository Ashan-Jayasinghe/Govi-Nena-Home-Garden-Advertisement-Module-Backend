<?php
// Set cookie parameters
session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'domain' => 'localhost',
    'secure' => false,
    'httponly' => true,
    'samesite' => 'Lax'
]);

// Start the session
session_start();

// Set some session variables
if (!isset($_SESSION['counter'])) {
    $_SESSION['counter'] = 1;
} else {
    $_SESSION['counter']++;
}

echo "Session counter: " . $_SESSION['counter'] . "<br>";
echo "Session ID: " . session_id();
?>
