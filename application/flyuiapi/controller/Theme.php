<?php

namespace app\flyuiapi\controller;

use think\Db;
use think\Exception;

class Theme extends BaseRestful
{
    public function index()
    {
        try {
            if (request()->isGet()) {
                if(request()->has('type','get')){
                    $type = $_GET['type'];
                    switch ($type){
                        case 'Launcher':
                        case 'launcher':
                            $celltypes = Db::name("theme")
                                ->where('themeName','like','Launcher%')
                                ->where('status', 1)
                                ->order('themeName','asc')
                                ->select();
                            break;
                        default:
                            $celltypes = Db::name("theme")
                                ->where('themeName','like',$type.'%')
                                ->where('status', 1)->select();
                            break;
                    }
                    echo json_encode($celltypes);
                }else {
                    $db = Db::name("theme");
                    if (request()->has('limit', 'get') && request()->has('offset', 'get')) {
                        $db->limit($_GET['offset'], $_GET['limit']);
                    }
                    $celltypes = $db->where('status', 1)->select();
                    for ($i = 0; $i < sizeof($celltypes); $i++) {
                        $pagedatas = Db::name('themepage')
                            ->where('a.themeId', $celltypes[$i]['themeId'])
                            ->alias('a')
                            ->join("fly_page b", "a.pageId=b.pageId")
                            ->field('a.pageId,b.pageName')
                            ->select();
                        $str = '';
                        foreach ($pagedatas as $v) {
                            $str .= $v['pageName'] . '[' . $v['pageId'] . '];';//拼接起来
                        }
                        $celltypes[$i]['themePages'] = $str;
                        unset($themePages);
                    }

                    if (request()->isAjax()) {
                        $resultdata['total'] = $db->where('status', 1)->count();
                        $resultdata['rows'] = $celltypes;
                        echo json_encode($resultdata);
                    } else {
                        echo json_encode($celltypes);
                    }
                }
            } else {
                $this->handle('theme');
            }
        } catch (Exception $e) {
            echo retJsonMsg("exception", -1, $e);
        }
    }

}
