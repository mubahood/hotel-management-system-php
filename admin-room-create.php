<?php 
require_once('functions.php');
if(isset($_POST['name'])){
    $imgs = upload_files($_FILES);
    $d['photo'] = "no_imaage.jpg";
    $d['photos'] = '[]';
    
    if($imgs!=null && !empty($imgs)){
        $d['photo'] = $imgs[0];
        $d['photos'] = json_encode($imgs);
    }
    $d['name'] = $_POST['name'];
    $d['building_id'] = $_POST['building_id'];
    $d['details'] = $_POST['details'];
    $d['price'] = $_POST['price'];
    
    if(db_save( 'rooms', $d)){
        set_alert('Building created successfully!', 'success');
		header('Location: admin-rooms.php');
        die();
    }else{
        set_alert('Failed to created Building. Try again.', 'danger');
		header('Location: admin-rooms-create.php');
        die();
    }
 
}


include('header.php') ?>

<div class="card mb-5 mb-xl-10">
    <!--begin::Card header-->
    <div class="card-header border-0 cursor-pointer" role="button" data-bs-toggle="collapse" data-bs-target="#kt_account_profile_details" aria-expanded="true" aria-controls="kt_account_profile_details">
        <!--begin::Card title-->
        <div class="card-title m-0">
            <h3 class="fw-bolder m-0">Room - create</h3>
        </div>
        <!--end::Card title-->
    </div>
    <!--begin::Card header-->
    <!--begin::Content-->
    <div id="kt_account_settings_profile_details" class="collapse show">
        <!--begin::Form-->
        <form action="admin-room-create.php" method="post" enctype="multipart/form-data" class="form">
            <!--begin::Card body-->
            <div class="card-body border-top p-9">
                <!--begin::Input group-->
                <div class="row mb-6">
                    <!--begin::Label-->
                    <label class="col-lg-4 col-form-label fw-bold fs-6">Room photos</label>
                    <!--end::Label-->
                    <!--begin::Col-->
                    <div class="col-lg-8">
                        <!--begin::Image input-->
                        <div class="image-input image-input-outline" data-kt-image-input="true" style="background-image: url('assets/media/svg/avatars/blank.svg')">
                            <!--begin::Preview existing avatar-->
                            <div class="image-input-wrapper w-125px h-125px" style="background-image: url(assets/images/building.jpeg)"></div>
                            <!--end::Preview existing avatar-->
                            <!--begin::Label-->
                            <label class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow" data-kt-image-input-action="change" data-bs-toggle="tooltip" title="Change avatar">
                                <i class="bi bi-pencil-fill fs-7"></i>
                                <!--begin::Inputs-->
                                <input type="file" multiple name="avatar" accept=".png, .jpg, .jpeg" />
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


                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">Room name</label>
                            <input class="form-control form-control-md form-control-solid mb-3 mb-lg-0" type="text" name="name" required id="name">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">Price per day</label>
                            <input class="form-control form-control-md form-control-solid mb-3 mb-lg-0" type="number" name="price" required id="name">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="building_id">Building</label>
                            <select required name="building_id" id="building_id" class="form-control form-control-md form-control-solid mb-3 mb-lg-0"  >
                                <option value=""></option>
                                <?php 
                                    $items = db_get('buildings');
                                    foreach ($items as $key => $value) { ?>
                                    <option value="<?= $value['id'] ?>"><?= $value['name'] ?></option>
                                    <?php } ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="details">Room details</label>
                            <textarea rows="5" class="form-control form-control-md form-control-solid mb-3 mb-lg-0" name="details" required id="details"></textarea>
                        </div>
                    </div>
                </div>
                
            </div>
            <!--end::Card body-->
            <!--begin::Actions-->
            <div class="card-footer d-flex justify-content-end py-6 px-9">
                <button type="reset" class="btn btn-light btn-active-light-primary me-2">Discard</button>
                <button type="submit" class="btn btn-primary" id="kt_account_profile_details_submit">Save Changes</button>
            </div>
            <!--end::Actions-->
        </form>
        <!--end::Form-->
    </div>
    <!--end::Content-->
</div>


<?php include('footer.php'); ?>