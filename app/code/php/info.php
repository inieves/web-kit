<?php

error_log ('!!! error logging is working !!!');

$host = getenv('MYSQL_HOST');
$socket = getenv('MYSQL_SOCKET');
$user = getenv('MYSQL_USER');
$pass = getenv('MYSQL_PASSWORD');
$db = getenv('MYSQL_DATABASE');

echo 'DB INFO' . '<br>';
echo 'host: ' . $host . '<br>';
echo 'socket: ' . $socket . '<br>';
echo 'user: ' . $user . '<br>';
echo 'pass: ' . $pass . '<br>';
echo 'db: ' . $db . '<br>';

// Create connection
$conn = mysqli_connect($host, $user, $pass, $db, 3306, $socket);

// Check connection
if (!$conn) {
	echo "status: connection failed: " . mysqli_connect_error();
}
else {
	echo "status: connection success";
}

echo phpinfo();