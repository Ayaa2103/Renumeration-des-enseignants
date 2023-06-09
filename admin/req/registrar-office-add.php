<?php 
session_start();
if (isset($_SESSION['admin_id']) && 
    isset($_SESSION['role'])) {

    if ($_SESSION['role'] == 'Admin') {
    	

if (isset($_POST['fname']) &&
    isset($_POST['lname']) &&
    isset($_POST['username']) &&
    isset($_POST['pass'])     &&
    isset($_POST['address'])  &&
    isset($_POST['employee_number']) &&
    isset($_POST['phone_number'])  &&
    isset($_POST['qualification']) &&
    isset($_POST['email_address']) &&
    isset($_POST['date_of_birth'])) {
    
    include '../../DB_connection.php';
    include "../data/registrar_office.php";

    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $uname = $_POST['username'];
    $pass = $_POST['pass'];

    $address = $_POST['address'];
    $employee_number = $_POST['employee_number'];
    $phone_number = $_POST['phone_number'];
    $qualification = $_POST['qualification'];
    $email_address = $_POST['email_address'];
    $gender = $_POST['gender'];
    $date_of_birth = $_POST['date_of_birth'];



    $data = 'uname='.$uname.'&fname='.$fname.'&lname='.$lname.'&address='.$address.'&en='.$employee_number.'&pn='.$phone_number.'&qf='.$qualification.'&email='.$email_address;

    if (empty($fname)) {
		$em  = "Prenom requis !";
		header("Location: ../registrar-office-add.php?error=$em&$data");
		exit;
	}else if (empty($lname)) {
		$em  = "Nom requis !";
		header("Location: ../registrar-office-add.php?error=$em&$data");
		exit;
	}else if (empty($uname)) {
		$em  = "Nom d'utilisateur requis !";
		header("Location: ../registrar-office-add.php?error=$em&$data");
		exit;
	}else if (!unameIsUnique($uname, $conn, $r_user_id)) {
		$em  = "Essayez un autre !";
		header("Location: ../registrar-office-add.php?error=$em&$data");
		exit;
	}else if (empty($address)) {
        $em  = "Adresse requis !";
        header("Location: ../registrar-office-add.php?error=$em&$data");
        exit;
    }else if (empty($employee_number)) {
        $em  = "Numero ID requis !";
        header("Location: ../registrar-office-add.php?error=$em&$data");
        exit;
    }else if (empty($phone_number)) {
        $em  = "Numero de telephone requis !";
        header("Location: ../registrar-office-add.php?error=$em&$data");
        exit;
    }else if (empty($qualification)) {
        $em  = "Niveau d'etudes requis !";
        header("Location: ../registrar-office-add.php?error=$em&$data");
        exit;
    }else if (empty($email_address)) {
        $em  = "Adresse Email requis";
        header("Location: ../registrar-office-add.php?error=$em&$data");
        exit;
    }else if (empty($gender)) {
        $em  = "Genre requis !";
        header("Location: ../registrar-office-add.php?error=$em&$data");
        exit;
    }else if (empty($date_of_birth)) {
        $em  = "Date de naissance requis";
        header("Location: ../registrar-office-add.php?error=$em&$data");
        exit;
    }else {
        $sql = "UPDATE registrar_office SET
                username = ?, fname=?, lname=?,
                address = ?, employee_number=?, date_of_birth = ?, phone_number = ?, qualification = ?,gender=?, email_address = ?
                WHERE r_user_id=?";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$uname, $fname, $lname, $address, $employee_number, $date_of_birth, $phone_number, $qualification, $gender, $email_address, $r_user_id]);
        $sm = "Mise a jour avec succès !";
        header("Location: ../registrar-office-edit.php?success=$sm&$data");
        exit;
	}
    
  }else {
  	$em = "Une erreur est survenu !";
    header("Location: ../registrar-office.php?error=$em");
    exit;
  }

  }else {
    header("Location: ../../logout.php");
    exit;
  } 
}else {
	header("Location: ../../logout.php");
	exit;
} 
