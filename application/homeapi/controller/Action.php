<?php

namespace app\homeapi\controller;


class Action
{
    public function index()
    {
        echo json_encode(getSendAction());
    }

}
