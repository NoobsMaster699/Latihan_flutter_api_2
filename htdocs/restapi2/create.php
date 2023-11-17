<?php
header('Content-Type: application/json');
include('db.php');
if (!isset($_POST['nama']) && !isset($_POST['alamat']) && !isset($_POST['salary'])) {
    echo json_encode("No Data Sent in create.php");
} else {
    $nama = $_POST['nama'];
    $alamat = $_POST['alamat'];
    $salary = $_POST['salary'];
    $result = mysqli_query($db, "INSERT INTO employees (nama, alamat, salary) VALUES
('{$nama}','{$alamat}','{$salary}')");
    if ($result) {
        echo json_encode("Success");
    } else {
        echo json_encode("Failed");
    }
}
