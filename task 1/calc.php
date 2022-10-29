<?php

$first_number = $_POST['first_number'];
$second_number = $_POST['second_number'];
$operator = $_POST['operator'];
$result = '';
if (is_numeric($first_number) && is_numeric($second_number)) {
    switch ($operator) {
        case "Add":
            $result = $first_number + $second_number;
            break;
        case "Subtract":
            $result = $first_number - $second_number;
            break;
        case "Multiply":
            $result = $first_number * $second_number;
            break;
        case "Divide":
            $result = $first_number / $second_number;
        case "reminder":
            $result = $first_number % $second_number;
    }
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

    <title> simple calculator </title>
</head>

<body> --

    <div class="row">
        <div class="col-12 text-center text-danger mt-5">
            <h1> simple calculater </h1>
        </div>
        <div class="col-4 offset-4 mt-5">
            <form action="" method="post" id="calc-form">
                <b>number1</b>
                <input type="number" name="first_number" id="first_number mb-5" <?php echo $first_number; ?>" /><br>
                <b>number2</b>
                <input type="number" name="second_number" id="second_number mb-5" <?php echo $second_number; ?>" /><br><br>


                <input type="submit" name="operator" value="Add" <button type="button" class="btn btn-danger"></button>
                <input type="submit" name="operator" value="Subtract" <button type="button" class="btn btn-danger"></button>
                <input type="submit" name="operator" value="Multiply" <button type="button" class="btn btn-danger"></button>
                <input type="submit" name="operator" value="Divide" <button type="button" class="btn btn-danger"></button>
                <input type="submit" name="operator" value="reminder" <button type="button" class="btn btn-danger"></button>
                <br><br>
                <b>Result1&2</b><input readonly="readonly" name="result" value="<?php echo $result; ?>">

        </div>
        </form>







    </div>

</body>

</html>