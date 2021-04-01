<?php

namespace app\homeapi\controller;

class News extends BaseRestful
{
    public function index()
    {
        $this->handle('news','createtime desc');
    }

}
