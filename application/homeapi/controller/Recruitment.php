<?php

namespace app\homeapi\controller;

class Recruitment extends BaseRestful
{
    public function index()
    {
        $this->handle('recruitment');
    }

}
