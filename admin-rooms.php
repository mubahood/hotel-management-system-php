<?php
require_once('functions.php');
if(isset($_GET['check_out'])){
    $check_out = (int)($_GET['check_out']);
    if($check_out>0){
        $books = get_table('bookings');
        foreach ($books as $key => $b) {

            if($b['room_id'] == $check_out){
                $d = date('Y-m-d');
                $_d = new DateTime($d);
                $_d->modify('-1 day');
                $date = $_d->format('Y-m-d');


                $sql = "UPDATE bookings SET check_out = '$date' WHERE room_id = $check_out";
                $conn->query($sql);

            }
        }

        header('Location: admin-rooms.php');
    }
}
$items = get_table('rooms');

include('header.php') ?>

<div class="card mb-5 mb-xl-10">
    <div class="card-header">
        <h3 class="card-title">Rooms</h3>
        <div class="card-toolbar">
            <a href="admin-room-create.php" type="button" class="btn btn-sm btn-primary">
                Create
            </a>
        </div>
    </div>

    <div class="card-body border-top p-9">
        <table id="table" class="table table-hover table-rounded table-striped border gy-7 gs-7">
            <thead>
                <th>ID</th>
                <th>Thumbnail</th>
                <th>Room name</th>
                <th>Action</th>
            </thead>
            <?php
            foreach ($items as $key => $val) { ?>
                <tr class="fw-bold fs-6 text-gray-800 border-bottom-2 border-gray-200">
                    <th><?= $val['id'] ?></th>
                    <td>
                        <div class="symbol symbol-50px">
                            <img src="<?= $val['photo'] ?>" alt="" />
                        </div>
                    </td>
                    <td>
                        <?= $val['name'] ?>
                        <?php if (is_room_available($val['id'])) { ?>
                            <br>
                            <span class="badge badge-success">Available</span>
                        <?php } else { ?>
                            <br>
                            <span class="badge badge-danger">IN USE</span>
                        <?php } ?>

                    </td>
                    <td>
                        <?php if (!is_room_available($val['id'])) { ?>
                            <a class="btn btn-light-danger border border-danger" href="admin-rooms.php?check_out=<?= $val['id'] ?>">CHECKOUT CUSTOMER</a>
                        <?php } else { ?>
                            <br>
                            <a class="btn btn-light-success border border-success" href="admin-booking-add.php?check_in=<?= $val['id'] ?>">CHECKIN NEW CUSTOMER</a>
                        <?php } ?>

                    </td>

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

    });
</script>