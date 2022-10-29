<?php
$title = "Review";
include "layouts/header.php";


$opinion = ['Questions', 'Bad', 'Good', 'Very Good', 'Excellent'];
$Questions = ["q1" => 'Are You satisfied with the cleaness level?', "q2" => 'Are you satisfied about service price ?', "q3" => 'Are you satisfied about nursing level ?', "q4" => 'Are you satisfied about our Doctors ?', "Q4" => 'Are you satisfied about our calmness level ?'];


if ($_SERVER['REQUEST_METHOD'] == "POST") {
    
    foreach ($Questionslist as $click => $value) {

        if (isset($_POST[$click])) 
        
         {
            $result = 0;
            $rate = [];

            foreach ($Questionslist as $click => $value ) { 

                $result += $_POST[$click];
                if ($_POST[$click] == 0) {
                    $rate += [$click => 'Bad'];
                } elseif ($_POST[$click] == 3) {
                    $rate += [$click => 'Good'];
                } elseif ($_POST[$click] == 5) {
                    $rate += [$click => 'Very Good'];
                } elseif ($_POST[$click] == 10) {
                    $rate += [$click => 'Excellent'];
                }
            }
            $_SESSION['rate'] = $rate;
            $_SESSION['result'] = $result;
            $_SESSION['Questionslist'] = $Questionslist;
            header("location:result.php");
            die;
           
            
        }
         
           
        
    } 
}
function drawSurvayTable($opinion, $Questions)
{
    $table = "
            <table class='table'>
                <thead>";
    foreach ($opinion as $value) {
        $table .= "<th>{$value}</th>";
    }
    $table .= "</thead>
                <tbody>";
    foreach ($Questions as $click => $value) {
        $table .= "
                        <tr>
                            <td >{$value}</td>
                            <td class='text-center'><input class='form-check-input' type='radio' name='{$click}' value='0'></td>
                            <td class='text-center'><input class='form-check-input' type='radio' name='{$click}' value='3'></td>
                            <td class='text-center'><input class='form-check-input' type='radio' name='{$click}' value='5'></td>
                            <td class='text-center'><input class='form-check-input' type='radio' name='{$click}' value='10'></td>
                        </tr>
                        ";
    }
    $table .= "</tbody>
            </table>
        ";
    return $table;
};
$table1 = drawSurvayTable ($opinion, $Questions);



?>


<div class="continer">
        <div class="row justify-content-center">
            <div class="col-12">
                <h2 class="text-info text-center"> Hospital Survay </h2>
            </div>
            <div class="col-8">
                <form method="post" action="result.php">
                    <?= $table1 ?? "" ?>
                    <input type="submit" class="btn btn-success" value="submit">
                </form>
            </div>

        </div>
</div>

<?php
include "layouts/scripts.php";
?>