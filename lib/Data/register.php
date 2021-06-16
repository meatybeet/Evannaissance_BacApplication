
<?php

$conn = mysqli_connect('localhost','root','','annalebac');
if(!$conn){
    echo "erreur de connexion a la db";
}
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    
    $sql = "SELECT * FROM login WHERE  username= '".$username."' AND email= '".$email."' AND password= '".$password."'";

    $result = mysqli_query($conn,$sql);
    $count = mysqli_num_rows($result);

    if($count == 1){
        echo json_encode("Error");
    }else{
        
        $insert = "INSERT INTO login(username,email,password) VALUES('".$username."','".$email."','".$password."')";
        $query = mysqli_query($conn,$insert);

        if($query){
            echo json_encode("succes");
        }
    }
?>