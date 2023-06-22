<?php 
session_start();
if (isset($_SESSION['admin_id']) && 
    isset($_SESSION['role'])     &&
    isset($_GET['teacher_id'])) {

    if ($_SESSION['role'] == 'Admin') {
      
       include "../DB_connection.php";
       include "data/subject.php";
       include "data/grade.php";
       include "data/section.php";
       include "data/class.php";
       include "data/teacher.php";
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
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Admin - Modifier enseignant</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/style.css">
	<link rel="icon" href="../G.S (2).png">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <?php 
        include "inc/navbar.php";
     ?>
     <div class="container mt-5">
        <a href="teacher.php"
           class="btn btn-dark">Revenir</a>

        <form method="post"
              class="shadow p-3 mt-5 form-w" 
              action="req/teacher-edit.php">
        <h3>Modifier un enseignant</h3><hr>
        <?php if (isset($_GET['error'])) { ?>
          <div class="alert alert-danger" role="alert">
           <?=$_GET['error']?>
          </div>
        <?php } ?>
        <?php if (isset($_GET['success'])) { ?>
          <div class="alert alert-success" role="alert">
           <?=$_GET['success']?>
          </div>
        <?php } ?>
        <div class="mb-3">
          <label class="form-label">Prénom</label>
          <input type="text" 
                 class="form-control"
                 value="<?=$teacher['fname']?>" 
                 name="fname">
        </div>
        <div class="mb-3">
          <label class="form-label">Nom</label>
          <input type="text" 
                 class="form-control"
                 value="<?=$teacher['lname']?>"
                 name="lname">
        </div>
        <div class="mb-3">
          <label class="form-label">Nom d'utilisateur</label>
          <input type="text" 
                 class="form-control"
                 value="<?=$teacher['username']?>"
                 name="username">
        </div>
        <div class="mb-3">
          <label class="form-label">Adresse de domicile</label>
          <input type="text" 
                 class="form-control"
                 value="<?=$teacher['address']?>"
                 name="address">
        </div>
        <div class="mb-3">
          <label class="form-label">Numéro ID</label>
          <input type="text" 
                 class="form-control"
                 value="<?=$teacher['employee_number']?>"
                 name="employee_number">
        </div>
        <div class="mb-3">
          <label class="form-label">Date de naissance</label>
          <input type="date" 
                 class="form-control"
                 value="<?=$teacher['date_of_birth']?>"
                 name="date_of_birth">
        </div>
        <div class="mb-3">
          <label class="form-label">Numéro de téléphone</label>
          <input type="text" 
                 class="form-control"
                 value="<?=$teacher['phone_number']?>"
                 name="phone_number">
        </div>
        <div class="mb-3">
          <label class="form-label">Niveau d'études</label>
          <input type="text" 
                 class="form-control"
                 value="<?=$teacher['qualification']?>"
                 name="qualification">
        </div>
        <div class="mb-3">
          <label class="form-label">Salaire</label>
          <input type="number" 
                 class="form-control"
                 value="<?=$teacher['salary']?>"
                 name="salary">
        </div>
        <div class="mb-3">
          <label class="form-label">Taux horaire</label>
          <input type="number" 
                 class="form-control"
                 value="<?=$teacher['taux_horaire']?>"
                 name="taux_horaire">
        </div>
        
        <div class="mb-3">
          <label class="form-label">Adresse E-mail</label>
          <input type="text" 
                 class="form-control"
                 value="<?=$teacher['email_address']?>"
                 name="email_address">
        </div>
        <div class="mb-3">
          <label class="form-label">Genre</label><br>
          <input type="radio"
                 value="Male"
                 <?php if($teacher['gender'] == 'Male') echo 'checked';  ?> 
                 name="gender"> Homme
                 &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio"
                 value="Female"
                 <?php if($teacher['gender'] == 'Female') echo 'checked';  ?> 
                 name="gender"> Femme
        </div>
        <input type="text"
                value="<?=$teacher['teacher_id']?>"
                name="teacher_id"
                hidden>

        <div class="mb-3">
          <label class="form-label">Matières</label>
          <div class="row row-cols-5">
            <?php 
            $subject_ids = str_split(trim($teacher['subjects']));
            foreach ($subjects as $subject){ 
              $checked =0;
              foreach ($subject_ids as $subject_id ) {
                if ($subject_id == $subject['subject_id']) {
                   $checked =1;
                }
              }
            ?>
            <div class="col">
              <input type="checkbox"
                     name="subjects[]"
                     <?php if($checked) echo "checked"; ?>
                     value="<?=$subject['subject_id']?>">
                     <?=$subject['subject']?>
            </div>
            <?php } ?>
             
          </div>
        </div>
        <div class="mb-3">
          <label class="form-label">Classes</label>
          <div class="row row-cols-5">
            <?php 
            $class_ids = str_split(trim($teacher['class']));
            foreach ($classes as $class){ 
              $checked =0;
              foreach ($class_ids as $class_id ) {
                if ($class_id == $class['class_id']) {
                   $checked =1;
                }
              }
              $grade = getGradeById($class['class_id'], $conn);
            ?>
            <div class="col">
              <input type="checkbox"
                     name="classes[]"
                     <?php if($checked) echo "checked"; ?>
                     value="<?=$grade['grade_id']?>">
                     <?php if (isset($grade['grade_code']) && isset($grade['grade'])) { ?>
    <?=$grade['grade_code']?>-<?=$grade['grade']?>
<?php } ?>

            </div>
            <?php } ?>
             
          </div>
        </div>

      <button type="submit" 
              class="btn btn-primary">
              Mettre a jour</button>
     </form>

     <form method="post"
              class="shadow p-3 my-5 form-w" 
              action="req/teacher-change.php"
              id="change_password">
        <h3>Changer le mot de passe</h3><hr>
          <?php if (isset($_GET['perror'])) { ?>
            <div class="alert alert-danger" role="alert">
             <?=$_GET['perror']?>
            </div>
          <?php } ?>
          <?php if (isset($_GET['psuccess'])) { ?>
            <div class="alert alert-success" role="alert">
             <?=$_GET['psuccess']?>
            </div>
          <?php } ?>

       <div class="mb-3">
            <div class="mb-3">
            <label class="form-label">Mot de passe Admin </label>
                <input type="password" 
                       class="form-control"
                       name="admin_pass"> 
          </div>

            <label class="form-label">Nouveau mot de passe</label>
            <div class="input-group mb-3">
                <input type="text" 
                       class="form-control"
                       name="new_pass"
                       id="passInput">
                
            </div>
            
          </div>
          <input type="text"
                value="<?=$teacher['teacher_id']?>"
                name="teacher_id"
                hidden>

          <div class="mb-3">
            <label class="form-label">Confirmer mot de passe  </label>
                <input type="text" 
                       class="form-control"
                       name="c_new_pass"
                       id="passInput2"> 
          </div>
          <button type="submit" 
              class="btn btn-primary">
              Changer</button>
        </form>
     </div>
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>	
    <script>
        $(document).ready(function(){
             $("#navLinks li:nth-child(2) a").addClass('active');
        });

        function makePass(length) {
            var result           = '';
            var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            var charactersLength = characters.length;
            for ( var i = 0; i < length; i++ ) {
              result += characters.charAt(Math.floor(Math.random() * 
         charactersLength));

           }
           var passInput = document.getElementById('passInput');
           var passInput2 = document.getElementById('passInput2');
           passInput.value = result;
           passInput2.value = result;
        }

        var gBtn = document.getElementById('gBtn');
        gBtn.addEventListener('click', function(e){
          e.preventDefault();
          makePass(4);
        });
    </script>

</body>
</html>
<?php 

  }else {
    header("Location: teacher.php");
    exit;
  } 
}else {
	header("Location: teacher.php");
	exit;
} 

?>