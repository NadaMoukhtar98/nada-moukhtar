<?php


$products = ['prodname', 'price', 'quantity'];


if ($_SERVER["REQUEST_METHOD"] == 'POST') {

    if (isset($_POST['submit'])) 
    {

        $name = $_POST['name'];
        $city = $_POST['city'];
        $product_num = $_POST['product_num'];
        $submit = $_POST['submit'];
        $limit = $product_num; 
                        
    } 
        
    if(isset($_POST['show_invoice']))
    {
        $invoice = drawInvoice($_POST);
            
    }    


} 
function inpfix(string $input) :?string{
    return $_POST[$input] ?? null;
}
function drawInvoice(array $products) :string{
        $table = '<table class="table">
                    <thead>
                        <th>
                            Name
                        </th>
                        <th>
                            Price
                        </th>
                        <th>
                            Quantity
                        </th>
                        <th>
                            Subtotal
                        </th>
                    </thead>
                    <tbody>';
                    foreach ($products as $value) {
                        $table .= "<th class='text-center'>{$value}</th>";
                            }
                            $table .= "</thead>
                                <tbody>";
                                $subtotal=0;
                                for ($i = 0; $i < $_POST['product_num']; $i++) {
                                    
                                    $table .= "
                                            <tr class='table-primary'>";
                                        foreach ($products as $Key) {
                                            
                                            if($Key==='ProductName'){
                                                $table .= "<td class='text-center'>".($_POST[$i.$Key])."</td>";
                                            }elseif($Key=='quantity' || $detailKey=='price'){
                                                $table .= "<td class='text-center'>".$_POST[$i.$Key]."</td>";
                                            }elseif($Key==='subtotal'){
                                                $table .= "<td class='text-center'>".($_POST[$i.'quantity']*$_POST[$i.'price'])." EGP</td>";
                                            }
                                            
                                        }
                                        $subtotal+= ($_POST[$i.'quantity']* $_POST[$i.'Price']);
                                        
                            $table .= "</tr>";
                            
                    }
                        $table .= " 

    // function old(string $input) :?string{
    //     return $_POST[$input] ?? null;
    // }
    function getDiscountPercentage(float $total) :float{
        if($total < 1000){
            return 0;
        }elseif($total >= 1000 && $total < 3000){
            return 0.1;
        }elseif($total >= 3000 && $total < 4500){
            return 0.15;
        }else{
            return 0.2;
        }
    }
    function getDeliveryFees(string $city) :float{
        switch ($city) {
            case 'cairo':
                return 0;
            case 'giza':
                return 30;
            case 'alex':
                return 50;
            default:
                return 100;
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

    <title> super market </title>
</head>

<body style="background-image: url('2.jpg');  background-size:100%;">
    <div class=" ml-5 col-5 mt-5">
        <div class="text-danger">
            <h1 mb-5> supermarket </h1>
        </div>
        <form method="POST" action="market.php">

            <div class="form-group ">
                <b> name : </b>
                <input type="text" name="name" id="number" class="form-control" placeholder="" aria-describedby="helpId" value="<?= inpfix('name') ?>"> <br>
                <b> city : </b>
                <select name=" city" value="<?= $_POST['city'] ?? "" ?>">

                <option <?= inpfix('city') == 'cairo' ? 'selected' : '' ?> value="cairo">Cairo</option>
                            <option <?= inpfix('city') == 'giza' ? 'selected' : '' ?> value="giza">Giza</option>
                            <option <?= inpfix('city') == 'alex' ? 'selected' : '' ?> value="alex">Alex</option>
                            <option <?= inpfix('city') == 'others' ? 'selected' : '' ?> value="others">Others</option>
                </select> <br><br>
                <b> Number of products : </b>
                <input type="number" name="product_num" id="number" class="form-control" aria-describedby="helpId" value="<?= inpfix('product_num') ?>">

            </div>
            <button name=" submit" class="btn bg-danger text-white" type="submit"> submit</button>
            <?php if (isset($_POST['submit'])) { ?>
            <div class="container">

                <!-- <div class="text-dark text-center">
                <h2> products Information </h2>
              </div> -->

                <table class="table col-10 ml-5 mx-auto table-bordered mt-5">
                    <thead class="text-light bg-danger">

                        <tr>
                            <?php foreach ($products as $value) { ?>
                                <th><?= ($value); ?></th>
                            <?php } ?>
                        </tr>

                    </thead>
                    <tbody class="bg-dark text-light">
                        <?php for ($i = 1; $i <= $limit; $i++) { ?>
                            <tr class='table-danger '>
                                <?php foreach ($products as $value) { ?>
                                    <?php if ($value == 'Prodname')
                                     { ?> {<td><input type='text' name='' > 
                                           <?php echo $info= $i.$value; ?>
                                         </td> ;}
                                     }else
                                     {<td><input type='number' name='' >
                                        <?php echo $info= $i.$value; ?>
                                    </td> ;}

                                    <?php }
                                    echo "<td><input>"; ?>
                                    <?php $info= $i.$value;?>

                                <?php }  ?>
                            </tr>

                        <?php } ?>

                    </tbody>
                </table>
               
                
                

            </div>
        <?php } ?>
        
        <?= $invoice ?? "" ?>
        <button class='btn bg-danger text-white' name='show_invoice'> Show Invoice </button>
    </form>
    
       
</body>

</html>