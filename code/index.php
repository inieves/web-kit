<?php

error_log ('!!! error logging is working !!!');

$servername = "db";
$username = "user";
$password = "aDGLOYvLfDkeojsn1VgiJku";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
	die("DB Connection failed: " . $conn->connect_error);
}
echo "DB Connected successfully";

echo phpinfo();