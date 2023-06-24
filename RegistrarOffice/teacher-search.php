<?php 
session_start();
if (isset($_SESSION['r_user_id']) && 
isset($_SESSION['role'])) {

    if ($_SESSION['role'] == 'Registrar Office') {
        if (isset($_GET['searchKey'])) {

            $search_key = $_GET['searchKey'];
            include "../DB_connection.php";
            include "data/teacher.php";
            include "data/subject.php";
            include "data/grade.php";
            include "data/class.php";
            include "data/section.php";
            $teachers = searchTeachers($search_key, $conn); 
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Comptable - Rechercher enseignant -</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/style2.css">
	<link rel="icon" href="../G.S (2).png">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<?php 
    include "inc/navbar.php";

          
     ?>
           
           <form action="teacher-search.php" 
                 class="mt-3 n-table"
                 method="get">
             <div class="input-group mb-3">
                <input type="text" 
                       class="form-control"
                       name="searchKey"
                       placeholder="Rechercher..">
                <button class="btn btn-primary">
                        <i class="fa fa-search" 
                           aria-hidden="true"></i>
                      </button>
             </div>
           </form>

           

           <?php if (isset($_GET['error'])) { ?>             <!--Rechercher sa partie dans le code-->
            <div class="alert alert-danger mt-3 n-table" 
                 role="alert">
              <?=$_GET['error']?>
            </div>
            <?php } ?>

          <?php if (isset($_GET['success'])) { ?>
            <div class="alert alert-info mt-3 n-table" 
                 role="alert">
              <?=$_GET['success']?>
            </div>
            <?php } ?>
            
           

           <div class="table-responsive">
              <table class="table table-bordered mt-3 n-table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Nom d'utilisateur</th>
                    <th scope="col">Matières</th>
                    <th scope="col">Classes</th>
                    <th scope="col">Taux horaire(DH)</th>
                    <th scope="col">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  <?php $i = 0; foreach ($teachers as $teacher ) { 
                    $i++;  ?>
                  <tr>
                    <th scope="row"><?=$i?></th>
                    <td><?=$teacher['teacher_id']?></td>
                    <td><a href="teacher-view.php?teacher_id=<?=$teacher['teacher_id']?>">
                         <?=$teacher['fname']?></a></td>
                    <td><?=$teacher['lname']?></td>
                    <td><?=$teacher['username']?></td>
                    <td>
                       <?php 
                           $s = '';
                           $subjects = str_split(trim($teacher['subjects']));
                           foreach ($subjects as $subject) {
                              $s_temp = getSubjectById($subject, $conn);
                              if ($s_temp != 0) 
                                $s .=$s_temp['subject_code'].', ';
                           }
                           echo $s;
                        ?>
                    </td>
                    <td>
                      <?php 
                           $c = '';
                           $classes = str_split(trim($teacher['class']));

                           foreach ($classes as $class_id) {
                            
                               $class = getClassById($class_id, $conn);

                              $c_temp = getGradeById($class['grade'], $conn);
                              $section = getSectioById($class['section'], $conn);
                              if ($c_temp != 0) 
                                $c .=$c_temp['grade_code'].'-'.
                                     $c_temp['grade'].$section['section'].', ';
                           }
                           
                           echo $c;

                        ?>
                    </td>
                    <td><?=$teacher['taux_horaire']?></td>
                    <td>
                        <a href="calcul-salaire.php?teacher_id=<?=$teacher['teacher_id']?>"
                           class="btn btn-warning">Calculer le salaire</a>
                    </td>
                  </tr>
                <?php } ?>
                </tbody>
              </table>
           </div>
         <?php }else{ ?>
             <div class="alert alert-info .w-450 m-5" 
                  role="alert">
                Vide!
              </div>
         <?php } ?>
     </div>
     <a href="../logout.php" class="col btn btn-warning m-2 py-3 col-é">
          <i class="fa fa-sign-out fs-3" aria-hidden="true"></i><br>
           Se déconnecter
    </a> 
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>	
    <script>
        $(document).ready(function(){
             $("#navLinks li:nth-child(2) a").addClass('active');
        });
    </script>

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