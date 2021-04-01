<?php

namespace app\homeapi\controller;

class Product extends BaseRestful
{
    public function index()
    {
        $this->handle('product', 'productSort asc');
    }

}
