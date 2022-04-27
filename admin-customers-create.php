<?php
require_once('functions.php');
$is_edit = false;
$id = 0;
$avatar_url = "images/avatar.jpg";
if (isset($_GET['edit'])) {
    $id = (int) (trim($_GET['edit']));
    $users = get_table('user');
    foreach ($users as $key => $u) {
        if ($u['id'] == $id) {
            $_SESSION['form_values'] = $u;
            $avatar_url = $u['avatar'];
            $is_edit = true;
        }
    }
}
if (isset($_POST['task'])) {

    $task = trim($_POST['task']);

    if ($task == 'create') {
        $d['name'] = $_POST['name'];
        $d['full_name'] = $_POST['name'];
        $d['phone_number'] = $_POST['phone_number'];
        $d['email'] = $_POST['email'];
        $d['username'] = $_POST['email'];
        $d['user_type'] = 'customer';
        $d['created'] = date('Y-m-d');
        $d['password'] = password_hash('4321', PASSWORD_DEFAULT);
        $d['details'] = $_POST['details'];
        $d['avatar'] = "images/avatar.jpg";

        $imgs = upload_files($_FILES);
        if ($imgs != null && !empty($imgs)) {
            $d['avatar'] = $imgs[0];
        }
        if (db_save('user', $d)) {
            set_alert('Customer created successfully!', 'success');
            header('Location: admin-customers.php');
            die();
        } else {
            $_SESSION['form_values'] = $_POST;
            set_alert('Failed to created Customer. Try again.', 'danger');
            header('Location: admin-customers-create.php');
            die();
        }
    } else {

        $id = ((int)($_POST['id']));
        $avatar = "";
        $imgs = upload_files($_FILES);
        if ($imgs != null && !empty($imgs)) {
            $avatar = "avatar  ='{$imgs[0]}',";
        }

        $password = password_hash('4321', PASSWORD_DEFAULT);
        $sql = "UPDATE user SET 
            name = '{$_POST['name']}',
            full_name = '{$_POST['name']}',
            phone_number = '{$_POST['phone_number']}',
            email = '{$_POST['email']}',
            username = '{$_POST['email']}',
            {$avatar}
            details = '{$_POST['details']}',
            password = '{$password}'
            WHERE
            id = {$id}
        ";

        $conn->QUERY($sql);
        set_alert('Customer account updated successfully!', 'success');
        header('Location: admin-customers.php');
        die();
    }


    die("Done");
}


include('header.php') ?>

<div class="card mb-5 mb-xl-10">
    <div class="card-header border-0 cursor-pointer" role="button" data-bs-toggle="collapse" data-bs-target="#kt_account_profile_details" aria-expanded="true" aria-controls="kt_account_profile_details">
        <div class="card-title m-0">
            <h3 class="fw-bolder m-0">User - create</h3>
        </div>
    </div>
    <div id="kt_account_settings_profile_details" class="collapse show">
        <form action="admin-customers-create.php" method="post" enctype="multipart/form-data" class="form">
            <?php if ($is_edit) { ?>
                <input type="hidden" name="task" hidden value="edit">
                <input type="hidden" name="id" hidden value="<?= $id ?>">
            <?php } else { ?>
                <input type="hidden" name="task" hidden value="create">
            <?php } ?>
            <div class="card-body border-top p-9">
                <div class="row">
                    <div class="col-md-4">
                        <div class="row mb-6">
                            <label class="col-lg-4 col-form-label fw-bold fs-6">User photo</label>
                            <div class="col-lg-8">
                                <!--begin::Image input-->
                                <div class="image-input image-input-outline" data-kt-image-input="true" style="background-image: url('assets/media/svg/avatars/blank.svg')">
                                    <!--begin::Preview existing avatar-->
                                    <div class="image-input-wrapper w-125px h-125px" style="background-image: url(<?= $avatar_url ?>)"></div>
                                    <!--end::Preview existing avatar-->
                                    <!--begin::Label-->
                                    <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                        <i class="bi bi-pencil-fill fs-7"></i>
                                        <!--begin::Inputs-->
                                        <input type="file" name="avatar" accept=".png, .jpg, .jpeg" />
                                        <input type="hidden" name="avatar_remove" />
                                        <!--end::Inputs-->
                                    </label>
                                    <!--end::Label-->
                                    <!--begin::Cancel-->
                                    <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="cancel" data-bs-toggle="tooltip" title="Cancel avatar">
                                        <i class="bi bi-x fs-2"></i>
                                    </span>
                                    <!--end::Cancel-->
                                    <!--begin::Remove-->
                                    <span class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="remove" data-bs-toggle="tooltip" title="Remove avatar">
                                        <i class="bi bi-x fs-2"></i>
                                    </span>
                                    <!--end::Remove-->
                                </div>
                                <!--end::Image input-->
                                <!--begin::Hint-->
                                <div class="form-text">Allowed file types: png, jpg, jpeg.</div>
                                <!--end::Hint-->
                            </div>
                            <!--end::Col-->
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-6">
                                <?= input_text([
                                    'label' => 'Full Name',
                                    'name' => 'name',
                                    'required' => 'required',
                                    'type' => 'text',
                                    'attributes' => '',
                                ]) ?>
                            </div>
                            <div class="col-md-6">
                                <?= input_text([
                                    'label' => 'Phone number',
                                    'name' => 'phone_number',
                                    'required' => 'required',
                                    'type' => 'text',
                                    'attributes' => '',
                                ]) ?>
                            </div>
                        </div>


                        <div class="row mt-3">
                            <div class="col-md-6">
                                <?= input_text([
                                    'label' => 'Email address',
                                    'name' => 'email',
                                    'required' => 'required',
                                    'type' => 'email',
                                ]) ?>
                            </div>
                            <div class="col-md-6">
                                <?= input_text([
                                    'label' => 'Password',
                                    'name' => 'password',
                                    'required' => 'required',
                                    'type' => 'password',
                                    'attributes' => ' minlength="2" maxlength="10" ',
                                ]) ?>
                            </div>
                        </div>


                        <div class="row mt-3">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="details" class="fw-bold fs-4">About user</label>
                                    <textarea rows="5" class="form-control form-control-md form-control-solid mb-3 mb-lg-0 border border-primary " name="details" id="details"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>




            </div>
            <!--end::Card body-->
            <!--begin::Actions-->
            <div class="card-footer d-flex justify-content-end py-6 px-9">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            <!--end::Actions-->
        </form>
        <!--end::Form-->
    </div>
    <!--end::Content-->
</div>


<?php include('footer.php'); ?>