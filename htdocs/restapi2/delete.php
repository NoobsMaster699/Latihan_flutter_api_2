<?php
header('Content-Type: application/json');
include('db.php');
if (!isset($_POST['id'])) {
    echo json_encode("No Data Sent in delete.php");
} else {
    $id = $_POST['id'];
    $result = mysqli_query($db, "DELETE FROM employees WHERE id = {$id}");
    if ($result) {
        echo json_encode("Success");
    } else {
        echo json_encode("Failed");
    }
}
