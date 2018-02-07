<?php

error_log ('!!! error logging is working !!!');

$host = getenv('MYSQL_HOST');
$user = getenv('MYSQL_USER');
$pass = getenv('MYSQL_PASSWORD');
$db = getenv('MYSQL_DATABASE');

echo 'DB INFO' . '<br>';
echo 'host: ' . $host . '<br>';
echo 'user: ' . $user . '<br>';
echo 'pass: ' . $pass . '<br>';
echo 'db: ' . $db . '<br>';

// Create connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if (!$conn) {
	echo "status: connection failed: " . mysqli_connect_error();
}
echo "status: connection success";

echo phpinfo();