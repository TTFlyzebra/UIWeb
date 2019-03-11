<?php

namespace app\api\controller;

class Recruitment extends BaseRestful
{
    public function index()
    {
        $this->handle('recruitment');
    }

}
