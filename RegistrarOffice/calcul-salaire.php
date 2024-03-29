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
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="number"] {
            width: 100%;
            padding: 5px;
        }

        input[type="submit"] {
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
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Calculateur de salaire</h2>
        <form action="calculate_salary.php" method="post">
            <div class="form-group">
                <label for="hours_worked">Nombre d'heures travaillées :</label>
                <input type="number" name="hours_worked" id="hours_worked" required>
            </div>
            <div class="form-group">
                <label for="hourly_rate">Taux horaire :</label>
                <input type="number" name="hourly_rate" id="hourly_rate" required>
            </div>
            <div class="form-group">
                <label for="deductions">Déductions :</label>
                <input type="number" name="deductions" id="deductions" required>
            </div>
            <input type="submit" value="Calculer">
        </form>
        <div class="result">
            <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $hours_worked = $_POST["hours_worked"];
                $hourly_rate = $_POST["hourly_rate"];
                $deductions = $_POST["deductions"];

                $gross_salary = $hours_worked * $hourly_rate;
                $net_salary = $gross_salary - $deductions;

                echo "Salaire brut : " . $gross_salary . "<br>";
                echo "Salaire net : " . $net_salary;
            }
            ?>
        </div>
    </div>
</body>
</html>

<?php 

