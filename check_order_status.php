<?php
session_start();
include 'WebconDB.php';

if (!isset($_SESSION['userid'])) {
    exit();
}

$userid = $_SESSION['userid'];

// ---------- ส่วนที่แก้ไขล่าสุด: ตรวจสอบออเดอร์ที่เสร็จแล้ว ----------
$completed_orders = $connect->query("
    SELECT o.*, s.ShopName 
    FROM orderss o
    JOIN shop s ON o.ShopID = s.ShopID
    WHERE o.UserID = $userid
    ORDER BY o.Dates DESC
    LIMIT 1
");

if ($completed_orders->num_rows > 0) {
    $order = $completed_orders->fetch_assoc();
    echo "<div class='alert'>ร้าน {$order['ShopName']} คิวที่ " . substr($order['UserID'], -2) . substr($order['Dates'], -4) . " พร้อมรับแล้ว!</div>";
    
    // ลบคำสั่งซื้อที่แจ้งแล้ว (ป้องกันการแจ้งซ้ำ)
    $connect->query("DELETE FROM orderss WHERE UserID = $userid AND ShopID = {$order['ShopID']} AND Dates = {$order['Dates']}");
}
?>