<?php
require_once('functions.php');

$edit_id = 0;
$is_edit = false;
if(isset($_GET['edit'])){
    $id = ((int)($_GET['edit']));
    if($id>0){
        $items = db_custom_select(
            'SELECT * FROM user,rooms,bookings WHERE
                bookings.customer_id = user.id AND
                bookings.id = '.$id.' AND
                bookings.room_id = rooms.id
            '
        );
        if(isset($items[0])){
            $item = $items[0];
            $is_edit = true;
            $edit_id = $id;
            $_SESSION['form_values'] = $item;
        }
    }
}



$customers = get_users('customer');
$rooms = get_rooms('available');


if (isset($_POST['check_in'])) {


    $_SESSION['form_values'] = $_POST;
    $d['customer_id'] = $_POST['customer_id'];
    $d['room_id'] = $_POST['room_id'];
    $d['check_in'] = $_POST['check_in'];
    $d['check_out'] = $_POST['check_out'];
    $d['is_paid'] = $_POST['is_paid'];
    $d['details'] = $_POST['details'];
    $d['status'] = $_POST['status'];
    $d['price'] = 1;
 
    date_default_timezone_set('UTC');


    $date = $d['check_in'];
    $end_date = $d['check_out'];
    $days = 0;
    while (strtotime($date) <= strtotime($end_date)) {
        $days++;
        $_d = new DateTime($date);
        $_d->modify('+1 day');
        $date = $_d->format('Y-m-d');
    }


    if ($days < 1) {
        set_alert('You selected a wrong date  range. Please select corret date range and try again.', 'danger');
        $_SESSION['form_errors']['check_in'] = 'Invalid date range';
        $_SESSION['form_errors']['check_out'] = 'Invalid date range';
        header('Location: admin-booking-add.php');
        die();
    }

    $rooms = get_table('rooms');
    foreach ($rooms as $k => $v) {
        if ($v['id'] == $d['room_id']) {
            $d['price'] = $v['price'] * $days;
        }
    }



    if (db_save('bookings', $d)) {
        if (isset($_SESSION['form_errors'])) {
            unset($_SESSION['form_errors']);
        }
        if (isset($_SESSION['form_values'])) {
            unset($_SESSION['form_values']);
        }
        set_alert('Room booked successfully!', 'success');
        header('Location: admin-bookings.php');
        die();
    } else {
        set_alert('Failed to created Building. Try again.', 'danger');
        header('Location: admin-bookings-add.php');
        die();
    }
}


include('header.php') ?>

<div class="card mb-5 mb-xl-10">
    <div class="card-header border-0 cursor-pointer" role="button" data-bs-toggle="collapse" data-bs-target="#kt_account_profile_details" aria-expanded="true" aria-controls="kt_account_profile_details">
        <h3 class="card-title">Booking - <?php if($is_edit){echo  "Update";} else  {echo 'Create';} ?></h3>
        <div class="card-toolbar">
            <a href="admin-bookings.php" class="btn btn-sm btn-dark">
                All bookings
            </a>
        </div>
    </div>
    <div id="kt_account_settings_profile_details" class="collapse show">
        <form action="admin-booking-add.php" method="post" enctype="multipart/form-data" class="form">
            <div class="card-body border-top p-9">

                <div class="row">

                    <div class="col-md-6 mb-4">
                        <?= input_select([
                            'label' => 'Customer',
                            'name' => 'customer_id',
                            'hint' => 'If customer is in the list, go to customers tab and create them first.',
                            'required' => 'required',
                            'value' => '',
                            'options' => $customers,
                        ]) ?>
                    </div>

                    <div class="col-md-6 mb-4">
                        <?= input_select([
                            'label' => 'Rooms available',
                            'name' => 'room_id',
                            'hint' => 'Only rooms available for booking are on this list.',
                            'required' => 'required',
                            'value' => '',
                            'options' => $rooms,
                        ]) ?>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <?= input_text([
                                'label' => 'Check in date',
                                'name' => 'check_in',
                                'hint' => 'Start date',
                                'required' => 'required',
                                'value' => '',
                                'type' => 'date',
                                'attributes' => '',
                            ]) ?>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <?= input_text([
                                'label' => 'Check out date',
                                'name' => 'check_out',
                                'hint' => 'End date',
                                'required' => 'required',
                                'value' => '',
                                'type' => 'date',
                                'attributes' => '',
                            ]) ?>
                        </div>
                    </div>
                </div>


                <div class="row">

                    <div class="col-md-6 mb-4">
                        <?= input_select([
                            'label' => 'Payment status',
                            'name' => 'is_paid',
                            'required' => 'required',
                            'value' => '',
                            'options' => [
                                '0' => 'Not paid',
                                '1' => 'Paid',
                            ],
                        ]) ?>
                    </div>

                    <div class="col-md-6 mb-4">
                        <?= input_select([
                            'label' => 'Booking status',
                            'name' => 'status',
                            'required' => 'required',
                            'value' => '',
                            'options' => [
                                'pending' => 'Pending',
                                'approved' => 'Approved',
                                'canceled' => 'Canceled',
                            ],
                        ]) ?>
                    </div>
                </div>


                <div class="row mt-3">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="fs-4 fw-bold mb-0">Booking details details</label>
                            <textarea rows="3" class="form-control form-control-md form-control-solid mb-3 mb-lg-0" name="details" id="details"></textarea>
                        </div>
                    </div>
                </div>

            </div>
            <!--end::Card body-->
            <!--begin::Actions-->
            <div class="card-footer d-flex justify-content-end py-6 px-9">
                <button type="submit" class="btn btn-primary" id="kt_account_profile_details_submit">Submit</button>
            </div>
            <!--end::Actions-->
        </form>
        <!--end::Form-->
    </div>
    <!--end::Content-->
</div>


<?php include('footer.php'); ?>