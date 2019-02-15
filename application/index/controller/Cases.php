<?php

namespace app\index\controller;

use think\Controller;

class Cases extends Controller {
	public function index() {
		return $this->fetch ();
	}
}
