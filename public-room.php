<?php
require_once('functions.php');
$id = 0;
$found = false;
$R = null;
if (isset($_GET['id'])) {
    $id = (int)($_GET['id']);
    if ($id < 1) {
        die("Room id not found");
    }
    $rooms = get_table('rooms');
    foreach ($rooms as $key => $value) {
        if ($value['id'] == $id) {
            $found = true;
            $R = $value;
        }
    }
}

if (!$found) {
    dd("ROOM NOT FOUND!");
}
include('header-public.php');

$buildings = get_table('buildings');
$rooms = get_table('rooms');

?>
<div class="bg-primary text-white">
    <div class="container py-10">
        <h2 class="text-white" style="font-size: 5.5rem;">
            ROOM - <?= $R['name'] ?>
        </h2>
    </div>
</div>
<div class="container ">


    <div class="row">
        <div class="col-md-6 mt-10">
            <img alt="Logo" class="img-fluid" src="<?= $R['photo'] ?>" />
        </div>
        <div class="col-md-6 mt-10">
            <p class="text-primary h1 mb-0 pb-0">PRICE PER DAY</p>
            <p class="text-dark h1"><?= $R['price'] . " " . $CURRENCY ?></p>

            <p class="text-primary mt-5 h1 mb-0 pb-0">AVAILABILITY</p>

            <?php if (is_room_available($R['id'])) { ?>
                <span class="badge badge-success p-5 rounded-0 d-block fs-3">Available</span>

                <a href="admin-booking-add.php?check_in=<?= $R['id'] ?>" class="btn btn-primary btn-lg d-block rounded-0">BOOK THIS ROOM</a>

            <?php } else { ?>
                <br>
                <span class="badge badge-danger">IN USE</span>
            <?php } ?>





        </div>
    </div>



    <h1 class="text-dark pt-10 pb-5 text-primary" style="font-size: 2rem;">Room Details</h1>
    <p class="fs-2"><?= $R['details'] ?></p>
    <br>
    <br>
    <br>


</div>



<?php include('footer.php'); ?>