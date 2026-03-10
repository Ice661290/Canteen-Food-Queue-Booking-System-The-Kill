<?php

$username = 'root';
$password = '';
$dbname = 'thekill';

$connect = new mysqli('localhost',$username,$password,$dbname);

if($connect->connect_error){
   die("Connection failed:".$connect->connect_error);
}
  //echo "<p>Connected successfully</p>";
  //echo "date : " .date('j-m-y h-i-s');
?>