<?php

namespace app\admin\controller;

use think\Controller;

class Table extends Controller {
	public function index() {
		return $this->fetch ();
	}
}
