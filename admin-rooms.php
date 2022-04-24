<?php
require_once('functions.php');
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
                <th>Building</th>
            </thead>
            <?php
            foreach ($items as $key => $val) { ?>
                <tr class="fw-bold fs-6 text-gray-800 border-bottom-2 border-gray-200">
                    <th><?= $val['id'] ?></th>
                    <td>
                        <div class="symbol symbol-100px">
                            <img src="<?= $val['photo'] ?>" alt="" />
                        </div>
                    </td>
                    <td><?= $val['name'] ?></td>
                    <td><?= $val['building_id'] ?></td>
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