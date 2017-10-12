<?php
namespace app\api\controller;

class Index
{
    public function index()
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, 'http://192.168.1.43:9020/api/ui-operation/api/v/launcher_cell.json?tabId=162&token=');
        curl_setopt($curl, CURLOPT_HEADER, FALSE);    //表示需要response header
        curl_setopt($curl, CURLOPT_NOBODY, FALSE); //表
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        $data = curl_exec($curl);
        curl_close($curl);
//        $obj=json_decode($data);
//        echo json_encode($obj);
        echo $data;
    }
}
