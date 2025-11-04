<?php
include('db.php');
session_start();

if(isset($_POST['email'], $_POST['password'])){
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    
    $sql = "SELECT * FROM users WHERE email = '$email'";
    $result = $conn->query($sql);
    
    if($result && $result->num_rows > 0){
        $user = $result->fetch_assoc();
        
        
        $storedHash = $user['password'];
        
        if(strlen($storedHash) < 50){
            echo("Error: Password in database may be truncated. Hash length: " . strlen($storedHash) . "<br>");
            echo("Please sign up again or contact administrator. <a href='Signup.html'>Sign Up</a>");
        } else {
            
            if(password_verify($password, $storedHash)){
                $_SESSION['user_id'] = $user['id'];
                $_SESSION['username'] = $user['username'];
                $_SESSION['email'] = $user['email'];
                
                echo("Login successfully! <a href='index.html'>Go to Home</a>");
            } else {
                echo("Invalid password! Please check your password and try again. <a href='Login.html'>Try again</a>");
            }
        }
    } else {
        echo("User not found! Please sign up first. <a href='Signup.html'>Sign Up</a>");
    }
} else {
    echo("Please fill all fields! <a href='Login.html'>Back</a>");
}

$conn->close();
?>