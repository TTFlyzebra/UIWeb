<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class Theme extends Auth {
	public function index() {
		return $this->fetch ();
	}

    public function edit()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('theme');
            $item = $db->where('themeId', $_GET['id'])->find();
        }
        if(empty($item)){
            $item = [
                'themeId' => -1,
                "themeName" => "",
                "themeType" => "",
                "screenWidth" => "",
                "screenHeight" => "",
                "left" => "",
                "top" => "",
                "right" => "",
                "bottom" => "",
                "imageurl" => "",
                "backcolor" => "",
                "isMirror" =>"",
                "animType"=>0,
                "remark"=>"",
                "topPageId"=>"",
            ];
        }
        $this->assign('item', $item);
        return $this->fetch();
    }
}
