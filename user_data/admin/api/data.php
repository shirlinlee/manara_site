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
$sql = "SELECT image,type,link FROM event";
$stmt = $db->prepare($sql);
$stmt->execute();
$rc_v = $stmt->rowCount();
$rs_v = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT image,type,link FROM banner";
$stmt = $db->prepare($sql);
$stmt->execute();
$rc_b = $stmt->rowCount();
$rs_b = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT content FROM emergency WHERE is_open=?";
$stmt = $db->prepare($sql);
$stmt->execute([1]);
$rc_e = $stmt->rowCount();
$rs_e = $stmt->fetchAll(PDO::FETCH_ASSOC);

$sql = "SELECT title,content,date,image FROM news WHERE is_show=?";
$stmt = $db->prepare($sql);
$stmt->execute([1]);
$rc_n = $stmt->rowCount();
$rs_n = $stmt->fetchAll(PDO::FETCH_ASSOC);

$folder = ($_SERVER['SERVER_NAME'] == "localhost")? "":"user_data/admin";

foreach($rs_v as $key => $data_v)
{
    $rs_v[$key]['image'] = ($folder=="")? $data_v['image']: $folder."/".$data_v['image'];
}
foreach($rs_b as $key => $data_b)
{
    $rs_b[$key]['image'] = ($folder=="")? $data_b['image']: $folder."/".$data_b['image'];
}
foreach($rs_n as $key => $data_n)
{
    $rs_n[$key]['image'] = ($folder=="")? $data_n['image']: $folder."/".$data_n['image'];
}

$data = [
    'event' => $rs_v,
    'banner' => $rs_b,
    'emergnecy' => $rs_e,
    'news' => $rs_n
];

$response = ['data' => $data];

header('Content-Type: application/json; charset=utf-8');
http_response_code(200);
echo json_encode($response);