<?php

namespace app\index\controller;

use think\Controller;

class Uiscreen extends Controller {
	public function index() {
		return $this->fetch ();
	}
}
