<?php
include('db.php');
//creat new tabel and falit
$createTableSQL = "CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
)";
$conn->query($createTableSQL);


$alterSQL = "ALTER TABLE users MODIFY COLUMN password VARCHAR(255) NOT NULL";//custmaez the table
$conn->query($alterSQL);

if (isset($_POST['username'], $_POST['email'], $_POST['password'])){
   
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    
    
    if(empty($username) || empty($email) || empty($password)){
        echo("All fields are required <a href='Signup.html'>Back</a>"); //if there no input out
        exit;
    }
    
    $hashpassword = password_hash($password, PASSWORD_DEFAULT);
    

    $checkSql = "SELECT * FROM users WHERE username = '$username' OR email = '$email'";
    $result = $conn->query($checkSql);
    
    if($result && $result->num_rows > 0){
        echo("Username or email already exists Please use different credentials <a href='Signup.html'>Back</a>");//check if it's allrady exesit
    } else {
        
        
        $stmt = $conn->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $username, $email, $hashpassword);
        
        if($stmt->execute()){
            echo("Sign Up successfully go to login <a href='Login.html'>Login</a>");
        } else{
            echo "Error: " . $stmt->error . "<br>";
            echo "Debug - Password hash length: " . strlen($hashpassword) . "<br>";
            echo "Debug - Password hash preview: " . substr($hashpassword, 0, 20) . "...<br>";
        }
        $stmt->close();
    }
} else {
     echo("Failed to Sign up");
}
$conn->close();
?>