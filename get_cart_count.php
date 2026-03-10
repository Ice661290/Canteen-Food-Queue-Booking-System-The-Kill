<?php
session_start();
include 'WebconDB.php';

$shopid = isset($_GET['shopid']) ? $_GET['shopid'] : null;
$count = 0;

if ($shopid && isset($_SESSION['cart'][$shopid])) {
    foreach ($_SESSION['cart'][$shopid] as $item) {
        $count += $item['quantity'];
    }
}

echo $count;
?>