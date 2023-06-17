<?php 
session_start();
if (isset($_SESSION['admin_id']) && 
    isset($_SESSION['role'])     &&
    isset($_GET['course_id'])) {

  if ($_SESSION['role'] == 'Admin') {
     include "../DB_connection.php";
     include "data/course.php";

     $id = $_GET['course_id'];
     if (removeCourse($id, $conn)) {
     	$sm = "Supprimé avec succès !";
        header("Location: course.php?success=$sm");
        exit;
     }else {
        $em = "Une erreur est survenu !";
        header("Location: course.php?error=$em");
        exit;
     }


  }else {
    header("Location: course.php");
    exit;
  } 
}else {
	header("Location: course.php");
	exit;
} 