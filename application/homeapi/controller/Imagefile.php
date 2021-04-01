<?php

namespace app\homeapi\controller;

class Imagefile
{
    public function index()
    {
        $file = request()->file('imagefile');//获取表单上传文件
        if ($file) {
            $info = $file->rule('md5')//生成文件名
            ->validate(['size' => 100 * 1024 * 1024, 'ext' => 'jpg,png,gif'])//上传文件检验
            ->move(ROOT_PATH . 'uploads');//上传文件保存地址
            if ($info) {
                //	成功上传后	获取上传信息
                $imgurl = DS . 'uploads' . DS . $info->getSaveName();
                $size = getimagesize("." . $imgurl);
                $result['saveName'] = input('server.REQUEST_SCHEME') . '://'.$_SERVER['HTTP_HOST'].url($imgurl);
                $result['width'] = $size[0];
                $result['height'] = $size[1];
                echo retJsonMsg("上传文件成功！", 0, $result);
            } else {
                //	上传失败获取错误信息
                echo retJsonMsg("上传文件失败!", -1, $file->getError());
            }
        } else {
            echo retJsonMsg("获取上传文件列表失败！", -1, $file);
        }
    }
}