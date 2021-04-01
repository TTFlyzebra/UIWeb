<?php

namespace app\flyuiapi\controller;


class Celltype extends BaseRestful
{
    public function index()
    {
        $this->handle('celltype', 'celltype desc');
    }

}
