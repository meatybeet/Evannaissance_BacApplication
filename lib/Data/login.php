
<?php

$conn = mysqli_connect('localhost','root','','annalebac');


    $email = $_POST['email'];
    $password = $_POST['password'];
    
    $sql = "SELECT * FROM login WHERE email= '".$email."' AND password= '".$password."'";

    $result = mysqli_query($conn,$sql);
    $count = mysqli_num_rows($result);
    

    if($count == 1){
        echo json_encode("Success");
    }else{
        echo json_encode("Error");
    }
?>