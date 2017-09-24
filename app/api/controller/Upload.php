<?php

namespace app\api\controller;

class Upload
{
    public function index()
    {
        $file = request()->file('image');//获取表单上传文件
        dump($file);
        $info = $file->rule('md5')//生成文件名
        ->validate(['size' => 10*1024*1024, 'ext' => 'jpg,png,gif'])//上传文件检验
        ->move(ROOT_PATH . 'public' . DS . 'uploads');//上传文件保存地址
        dump($info);
        if ($info) {
            //	成功上传后	获取上传信息
            echo url(DS.'public' . DS . 'uploads'.DS.$info->getSaveName());
        } else {
            //	上传失败获取错误信息
            echo $file->getError();
        }
    }
}