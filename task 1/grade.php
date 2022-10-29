<?php

define('maxgrade', 100);
define('totsum', 500);
$total = '';
$sum = '';
$message = '';
if ($_POST) {
    $s1 = $_POST['sub1'];
    $s2 = $_POST['sub2'];
    $s3 = $_POST['sub3'];
    $s4 = $_POST['sub4'];
    $s5 = $_POST['sub5'];
    $sum = $s1 + $s2 + $s3 + $s4 + $s5;
    $total = ($sum / totsum) * 100;
    if ($total > 100) {
        $total = "above 100";
    }



    if ($total >= 90 && $total <= maxgrade) {
        $message = "your grade is A  and your result is ";
    } elseif ($total >= 80 && $total < 90) {
        $message = "your grade is B  and your result is";
    } elseif ($total >= 70 && $total < 80) {
        $message = "your grade is C  and your result is";
    } elseif ($total >= 60 && $total < 70) {
        $message = "your grade is D  and your result is";
    } elseif ($total >= 40 && $total < 60) {
        $message = "your grade is E  and your result is";
    } elseif ($total < 40 && $total >= 0) {
        $message = "your grade is F  and your result is";
    } else {
        $message = "ERROR UNDefined ";
    }
}

?>

<!doctype html>
<html lang="en">

<head>
    <title> grades</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>

    <div class="contianer">
        <div class="row">
            <div class="col-12 text-center text-danger mt-5">
                <h1> my certificate </h1>
            </div>
            <div class="col-4 offset-4 mt-5">
                <form action="" method="post">
                    <div class="grades">
                        <label for="number" bold> sub1 : </label>
                        <input type="number" name="sub1" id="number" class="form-control" placeholder="" aria-describedby="helpId">
                        <label for="number"> sub2 : </label>
                        <input type="number" name="sub2" id="number" class="form-control" placeholder="" aria-describedby="helpId">
                        <label for="number"> sub3 : </label>
                        <input type="number" name="sub3" id="number" class="form-control" placeholder="" aria-describedby="helpId">
                        <label for="number"> sub4 : </label>
                        <input type="number" name="sub4" id="number" class="form-control" placeholder="" aria-describedby="helpId">
                        <label for="number"> sub5 : </label>
                        <input type="number" name="sub5" id="number" class="form-control" placeholder="" aria-describedby="helpId">
                    </div>
                    <div class="grades">
                        <button class="btn btn-outline-danger rounded form-control"> result </button>
                    </div>
                </form>
                <?php
                if ($_POST) {
                    echo $message .= $total;
                }

                ?>

            </div>
        </div>
    </div>
</body>

</html>