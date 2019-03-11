<?php

namespace app\api\controller;

class News extends BaseRestful
{
    public function index()
    {
        $this->handle('news','createtime desc');
    }

}
