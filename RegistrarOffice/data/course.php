<?php  

// All Students 
function removeCourse($id, $conn){
    $sql  = "DELETE FROM courses
            WHERE grade_id=?";
    $stmt = $conn->prepare($sql);
    $re   = $stmt->execute([$id]);
    if ($re) {
      return 1;
    }else {
     return 0;
    }
}