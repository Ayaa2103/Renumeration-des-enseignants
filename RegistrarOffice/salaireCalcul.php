<?php
// Connexion à la base de données MySQL
$sName = "localhost";
$uName = "root";
$pass  = "";
$db_name = "sms_db";

$conn = new mysqli($sName, $uName, $pass, $db_name);

if ($conn->connect_error) {
  die('Échec de la connexion à la base de données : ' . $conn->connect_error);
}

// Requête pour récupérer les enseignants depuis la base de données
$sql = 'SELECT * FROM teachers';
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $salary = calculateSalary($row['hours_worked'], $row['absences'], $row['hourly_rate']);

    echo '<tr>';
    echo '<td>' . $row['full_name'] . '</td>';
    echo '<td>' . $row['monthly_salary'] . '</td>';
    echo '<td><input type="number" id="hours_' . $row['id'] . '" value="' . $row['hours_worked'] . '"></td>';
    echo '<td><input type="number" id="absences_' . $row['id'] . '" value="' . $row['absences'] . '"></td>';
    echo '<td>' . $row['hourly_rate'] . '</td>';
    echo '<td>' . $row['hour_price'] . '</td>';
    echo '<td><button onclick="calculateIndividualSalary(' . $row['id'] . ')">Calculer</button></td>';
    echo '</tr>';
  }
} else {
  echo '<tr><td colspan="7">Aucun enseignant trouvé.</td></tr>';
}

$conn->close();

function calculateSalary($hoursWorked, $absences, $hourlyRate) {
  // Calculer le salaire en fonction des informations fournies
  // Remplacer cette fonction par la logique de calcul réelle selon vos besoins
  return $hoursWorked * ($hourlyRate - ($absences * 2));
}
?>
