<?php include('header.php');

$user_type = "";
if (isset($_SESSION['u'])) {
    if (isset($_SESSION['u']['user_type'])) {
        $user_type = $_SESSION['u']['user_type'];
    }
}
$u =  $_SESSION['u'];

if ($user_type != 'customer' ) {
    $items = db_custom_select(
        'SELECT * FROM user,rooms,bookings WHERE
            bookings.customer_id = user.id AND
            bookings.room_id = rooms.id
        '
    );
} else {
    $items = db_custom_select(
        'SELECT * FROM user,rooms,bookings WHERE
            bookings.customer_id = user.id AND
            bookings.room_id = rooms.id AND
            bookings.customer_id = ' . $u['id'] . '
        '
    );
}

$approved = 0;
$pending = 0;
$all = 0;
foreach ($items as $key => $value) {
    $all++;
    if($value['status'] == 'pending'){
        $pending++;
    }else{
        $approved++;
    }
}
?>
                    
<div class="card">
    <div class="card-body">
        <h3 class="border-bottom border-4 border-primary pb-10 mb-10">Welcom dear <b class="text-primary"><?= $u['name'] ?></b></h3>

        <ul class="list-group">
            <li class="list-group-item active h3">Bookings summary</li>
            <li class="list-group-item d-flex justify-content-between">Pending bookings: <span class="badge badge-primary" ><?= $pending ?></span></li>
            <li class="list-group-item d-flex justify-content-between">Approved bookings: <span class="badge badge-success" ><?= $approved ?></span></li>
            <li class="list-group-item d-flex justify-content-between">All bookings: <span class="badge badge-primary" ><?= $all ?></span></li>
        </ul>
 
    </div>

</div>
   
 
 
	
<?php include('footer.php'); ?> 
