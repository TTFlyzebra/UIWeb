<?php

namespace app\api\controller;

class Imagefile
{
    public function index()
    {
        $file = request()->file('upfileimg');//获取表单上传文件
        $info = $file->rule('md5')//生成文件名
        ->validate(['size' => 100 * 1024 * 1024, 'ext' => 'jpg,png,gif'])//上传文件检验
        ->move(ROOT_PATH . 'public' . DS . 'uploads');//上传文件保存地址
        if ($info) {
            //	成功上传后	获取上传信息
            $imgurl = DS . 'public' . DS . 'uploads' . DS . $info->getSaveName();
            $size = getimagesize("." . $imgurl);
            $result['saveName'] = url($imgurl);
            $result['width'] = $size[0];
            $result['height'] = $size[1];
            echo json_encode($result);
        } else {
            //	上传失败获取错误信息
            echo $file->getError();
        }
    }
}