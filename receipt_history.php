<?php
session_start();
include 'WebconDB.php';

if (!isset($_SESSION['userid'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>ประวัติใบเสร็จ</title>
    <style>
        body {
            font-family: 'Sarabun', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .history-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 25px;
            margin-top: 30px;
        }
        .history-header {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
            color: #d2691e;
        }
        .receipt-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
        }
        .receipt-card-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .receipt-card-shop {
            color: #d2691e;
        }
        .receipt-card-date {
            color: #666;
        }
        .receipt-card-total {
            text-align: right;
            font-weight: bold;
            margin-top: 5px;
        }
        .back-button {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            background-color: #d2691e;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-button:hover {
            background-color: #a0522d;
        }
        .no-receipts {
            text-align: center;
            color: #666;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="history-container">
        <div class="history-header">ประวัติใบเสร็จ</div>
        
        <div id="receipts-list">
            <!-- ใช้ JavaScript แสดงข้อมูลจาก localStorage -->
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const receipts = JSON.parse(localStorage.getItem('receipts')) || [];
                    const container = document.getElementById('receipts-list');
                    
                    if (receipts.length === 0) {
                        container.innerHTML = '<div class="no-receipts">ยังไม่มีประวัติใบเสร็จ</div>';
                        return;
                    }
                    
                    let html = '';
                    receipts.forEach((receipt, index) => {
                        html += `
                            <div class="receipt-card">
                                <div class="receipt-card-header">
                                    <span class="receipt-card-shop">${receipt.shop_name}</span>
                                    <span class="receipt-card-date">${receipt.date}</span>
                                </div>
                                <div>คิวที่ ${receipt.queue_number}</div>
                                <div>รายการ: ${receipt.items.map(item => item.name).join(', ')}</div>
                                <div class="receipt-card-total">รวม ${receipt.total} บาท</div>
                            </div>
                        `;
                    });
                    
                    container.innerHTML = html;
                });
            </script>
        </div>
        
        <a href="main.php" class="back-button">กลับสู่หน้าหลัก</a>
    </div>
</body>
</html>