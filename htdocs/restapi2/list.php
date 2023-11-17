<?php
header('Content-Type: application/json');
include('db.php');
$result = mysqli_query($db, "SELECT * FROM employees");
if ($result) {
    $rows = array();
    while ($r = mysqli_fetch_assoc($result)) {
        $rows[] = $r;
    }
    print json_encode($rows);
}
