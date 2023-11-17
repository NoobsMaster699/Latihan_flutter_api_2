<?php
header('Content-Type: application/json');
include('db.php');
if (!isset($_POST['id']) && !isset($_POST['nama']) && !isset($_POST['alamat']) && !isset($_POST['salary'])) {
    echo json_encode("No Data Sent in update.php");
} else {
    $id = $_POST['id'];
    $nama = $_POST['nama'];
    $alamat = $_POST['alamat'];
    $salary = $_POST['salary'];
    $result = mysqli_query($db, "UPDATE employees SET nama = '{$nama}', alamat = '{$alamat}, salary = '{$salary}' WHERE id ={$id}");
    if ($result) {
        echo json_encode("Success");
    } else {
        echo json_encode("Failed");
    }
}
