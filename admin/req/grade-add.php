<?php 
session_start();
if (isset($_SESSION['admin_id']) && 
    isset($_SESSION['role'])) {

    if ($_SESSION['role'] == 'Admin') {
    	

if (isset($_POST['grade_code']) &&
    isset($_POST['grade'])) {
    
    include '../../DB_connection.php';

    $grade_code = $_POST['grade_code'];
    $grade = $_POST['grade'];
    
    $data = 'grade_code='.$grade_code.'&grade='.$grade;

  if (empty($grade_code)) {
		$em  = "Code requis !";
		header("Location: ../grade-add.php?error=$em&$data");
		exit;
	}else if (empty($grade)) {
		$em  = "Niveau requis !";
		header("Location: ../grade-add.php?error=$em&$data");
		exit;
	}else {
        $sql  = "INSERT INTO
                 grades(grade, grade_code)
                 VALUES(?,?)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([$grade, $grade_code]);
        $sm = "Nouveau niveau crée !";
        header("Location: ../grade-add.php?success=$sm");
        exit;
	}
    
  }else {
  	$em = "Une erreur est survenu !";
    header("Location: ../grade-add.php?error=$em");
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
