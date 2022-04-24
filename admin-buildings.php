<?php
require_once('functions.php');
$items = get_table('buildings');

include('header.php') ?>

<div class="card mb-5 mb-xl-10">
    <div class="card-header">
        <h3 class="card-title">Buildings</h3>
        <div class="card-toolbar">
            <a href="admin-building-add.php" type="button" class="btn btn-sm btn-primary">
                Create
            </a>
        </div>
    </div>

    <div class="card-body border-top p-9">
        <table id="table" class="table table-hover table-rounded table-striped border gy-7 gs-7">
            <thead>
                <th>ID</th>
                <th>Thumbnail</th>
                <th>Building name</th>
                <th>Supervisor</th>
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
                    <td><?= $val['supervisor'] ?></td>
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