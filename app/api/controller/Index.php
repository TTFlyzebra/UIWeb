<?php
namespace app\api\controller;

class Index
{
    public function index()
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, 'http://192.168.1.43:9020/api/ui-operation/api/v/launcher_cell.json?tabId=155&token=');
        curl_setopt($curl, CURLOPT_HEADER, 1);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 0);
        $data = curl_exec($curl);
        curl_close($curl);
        echo $data;
    }
}
