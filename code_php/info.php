<?php

error_log ('!!! error logging is working !!!');

//$host = getenv('MYSQL_HOST');
//$username = getenv('MYSQL_USER');
//$password = getenv('MYSQL_PASSWORD');
//$db = getenv('MYSQL_DATABASE');

//echo 'host: ' . $host . "\n";
//echo 'user: ' . $username . "\n";
//echo 'pass: ' . $password . "\n";
//echo '  db: ' . $db . "\n";

// Create connection
//$conn = new mysqli_connect($host, $username, $password, $db);
//
//// Check connection
//if (!$conn) {
//    die("DB Connection failed: " . mysqli_connect_error());
//}
//echo "DB Connected successfully";

//try {
//	$conn = new PDO("mysql:host=$host;dbname=$db", $username, $password);
//	// set the PDO error mode to exception
//	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//	echo "DB Connected successfully";
//}
//catch(PDOException $e) {
//	echo "DB Connection failed: " . $e->getMessage();
//}

//$link = mysql_connect($host, $username, $password);
//if (!$link) {
//    die('DB Could not connect: ' . mysql_error());
//}
//echo 'DB Connected successfully';
//mysql_close($link);
//

echo phpinfo();