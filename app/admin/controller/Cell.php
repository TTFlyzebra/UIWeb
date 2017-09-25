<?php

namespace app\admin\controller;

use think\Controller;

class Cell extends Controller {
	public function index() {
		return $this->fetch ();
	}
}
