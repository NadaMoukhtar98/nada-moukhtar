<?php
    $title = "result";
    include "layouts/header.php";
    function drawResultTable($questions){
        $table="
            <table class='table'>
                <thead>
                    <th>Questions</th>
                    <th>opinion</th>
                </thead>
                <tbody>";
                    foreach($_SESSION['$Questions'] as $click=>$value){
                        $table.="
                        <tr>
                            <td>{$value}</td>
                            <td>{$_SESSION['rate'][$click]}</td>
                        </tr>
                        ";
                    }
                    $table.="
                        <tr>
                            <td> Result</td>";
                            if($_SESSION['result']<25){
                                $table.="<td>Bad</td></tr>";
                                
                            }else{
                                $table.="<td>Good</td></tr>";
                                
                            }
                $table.="</tbody>
            </table>";
            if($_SESSION['result']<25){
                $table.="<p>Our Team will contact you by this number {$_SESSION['number']}</p>";
            }else{
                $table.= "<p> Thank you </p>";
            }
        return $table;
    }

    $survay_result = drawResultTable($_SESSION['$Questions']);
    
?>


    <div class="container justify-content-center">
        <div class="col-8">
            <h2 class="text-center my-3 text-info"> Results</h2>
            <?=  $survay_result ?? "" ?>
        </div>
    </div>


<?php
include "layouts/scripts.php";
?>