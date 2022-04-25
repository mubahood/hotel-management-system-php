<?php include('header-public.php');

$buildings = get_table('buildings');
$rooms = get_table('rooms');
/*
             [id] => 3
            [name] => DELUXE KING
            [photo] => uploads/1650584591-hotel-sarina-bar.jpeg
            [supervisor] => 
            [details] => At Deluxe king you can indulge yourself in a big luxurious bed to relieve your all day’s hustle and bustle. The rooms are well equipped with all the necessary amenities. The spacious bathroom is another great feature of this room.
*/
?>
<div class="bg-primary text-white">
    <div class="container py-10">
        <h2 class="text-white" style="font-size: 5.5rem;">
            A lifetime of discounts? It's Genius.
        </h2>
        <p class="fw-light mt-10" style="font-size: 3rem;">Get rewarded for your travels – unlock instant savings of 10% or more with a free <b><?= $APP_NAME ?></b> account</p>
    </div>
</div>
<div class="container ">
    <h1 class="text-dark pt-10 pb-5" style="font-size: 2rem;">Browse by Buildings</h1>

    <div class="row">
        <?php
        foreach ($buildings as $k => $b) { ?>
            <a href="#" class="col-6 col-md-4 ">
                <div class="  rounded-0">
                    <img alt="Logo" class="img-fluid card-img-top rounded" src="<?= $b['photo'] ?>" />
                    <div class="p-0 px-0">
                        <h2 class="pt-5 pb-0 fs-1"><?= $b['name'] ?></h2>
                        <p class="mt-0">114 Rooms</p>
                    </div>
                </div>
            </a>
        <?php }
        ?>
    </div>



    <h1 class="text-dark py-10" style="font-size: 2rem;">Browse by rooms</h1>
    <div class="row">
        <?php
        foreach ($rooms as $k => $b) { ?>
            <a href="public-room.php?id=<?= $b['id'] ?>" class="col-6 col-md-3 ">
                <div class="card card-px-0 shadow-sm rounded-0">
                    <img alt="Logo" class="img-fluid card-img-top rounded-0" src="<?= $b['photo'] ?>" />
                    <div class="card-body bg-primary text-white p-0 px-5">
                        <h2 class="pt-5 pb-0 fs-4 text-white"><?= $b['name'] ?></h2>
                        <p class="mt-0"><?= $b['price'] ?> BDT</p>
                    </div>
                </div>
            </a>

        <?php }
        ?>
    </div>
    <br>
    <br>
    <br>


</div>



<?php include('footer.php'); ?>