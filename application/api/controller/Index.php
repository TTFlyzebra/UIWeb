<?php

namespace app\api\controller;

use think\Db;
use think\Session;

class Index
{
    public function index()
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, 'http://192.168.1.119:801/olduiweb/api/cell');
        curl_setopt($curl, CURLOPT_HEADER, FALSE);    //表示需要response header
        curl_setopt($curl, CURLOPT_NOBODY, FALSE); //表
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        $data = curl_exec($curl);
        curl_close($curl);
        $cells = json_decode($data, true);
        for ($i = 0; $i < sizeof($cells); $i++) {
            $newcells[$i]['cellId'] = $cells[$i]['cellId'];
            $newcells[$i]['description'] = $cells[$i]['textTitle'];
            $newcells[$i]['themeId'] = 5;
            $newcells[$i]['celltypeId'] = $cells[$i]['celltypeId'];
            $newcells[$i]['width'] = $cells[$i]['width'];
            $newcells[$i]['height'] = $cells[$i]['height'];
            $newcells[$i]['backColor'] = $cells[$i]['backcolor'];
            $newcells[$i]['recv'] = $cells[$i]['recvAction'];
            $send['packName'] = $cells[$i]['launchAction'];
            $send['className'] = $cells[$i]['acceptAction'];
            if(empty($send['packName'])&&empty($send['className'])){
                $newcells[$i]['send'] = null;
            }else{
                $newcells[$i]['send'] = json_encode($send);
            }
            $text[0]['textSize'] = $cells[$i]['textSize'];
            $language['zh_rCN'] = $cells[$i]['textTitle'];
            $text[0]['text'] = json_encode($language);
            $text[0]['textColor'] = $cells[$i]['textColor'];
            $text[0]['left'] = $cells[$i]['mLeft'];
            $text[0]['top'] = $cells[$i]['mTop'];
            $text[0]['right'] = $cells[$i]['mRight'];
            $text[0]['bottom'] = $cells[$i]['mBottom'];
            $text[0]['gravity'] = $cells[$i]['gravity'];
            $newcells[$i]['texts'] = json_encode($text);
            $image[0]['url'] = $cells[$i]['imageurl1'];
            $image[0]['width'] = $cells[$i]['width'];
            $image[0]['height'] = $cells[$i]['height'];
            $image[0]['left'] = 0;
            $image[0]['top'] = 0;
            $image[0]['right'] = 0;
            $image[0]['bottom'] = 0;
//            $image[1]['url'] = $cells[$i]['imageurl2'];
//            $image[1]['width'] = $cells[$i]['width'];
//            $image[1]['height'] = $cells[$i]['height'];
//            $image[1]['left'] = 0;
//            $image[1]['top'] = 0;
//            $image[1]['right'] = 0;
//            $image[1]['bottom'] = 0;
            $newcells[$i]['images'] = json_encode($image);
            $newcells[$i]['remark'] = $cells[$i]['remark'];
            $newcells[$i]['userid'] = 6;
            $newcells[$i]['ip'] = request()->ip();
        }
        echo json_encode($newcells);
//        $result = Db::name('cell')->insertAll($newcells);
//        dump($result);

//        echo json_encode($cells);
//        echo $data;
//        echo input('server.REQUEST_SCHEME') . '://'.$_SERVER['HTTP_HOST'].'<br/>';
    }
}
