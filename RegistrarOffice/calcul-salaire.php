<?php 
session_start();
if (isset($_SESSION['r_user_id']) && 
    isset($_SESSION['role'])) {

    if ($_SESSION['role'] == 'Registrar Office') {
      
        include "../DB_connection.php";
        include "../admin/data/teacher.php";
        include "../admin/data/subject.php";
        include "../admin/data/grade.php";
        include "../admin/data/class.php";
        include "../admin/data/section.php";
       $subjects = getAllSubjects($conn);
       $classes  = getAllClasses($conn);
       
       $teacher_id = $_GET['teacher_id'];
       $teacher = getTeacherById($teacher_id, $conn);
       
       if ($teacher == 0) {
         header("Location: teacher.php");
         exit;
       }

 ?>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Calcul de salaire</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="icon" href="../G.S.png">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Calculateur de salaire</title>
    <style>
        body{
            background: url(../img/group-kids-studying-school.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }
        .releve-salaire {
            background-color: rgba(0, 0, 0, 0.7);
            
            border: 1px solid #ccc;
            padding: 10px;
            margin: 90px auto;
            max-width: 900px;
            text-align: center;
            position: relative;
            z-index: 1;
            color: #fff;
        }

        .container {
            
            max-width: 700px;
            margin: 0 auto;
            padding: 5px;
        }
        .form-group {
            margin-bottom: 20px;
            font-family: Tajawal;
            font-size: large;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }
        input[type="number"] {
            width: 100%;
            padding: 5px;
        }
        input[type="submit"] {
            margin-left: 0.2em;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        } 
        .result {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: x-large;
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<?php 
    include "inc/navbar.php";
       
     ?>
     

     <style>
  @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&family=Darumadrop+One&family=Tajawal:wght@200&family=Tsukimi+Rounded:wght@600&display=swap');
</style>      
     
    <div class="container">
        <br><br>
        <div class="releve-salaire">
        <center><h2>Calculateur de salaire</h2></center> <br>
        <form action="#" method="post">
            <div class="form-group">
                <label for="hours_worked">Nombre d'heures d'enseignement :</label>
                <input type="number" name="hours_worked" id="hours_worked" required>
            </div>
            <div class="form-group">
                <label for="abscence">nombre d'heures d'absences :</label>
                <input type="number" name="abscence" id="abscence" required>
            </div>
            <div class="form-group">
                <label for="hourly_rate">Taux horaire :</label>
                <input type="number" name="hourly_rate" id="hourly_rate" required>
            </div>
            
            <input type="submit" value="Calculer">
        </form>
        <div class="result">
            <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $hours_worked = $_POST["hours_worked"];
                $hourly_rate = $_POST["hourly_rate"];
                $abscence = $_POST["abscence"];
                $numberHours = getNumberOfHoursById($teacher_id, $conn);
                
                 
                $brut_salary = $hours_worked * $hourly_rate;
                $net_salary = ($hours_worked- $abscence) * $hourly_rate;
                $sql  = "UPDATE teachers SET  number_of_hours=?, taux_horaire=?, salary=?, nombre_absence=?
                 WHERE teacher_id=?";
                $stmt = $conn->prepare($sql);
                $stmt->execute([$hours_worked, $hourly_rate, $net_salary,$abscence, $teacher_id]);
                $sm = "Mise a jour avec succes !";

                echo "Salaire brut : " . $brut_salary . "<br> ";
                echo "Salaire net : " . $net_salary;
            }
            ?>
        </div>
    </div>
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
