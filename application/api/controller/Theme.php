<?php

namespace app\api\controller;

use think\Db;
use think\Request;
use think\Session;

class Theme
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $deltheme = $request->only('themeId');
            $result = Db::name("theme")->where('themeId', $deltheme['themeId'])->delete();
        } elseif ($request->isPut()) {
            $theme = $request->put();
            $theme['ip'] = request()->ip();
            $theme['userid'] = Session::get('userid');
            $db = Db::name("theme");
            $result = $db->update($theme);
        } elseif ($request->isPost()) {
            $theme = $request->post();
            $theme['isMirror']=(int)$theme['isMirror'];
            $theme['ip'] = request()->ip();
            $theme['userid'] = Session::get('userid');
            $db = Db::name("theme");
            $result = $db->insert($theme);
        } elseif ($request->isGet()) {
            $db = Db::name("theme");
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $celltypes = $db->select();
            for ($i = 0; $i < sizeof($celltypes); $i++) {
                $pagedatas = Db::name('themepage')
                    ->where('themeId', $celltypes[$i]['themeId'])
                    ->alias('a')
                    ->join("fly_page b", "a.pageId=b.pageId")
                    ->field('a.pageId,b.pageName')
                    ->select();
                $str = '';
                foreach($pagedatas as $v){
                    $str .= $v['pageName'].'['.$v['pageId'].'];';//拼接起来
                }
                $celltypes[$i]['themePages'] = $str;
                unset($themePages);
            }

            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $celltypes;
                echo json_encode($resultdata);
            } else {
                echo json_encode($celltypes);
            }
        }
    }

}
