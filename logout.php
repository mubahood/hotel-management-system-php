<?php
require_once('functions.php');
if(isset($_SESSION['u'])){
    unset($_SESSION['u']);
}
set_alert('Logged out successfully.', 'success');
header('Location: '.$BASE_URL);
die();
