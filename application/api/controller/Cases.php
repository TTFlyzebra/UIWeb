<?php

namespace app\api\controller;

class Cases extends BaseRestful
{
    public function index()
    {
        $this->handle('cases','createtime desc');
    }

}
