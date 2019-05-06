<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;

class Test extends Auth
{
    public function index()
    {
        return $this->fetch();
    }

}
