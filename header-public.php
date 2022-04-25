<?php

require_once('functions.php');

include('head.php'); ?>

<body id="kt_body" class=" p-0 ">

    <div class="d-flex flex-column flex-root">
        <!--begin::Page-->
        <div class="page d-flex flex-row flex-column-fluid">


            <div class="wrapper d-flex flex-column flex-row-fluid" id="kt_wrapper">

                <div class="content d-flex flex-column flex-column-fluid mt-0 pt-0 mb-0 pb-0" id="kt_content">

                    <div class="post d-flex flex-column-fluid " id="kt_post">
                        <!--begin::Container-->
                        <div id="kt_content_container" class="container-fluid  mt-0">

                            <div class=" bg-primary">
                                <div class="container pt-10">
                                    <div class="d-flex justify-content-between py-5">
                                        <div class="">
                                            <h2 class="text-white fs-1 fw-bolder"><?= $APP_NAME ?></h2>
                                        </div>
                                        <div>
                                            <?php if (isset($_SESSION['u'])) {  ?>
                                                <a href="admin.php" class="text-white fs-1 border fw-bolder ps-5 pe-5">MY DASHBOAD</a>

                                            <?php } else { ?>
                                                <a href="register.php" class="text-white fs-1 border fw-bolder ps-5 pe-5">REGISTER</a>
                                                <a href="login.php" class="text-primary bg-white fs-1 border fw-bolder ps-5 pe-5 ms-5">LOGIN</a>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <?= disaplay_alert() ?>