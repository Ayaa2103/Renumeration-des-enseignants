<?php  

// Get Teacher by ID
function getTeacherById($teacher_id, $conn){
   $sql = "SELECT * FROM teachers
           WHERE teacher_id=?";
   $stmt = $conn->prepare($sql);
   $stmt->execute([$teacher_id]);

   if ($stmt->rowCount() == 1) {
     $teacher = $stmt->fetch();
     return $teacher;
   }else {
    return 0;
   }
}

function getNumberOfHoursById($teacher_id, $conn){
  $sql = "SELECT number_of_hours FROM teachers
          WHERE teacher_id=?";
  $stmt = $conn->prepare($sql);
  $stmt->execute();

  if ($stmt->rowCount() == 1) {
    $numberHours = $stmt->fetch();
    return $numberHours;
  }else {
   return 0;
  }
}


