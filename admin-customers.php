<?php
require_once('functions.php');

$user_type = "";
if (isset($_SESSION['u'])) {
    if (isset($_SESSION['u']['user_type'])) {
        $user_type = $_SESSION['u']['user_type'];
    }
}
$u =  $_SESSION['u'];

$items = db_custom_select(
    "SELECT * FROM user WHERE
    user.user_type = 'customer'"
);



/*

          [id] => 1
            [] => DELUXE KING
            [username] => christinea
            [email] => christine@gmail.com
            [password] => $2y$10$Vjyzj5QNReEPs4FB2.AKduxvfK.743uvI0PuGKGdIqcxA7rL80Be6
            [created] => 2015-11-12 15:49:22
            [user_type] => customer
            [phone_number] => +8801632257609
            [customer_id] => 2
            [room_id] => 1
            [check_in] => 2022-04-23
            [check_out] => 2022-04-25
            [price] => 1
            [is_paid] => 0
            [details] => At Deluxe king you can indulge yourself in a big luxurious bed to relieve your all day’s hustle and bustle. The rooms are well equipped with all the necessary amenities. The spacious bathroom is another great feature of this room.


            [status] => pending
            [building_id] => 2
            [photo] => uploads/1650584724-deluxe-04.jpeg
            [photos] => ["uploads/1650584724-deluxe-04.jpeg"]
*/

include('header.php') ?>

<div class="card mb-5 mb-xl-10">
    <div class="card-header">
        <h3 class="card-title">Customers</h3>
        <div class="card-toolbar">
            <div class="d-flex align-items-center position-relative my-0 border border-primary rounded me-3">
                <span class="svg-icon svg-icon-1 position-absolute ms-6">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="black" />
                        <path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="black" />
                    </svg>
                </span>
                <input type="text" id="s" data-kt-customer-table-filter="search" class="form-control form-control-sm form-control-solid w-250px ps-15" placeholder="Search..." />
            </div>

            <a href="admin-booking-add.php" type="button" class="btn btn-sm btn-primary">
                Create new booking
            </a>
        </div>
    </div>

    <div class="card-body border-top p-9">
        <table id="table" class="table table-hover table-rounded table-striped border gy-2 gs-7 align-middle table-row-dashed">
            <thead>
                <tr class="text-start text-gray-700 fw-bolder fs-7 text-uppercase ">
                    <th>#ID</th>
                    <th>Customer</th>
                    <th>Name</th>
                    <th>Phone number</th>
                    <th>Joined</th>
                </tr>
            </thead>
            <?php
            foreach ($items as $key => $v) { ?>
                <tr class="fw-bold p-0 m-0 border-bottom-2 border-gray-200">
                    <th><?= $v['id'] ?></th>

                    <td class="p-1">
                        <div class="d-flex align-items-center ">
                            <div class="symbol symbol-50px symbol-circle me-5">
                                <img alt="Logo" src="<?= $v['avatar'] ?>" />
                            </div>
                            <div class="d-flex flex-column">
                                <div class="fw-bolder d-flex align-items-center fs-5"><?= $v['full_name'] ?></div>
                                <a href="#" class="fw-bold text-muted text-hover-primary fs-7"><?= $v['email'] ?></a>
                            </div>
                        </div>
                    </td>
                    <td class="pt-5"><?= $v['name'] ?></td>
                    <td class="pt-5"><?= $v['phone_number'] ?></td>
                    <td class="pt-5"><?= $v['created'] ?></td>

                </tr>
            <?php }
            ?>
        </table>
    </div>

</div>


<?php include('footer.php'); ?>
<script>
    $(document).ready(function() {
        $("#table").DataTable();
        var t = $('#table');
        t.DataTable();
        var s = $('#s');
        s.keyup(function(e) {
            t.DataTable().search(e.target.value).draw();
        });


    });
</script>