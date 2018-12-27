<?php

// Required headers
// header("Access-Control-Allow-Origin: https://ecweb-dev.cros.tw/tw/");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
include('../config/core.php');
include('../config/Database.php');

// cors();


use config\Database;

$db = Database::init();
$sql = "SELECT image,type FROM event";
$stmt = $db->prepare($sql);
$stmt->execute();
$rc_a = $stmt->rowCount();
$rs_v = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT image,type FROM banner";
$stmt = $db->prepare($sql);
$stmt->execute();
$rc_b = $stmt->rowCount();
$rs_b = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT content FROM emergency WHERE is_open=?";
$stmt = $db->prepare($sql);
$stmt->execute(['1']);
$rc_e = $stmt->rowCount();
$rs_e = $stmt->fetchAll(PDO::FETCH_ASSOC);

$data = [
    'event' => $rs_v,
    'banner' => $rs_b,
    'emergnecy' => $rs_e
];

$response = ['data' => $data];

header('Content-Type: application/json; charset=utf-8');
http_response_code(200);
echo json_encode($response);