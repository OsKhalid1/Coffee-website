<?php
include('db.php');
session_start();

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');


$json = file_get_contents('php://input');
$data = json_decode($json, true);

if (!$data || !isset($data['items']) || empty($data['items'])) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Cart is empty']);
    exit;
}

try {
    
    $user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : NULL;
    $username = isset($_SESSION['username']) ? $_SESSION['username'] : 'Guest';
    
    $createTableSQL = "CREATE TABLE IF NOT EXISTS orders (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT,
        username VARCHAR(100),
        order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        total_amount DECIMAL(10, 2) NOT NULL,
        items TEXT NOT NULL,
        status VARCHAR(50) DEFAULT 'pending',
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
    )";

    $conn->query($createTableSQL);
    $alterColumns = array();
    $checkColumns = $conn->query("SHOW COLUMNS FROM orders LIKE 'user_id'");
    if($checkColumns->num_rows == 0) {
        $conn->query("ALTER TABLE orders ADD COLUMN user_id INT AFTER id");
    }
    
    $checkColumns = $conn->query("SHOW COLUMNS FROM orders LIKE 'username'");
    
 if($checkColumns->num_rows == 0) {
        $conn->query("ALTER TABLE orders ADD COLUMN username VARCHAR(100) AFTER user_id");
    }

    
    $items = json_encode($data['items']);
    $total = floatval($data['total'] ?? 0);
    $totalStr = number_format($total, 2, '.', ''); 
    $stmt = $conn->prepare("INSERT INTO orders (user_id, username, total_amount, items, status) VALUES (?, ?, ?, ?, 'pending')");
    $stmt->bind_param("isss", $user_id, $username, $totalStr, $items);
    
    if ($stmt->execute()) {
        $orderId = $conn->insert_id;
        echo json_encode([
            'success' => true,
            'message' => 'Order placed successfully',
            'order_id' => $orderId,
            'total' => $total
        ]);
    } else {
        throw new Exception("Failed to insert order: " . $stmt->error);
    }
    
    $stmt->close();
    
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Database error: ' . $e->getMessage()
    ]);
}

$conn->close();
?>

