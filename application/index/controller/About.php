<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class About extends Controller {
	public function index() {
        $this->assign('list1',Db::name('about')->select());
        $recruitments = Db::name('recruitment')->select();
        for ($i = 0; $i < sizeof($recruitments); $i++) {
            $recruitments[$i]['recruitmentText'] = preg_replace("/\r/\n", "<br/>", $recruitments[$i]['recruitmentText']);
        }
        $this->assign('list2',$recruitments);
        $this->assign('list3',Db::name('history')->select());
		return $this->fetch ();
	}
}
