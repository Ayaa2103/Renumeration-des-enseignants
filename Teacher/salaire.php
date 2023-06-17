<?php
session_start();
if (isset($_SESSION['teacher_id']) && 
    isset($_SESSION['role'])) {

    if ($_SESSION['role'] == 'Teacher') {
       include "../DB_connection.php";
       include "../admin/data/teacher.php";
       include "data/subject.php";
       include "data/grade.php";
       include "data/section.php";
       include "data/class.php";


       $teacher_id = $_SESSION['teacher_id'];
       $teacher = getTeacherById($teacher_id, $conn);
       $salaire = getSalaryById($teacher_id, $conn);
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Enseignant -Changer le mot de passe-</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="icon" href="../G.S.png">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight: 700;
            font-size: 1em;
            background-color: white;
                background-size: cover;
                background-position: center;
            margin: 0px auto;
            padding: 0px;
            position: relative;
        }

        .releve-salaire {
            background-color: rgba(0, 0, 0, 0.7);
            
            border: 1px solid #ccc;
            padding: 10px;
            margin: 100px auto;
            max-width: 800px;
            text-align: center;
            position: relative;
            z-index: 1;
            color: #fff;
        }

        .releve-salaire h2 {
            margin: 3;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-size: 1em;
        }

        .releve-salaire hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 10px 0;
        }

        .montant {
            font-weight: bold;
            font-size: 20px;
        }

        .deductions-menu {
            list-style: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }

        .deductions-menu li {
            margin-bottom: 10px;
            cursor: pointer;
        }

        .deductions-menu li span {
            display: inline-block;
            width: 200px;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
        }

        .deductions-details {
            display: none;
            margin-top: 10px;
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #f9f9f9;
            text-align: left;
        }

        .deductions-details p {
            margin-bottom: 10px;
            font-size: 14px;
        }

        .print-button {
            display: block;
            margin-top: 20px;
            margin-left: 39%;
            font-size: 16px;
            padding: 10px 60px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    <script>
        function toggleDetails(elementId) {
            var details = document.getElementById(elementId);
            details.style.display = (details.style.display === "none") ? "block" : "none";
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.php">
      <img src="../G.S (2).png" width="50">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0"
          id="navLinks">
        <li class="nav-item">
          <a class="nav-link" 
             aria-current="page" 
             href="index.php">Dashboard</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="pass.php">Changer le mot de passe</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="salaire.php">Status de salaire</a>
        </li>

      </ul>
      <ul class="navbar-nav me-right mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="../logout.php">Se déconnecter</a>
        </li>
      </ul>
  </div>
    </div>
</nav>
    <div class="releve-salaire">
        <h2>Relevé de salaire de l'enseignant :</h2>
        <hr>
        <p>Salaire : <span class="montant"><?php echo $salaire[0]; ?>Dh</span></p>
        <button class="print-button" onclick="window.print()">Imprimer</button>
    </div>
</body>
</html>
<?php
    }else {
        header("Location: ../login.php");
        exit;
    } 
    }else {
        header("Location: ../login.php");
        exit;
    } 
?>
