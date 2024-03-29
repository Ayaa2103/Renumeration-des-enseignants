<?php 
session_start();
if (isset($_SESSION['admin_id']) && 
    isset($_SESSION['role'])) {

    if ($_SESSION['role'] == 'Admin') {
    	

if (isset($_POST['admin_pass']) &&
    isset($_POST['new_pass'])   &&
    isset($_POST['c_new_pass']) &&
    isset($_POST['teacher_id'])) {
    
    include '../../DB_connection.php';
    include "../data/teacher.php";
    include "../data/admin.php";

    $admin_pass = $_POST['admin_pass'];
    $new_pass = $_POST['new_pass'];
    $c_new_pass = $_POST['c_new_pass'];

    $teacher_id = $_POST['teacher_id'];
    $id = $_SESSION['admin_id'];
    
    $data = 'teacher_id='.$teacher_id.'#change_password';

    if (empty($admin_pass)) {
		$em  = "Mot de passe Admin requis";
		header("Location: ../teacher-edit.php?perror=$em&$data");
		exit;
	}else if (empty($new_pass)) {
		$em  = "Nouveau mot de passe requis";
		header("Location: ../teacher-edit.php?perror=$em&$data");
		exit;
	}else if (empty($c_new_pass)) {
		$em  = "confirmation de mot de passe requis !";
		header("Location: ../teacher-edit.php?perror=$em&$data");
		exit;
	}else if ($new_pass !== $c_new_pass) {
        $em  = "Ressayez une autre fois";
        header("Location: ../teacher-edit.php?perror=$em&$data");
        exit;
    }else if (!adminPasswordVerify($admin_pass, $conn, $id)) {
        $em  = "Mot de passe Admin incorrect";
        header("Location: ../teacher-edit.php?perror=$em&$data");
        exit;
    }else {
        // hashing the password
        $new_pass = password_hash($new_pass, PASSWORD_DEFAULT);

        $sql = "UPDATE teachers SET
                password = ?
                WHERE teacher_id=?";

        $stmt = $conn->prepare($sql);
        $stmt->execute([$new_pass, $teacher_id]);
        $sm = "Changement avec succès !";
        header("Location: ../teacher-edit.php?psuccess=$sm&$data");
        exit;
	}
    
  }else {
  	$em = "Une erreur est survenu !";
    header("Location: ../teacher-edit.php?error=$em&$data");
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
