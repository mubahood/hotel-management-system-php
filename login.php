<?php
include_once('functions.php');

if(isset($_SESSION['u'])){
    header('Location: admin.php');
    die();
}
 
if (
	isset($_POST['password']) &&
	isset($_POST['email'])
) {
	$pass = trim($_POST['password']);
	$email = trim($_POST['email']);

	$users =  get_table('user');
	$u = null;
	foreach ($users as $user) {
		if (
			($user['username'] == $email) ||
			($user['email'] == $email)
		) {
			$u = $user;
		}
	}
	if ($u == null) {
		set_alert('Username or email not found.', 'danger');
		header('Location: login.php');
		die();
	}


	if (!password_verify($pass, $u['password'])) {
		set_alert('You entered a wrong password.', 'danger');
		header('Location: login.php');
		die();
	} else {
		$_SESSION['u'] = $u;
		set_alert('Successfully logged in.', 'success');
		header('Location: admin.php');
		die();
	}
}

include('head.php'); ?>


<body id="kt_body" class="bg-body">
	<!--begin::Main-->
	<!--begin::Root-->
	<div class="d-flex flex-column flex-root bg-primary">
		<!--begin::Authentication - Sign-in -->
		<div class="d-flex flex-column flex-column-fluid bgi-position-y-bottom position-x-center bgi-no-repeat bgi-size-contain bgi-attachment-fixed" style="background-image: url(assets/media/illustrations/sketchy-1/14.png">
			<!--begin::Content-->
			<div class="d-flex flex-center flex-column flex-column-fluid p-10 pb-lg-20">

				<div class="w-lg-500px bg-body rounded shadow-sm p-10 p-lg-15 mx-auto">
					<!--begin::Form-->
					<form method="post" class="form w-100">
						<!--begin::Heading-->

						<div class="text-center mb-10">
							<a href="/" class="mb-12">
								<img alt="Logo" src="images/logo-2.jpg" class="h-100px" />
							</a>
							<!--begin::Title-->
							<h1 class="text-dark mb-3">Sign In to <b><?= $APP_NAME ?></b></h1>
							<?php disaplay_alert() ?>
							<!--end::Title-->
						</div>
						
						
						<div class="row mb-2">
                            <div class="col-md-12">
                                <?= input_text([
                                    'label' => 'Email address',
                                    'name' => 'email',
                                    'required' => 'required',
                                    'type' => 'email',
                                ]) ?>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <?= input_text([
                                    'label' => 'Password',
                                    'name' => 'password',
                                    'required' => 'required',
                                    'type' => 'password',
                                ]) ?>
                            </div>
                        </div>



						<div class="text-center">
							<!--begin::Submit button-->
							<button type="submit" id="kt_sign_in_submit" class="btn btn-lg btn-primary w-100 mb-5">
								<span class="indicator-label">Login</span>
								<span class="indicator-progress">Please wait...
									<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
							</button>
						</div>
						<p class="fs-3 mt-3"><span class="text-muted">Don't have account?</span>
							<a href="register.php" class="fw-bold">Create account</a>
						</p>
						<!--end::Actions-->
					</form>
					<!--end::Form-->
				</div>
				<!--end::Wrapper-->
			</div>
			<!--end::Content-->
			<!--begin::Footer-->
			<div class="d-flex flex-center flex-column-auto p-10">
				<!--begin::Links-->
				<div class="d-flex align-items-center fw-bold fs-6">
					<a href="https://keenthemes.com" class="text-muted text-hover-primary px-2">About</a>
					<a href="mailto:support@keenthemes.com" class="text-muted text-hover-primary px-2">Contact</a>
					<a href="https://1.envato.market/EA4JP" class="text-muted text-hover-primary px-2">Contact Us</a>
				</div>
				<!--end::Links-->
			</div>
			<!--end::Footer-->
		</div>
		<!--end::Authentication - Sign-in-->
	</div>
	<!--end::Root-->
	<!--end::Main-->
	<!--begin::Javascript-->
	<script>
		var hostUrl = "assets/";
	</script>
	<!--begin::Global Javascript Bundle(used by all pages)-->
	<script src="assets/plugins/global/plugins.bundle.js"></script>
	<script src="assets/js/scripts.bundle.js"></script>
	<!--end::Global Javascript Bundle-->
	<!--begin::Page Custom Javascript(used by this page)-->
	<script src="assets/js/custom/authentication/sign-in/general.js"></script>
	<!--end::Page Custom Javascript-->
	<!--end::Javascript-->
</body>


<?php include('foot.php'); ?>