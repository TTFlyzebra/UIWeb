<?php

namespace app\api\controller;

use think\Controller;
use think\Db;
use think\Request;

class Cell extends Controller
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $cell['celltypeId'] =(int)$_POST['celltypeId'];
            $cell['name'] = $_POST['name'];
            $cell['width'] = (int)$_POST['width'];
            $cell['height'] = (int)$_POST['height'];
            $cell['imageurl1'] = $_POST['imageurl1'];
            $cell['imageurl2'] = $_POST['imageurl2'];
            $cell['text'] = $_POST['text'];
            $cell['textsize'] = (int)$_POST['textsize'];
            $cell['textcolor'] = $_POST['textcolor'];
            $cell['textposition'] = (int)$_POST['textposition'];
            $cell['ip'] = request()->ip();

            if($request->has('userid','post')){
                $cell['userid'] = (int)$_POST['userid'];
            }

            $db =  Db::name("cell");
            $result = $db->insert($cell);

        } elseif ($request->isGet()) {
            $db = Db::name("cell");
            $resultdata['total'] = $db->count();
            if($request->has('limit','get')&&$request->has('offset','get')){
                $db->limit($_GET['offset'],$_GET['limit']);
            }
            $cells = $db->select();
            $resultdata['rows'] = $cells;
            echo json_encode($resultdata);
        }
    }

}
