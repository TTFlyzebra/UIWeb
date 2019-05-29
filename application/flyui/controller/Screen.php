<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class Screen extends Auth
{
    public function index()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $item = Db::name('page')
                ->alias('a')
                ->where('a.pageId', $_GET['id'])
                ->where('a.status', 1)
                ->join("fly_theme b", "a.themeId=b.themeId")
                ->field(['a.pageId', 'a.pageName', 'a.themeId', 'a.imageurl', 'a.backcolor', 'a.width', 'a.height',
                    'a.remark', 'a.edittime', 'b.themeName'])
                ->find();
        } else {
            $item = [
                'pageId' => "",
                'themeId' => "",
                "pageName" => "",
                "imageurl" => "",
                "backcolor" => "",
                "width" => 1024,
                "height" => 600,
                "remark" => "",
                "edittime" => "",
                "themeName" => "NO DATE SO IS TEST"
            ];
        }
        $this->assign('item', $item);
        return $this->fetch();
    }

}
