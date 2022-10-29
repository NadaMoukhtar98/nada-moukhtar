<?php

$users = [
    (object)[
        'id' => 1,
        'name' => 'ahmed',
        "gender" => (object)[
            'gender' => 'm'
        ],
        'hobbies' => [
            'football', 'swimming', 'running',
        ],
        'activities' => [
            "school" => 'drawing',
            'home' => 'painting'
        ], 'phones' => ["123456"],

    ],
    (object)[
        'id' => 2,
        'name' => 'mohamed',
        "gender" => (object)[
            'gender' => 'm'
        ],
        'hobbies' => [
            'swimming', 'running',
        ],
        'activities' => [
            "school" => 'painting',
            'home' => 'drawing'
        ], 'phones' => ["123456"],

    ],
    (object)[
        'id' => 3,
        'name' => 'menna',
        "gender" => (object)[
            'gender' => 'f'
        ],
        'hobbies' => [
            'running',
        ],
        'activities' => [
            "school" => 'painting',
            'home' => 'drawing'
        ], 'phones' => ["0123123", "0151515155"],

    ]
];
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title> dynamic table </title>
</head>

<body>
    <div class="container">
        <div class="row ">
            <div class="col-12">
                <h1 class="text-center text-danger  my-5">
                    dynamic table
                </h1>
            </div>


            <div class="col-8 mx-auto">
                <?php if (!empty($users)) { ?>

                    <table class="table table-light  table-bordered text-center table-striped ">
                        <thead>
                            <tr class="thead-dark ">
                                <?php foreach ($users[0] as $property => $value) { ?>
                                    <th>
                                        <?php echo $property; ?>
                                    </th>
                                <?php } ?>

                            </tr>
                        </thead>

                        <tbody>
                            <?php foreach ($users as  $user) { ?>
                                <tr>
                                    <?php foreach ($user as $property => $value) { ?>
                                        <td>

                                            <?php if (is_array($value) == 'array' ||  is_object($value) == 'object') {

                                                foreach ($value as $headinfo => $info) {

                                                    if ($property == 'gender' && $headinfo == 'gender') {

                                                        if ($info == 'm') {
                                                            $info = 'male';
                                                        } elseif ($info == 'f') {
                                                            $info = 'female';
                                                        }
                                                    }
                                                    echo $info . '<br>';
                                                }
                                            } else {
                                                echo $value . '<br>';
                                            }
                                            ?>


                                        </td>

                                    <?php } ?>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                <?php } else {
                    echo "No Users Found";
                }
                ?>

            </div>

        </div>
    </div>
</body>

</html>