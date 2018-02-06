<?php

error_log ('!!! error logging is working !!!');

$host = getenv('MYSQL_HOST');
$username = getenv('MYSQL_USER');
$password = getenv('MYSQL_PASSWORD');
$db = getenv('MYSQL_DATABASE');

//echo 'host: ' . $host . "\n";
//echo 'user: ' . $username . "\n";
//echo 'pass: ' . $password . "\n";
//echo '  db: ' . $db . "\n";

// Create connection
$conn = new mysqli($host, $username, $password, $db);

// Check connection
if ($conn->connect_error) {
	die("DB Connection failed: " . $conn->connect_error);
}
echo "DB Connected successfully";

echo phpinfo();