<?php

define('months', 12);

if ($_SERVER["REQUEST_METHOD"] == 'POST') {

    if (!empty($_POST['name'] && $_POST['loan'] && $_POST['pyears'])) {

        $user = [];
        $name = $_POST['name'];
        $loan = $_POST['loan'];
        $pyears = $_POST['pyears'];

        if ($pyears <= 3) {
            $interset = 0.10;
        } else {
            $interset = 0.15;
        }

        $month_rate = ($loan * $interset * $pyears);
        $credit = ($month_rate) + $loan;
        $monthly_installement = $credit / (months * $pyears);

        $user['name'] = $name;
        $user['loan'] = $loan . ' EGP ';
        $user['pyears'] = $pyears;
        $user['month_rate'] = $month_rate;
        $user['interset'] = $interset * 100 . " %";
        $user['credit'] = $credit . ' EGP ';
        $user['monthly_installement'] = $monthly_installement . ' EGP';
    }
} else {
    $warning = "Error, enter the inputs";
    echo $warning;
}


?>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title> Bank</title>
</head>

<body style="background-image: url('bg.jpg'); background-size:100%;">

    <div class="ml-5  col-5 mt-5">
        <div class="text-secondary">
            <h1 mb-5>Bank Account </h1>
        </div>
        <form method="POST" action="bank.php">

            <div class="form-group ">
                <b>Name:</b>
                <input class=" form-control" type=" text" name="name" value="<?= $_POST['name'] ?? "" ?>">

                <b>Loan :</b>
                <input " class=" form-control type=" number" name="loan" value="<?= $_POST['loan'] ?? "" ?>">

                <b> pay years:</b>
                <input class="form-control" type="number" name="pyears" value="<?= $_POST['pyears'] ?? "" ?>">

            </div>
            <button class="btn btn-outline-dark text-danger" type="submit" name="submit">submit</button>
            
        </form>
    </div>
    <?php if (!empty($user)) {  ?>

        <div class="container">


            <div class="text-dark text-center">
                <h2> User Information </h2>
            </div>

            <table class="table">
                <thead class="text-light bg-dark">

                    <tr>
                        <?php foreach ($user as $info => $value) { ?>
                            <th><?= ($info); ?></th>
                        <?php } ?>
                    </tr>

                </thead>
                <tbody class="bg-dark text-light">

                    <tr>
                        <?php foreach ($user as $info => $value) { ?>
                            <td><b><?= $value; ?></b> </td>
                        <?php } ?>
                    </tr>

                </tbody>
            </table>

        </div>

    <?php } ?>


</body>

</html>