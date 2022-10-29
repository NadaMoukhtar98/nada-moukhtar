<?php
$title = "number";
include "layouts/header.php";

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    if (empty($_POST['number'])) {
        echo "Please enter your number";
    } else {
        $_SESSION['number'] = $_POST['number'];
        header("location:review.php");
        die;
    }
}
?>

<body style="background-image: url('hospital.jpeg'); background-size:100%;">
    <div class="ml-5  col-5 mt-5 ">
        <div class="text-primary">
            <h1 mb-5> Hospital </h1>
        </div>
        <form method="POST" action="number.php" class="mt-5">

            <div class="form-group ">
                <b> Number </b>
                <input class=" form-control" type=" number" name="number" value="<?= $_POST['number'] ?? "" ?>">

            </div>
            <button class="btn btn-outline-dark text-light bg-primary " type="submit" name="submit"> review </button>

        </form>
    </div>

</body>

<?php
include "layouts/scripts.php";
?>