<?php

namespace app\index\controller;

use think\Controller;

class Product extends Controller {
	public function index() {
		return $this->fetch ();
	}
}
