<?php
$conn = mysqli_connect("localhost", "root", "root", "hotelms");
$APP_NAME = 'Husna Hotels';
$BASE_URL = '/f3';
$CURRENCY = 'BDT';
$PAYMENT_LINK = 'https://ravesandbox.flutterwave.com/pay/li5cozm8erye';


my_session_start();



function get_rooms($status)
{
    $available = false;
    if ($status == 'available') {
        $available = true;
    }

    $all = get_table('rooms');
    $resp = [];
    foreach ($all as $k => $item) {
        if ($available) {
            if (is_room_available($item['id'])) {
                $resp[$item['id'] . ""] = "Room: " . $item['name'] . ", Building: #" . $item['building_id'];
            }
        } else {
            $resp[$item['id'] . ""] = "Room: " . $item['name'] . ", Building: #" . $item['building_id'];
        }
    }
    return $resp;
}

function is_room_available($id)
{
    $available = true;
    $bookings = get_table('bookings');
    foreach ($bookings as $k => $v) {
        if ($id == $v['room_id']) {
            if ($v['status'] == 'approved') {
                $today = date("Y-m-d");
                $expire = date($v['check_out']); //from database
                $today_time = strtotime($today);
                $expire_time = strtotime($expire);
                if ($expire_time < $today_time) {
                    $available = true;
                } else {
                    $available = false;
                }
            }
        }
    }
    return $available;
}



function get_users($user_type)
{
    $all = get_table('user');
    $resp = [];
    foreach ($all as $k => $u) {
        if (strlen($user_type) > 2) {
            if ($u['user_type'] == $user_type) {
                $resp[$u['id'] . ""] = $u['name'] . " - " . $u['phone_number'];
            }
        } else {
            $resp[$u['id'] . ""] = $u['name'] . " - " . $u['phone_number'];
        }
    }
    return $resp;
}



function upload_files($files)
{
    if ($files == null || empty($files)) {
        return [];
    }
    $imgs = [];

    foreach ($files as  $f) {
        if (!isset($f['error'])) {
            continue;
        }
        if ($f['error'] != 0) {
            continue;
        }

        $image_link = 'uploads/' . time() . "-" . $f['name'];
        move_uploaded_file($f['tmp_name'], $image_link);
        $imgs[] = $image_link;
    }
    return $imgs;
}
function my_session_start()
{
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    if (isset($_GET['check_in'])) {
        $check_in = (int)($_GET);
        if ($check_in > 0) {
            $_SESSION['form_values']['room_id'] = $check_in;
        }
    }

}

function set_alert($msg, $type)
{
    my_session_start();
    $_SESSION['alert'] = $msg;
    $_SESSION['type'] = $type;
}

function db_save($table, $data)
{
    global $conn;
    $cols = '';
    $val = '';
    $count = 0;
    foreach ($data as $key => $value) {
        $count++;
        if ($count < count($data)) {
            $cols .= $key . " , ";
            $val .= "'{$value}' , ";
        } else {
            $cols .= $key . "  ";
            $val .= "'" . $conn->real_escape_string($value) . "'  ";
        }
    }


    $sql = "INSERT INTO $table ($cols)VALUES($val)";
    return $conn->query($sql);
}

function db_get($table)
{
    return get_table($table);
}


function db_custom_select($sql)
{
    global $conn;
    $res = $conn->query($sql);
    $rows = [];
    if ($res != null) {
        while ($row = mysqli_fetch_assoc($res)) {
            $rows[] = $row;
        }
    }
    return $rows;
}



function get_table($table)
{
    global $conn;
    $sql = "SELECT * FROM $table";
    $res = $conn->query($sql);
    $rows = [];
    if ($res != null) {
        while ($row = mysqli_fetch_assoc($res)) {
            $rows[] = $row;
        }
    }
    return $rows;
}

function disaplay_alert()
{
    if (
        isset($_SESSION['alert']) &&
        isset($_SESSION['type'])
    ) {
        echo '<div class="alert alert-' . $_SESSION['type'] . '" >' . $_SESSION['alert'] . '</div>';

        unset($_SESSION['alert']);
        unset($_SESSION['type']);
    }
}

function dd($d)
{
    echo "<pre>";
    print_r($d);
    die();
}

function input_select($params)
{
    $params['name'] = isset($params['name']) ? $params['name'] : 'no_name';
    $params['label'] = isset($params['label']) ? $params['label'] : 'no label';
    $params['value'] = isset($params['value']) ? $params['value'] : '';
    $params['required'] = isset($params['required']) ? $params['required'] : '';
    $params['error'] = (isset($params['error']) && (strlen($params['error']) > 2)) ? '<div class="fs-7 fw-bold text-danger">' . $params['error'] . '</div>' : '';

    if(isset($_SESSION['form_values'])){
        if(isset($_SESSION['form_values'][$params['name']])){
            $params['value'] = $_SESSION['form_values'][$params['name']];
        }
    }

    if(isset($_SESSION['form_errors'])){
        if(isset($_SESSION['form_errors'][$params['name']])){
            $params['error'] = '<div class="fs-7 fw-bold text-danger">' . $_SESSION['form_errors'][$params['name']] . '</div>';
        }
    }



    $params['hint'] = (isset($params['hint']) && (strlen($params['hint']) > 2)) ? '<div class="fs-7 fw-bold text-muted">' . $params['hint'] . '</div>' : '';

    $params['options'] = isset($params['options']) ? $params['options'] : [];

    $options = '<option></option>';
    foreach ($params['options'] as $key => $value) {
        $selected = '';

        if ($key . "" == $params['value'] . "") {
            $selected = ' selected ';
        }

        $options .= '<option value="' . $key . '" ' . $selected . '>' . $value . '</option>';
    }

    echo <<<EOD
        <div class="form-group">
            <label class="{$params['required']} fs-4 fw-bold mb-0" for="{$params['name']}">{$params['label']}</label>
            <select data-control="select2" data-placeholder="Select an option" {$params['required']} class=" form-select form-select-solid border-primary"  name="{$params['name']}" required id="{$params['name']}">
                {$options}
            </select>
            {$params['hint']}
            {$params['error']}
        </div> 
        EOD;
}


function input_text($params)
{
    $params['name'] = isset($params['name']) ? $params['name'] : 'no_name';
    $params['label'] = isset($params['label']) ? $params['label'] : 'no label';
    $params['value'] = isset($params['value']) ? $params['value'] : '';
    $params['type'] = isset($params['type']) ? $params['type'] : 'text';
    $params['attributes'] = isset($params['attributes']) ? $params['attributes'] : '';
    $params['required'] = isset($params['required']) ? $params['required'] : '';
    $params['hint'] = (isset($params['hint']) && (strlen($params['hint']) > 2)) ? '<div class="fs-7 fw-bold text-muted">' . $params['hint'] . '</div>' : '';
    $params['error'] = (isset($params['error']) && (strlen($params['error']) > 2)) ? '<div class="fs-7 fw-bold text-danger">' . $params['error'] . '</div>' : '';


    if(isset($_SESSION['form_values'])){
        if(isset($_SESSION['form_values'][$params['name']])){
            $params['value'] = $_SESSION['form_values'][$params['name']];
        }
    }

    if(isset($_SESSION['form_errors'])){
        if(isset($_SESSION['form_errors'][$params['name']])){
            $params['error'] = '<div class="fs-7 fw-bold text-danger">' . $_SESSION['form_errors'][$params['name']] . '</div>';
        }
    }



    echo <<<EOD
            <div class="form-group mb-3">
                <label class="{$params['required']}  fs-4 fw-bold mb-0" for="{$params['name']}">{$params['label']}</label>
                <input value="{$params['value']}" class="form-control form-control-md border-primary form-control-solid " type="{$params['type']}" name="{$params['name']}" {$params['attributes']} {$params['required']} id="{$params['name']}">
                {$params['hint']}
                {$params['error']}
            </div>
        EOD;
}
