<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class About extends Controller {
	public function index() {
        $this->assign('list1',Db::name('about')->where('status', 1)->select());
        $recruitments = Db::name('recruitment')->where('status', 1)->select();
        for ($i = 0; $i < sizeof($recruitments); $i++) {
            $recruitments[$i]['recruitmentText'] = preg_replace("/\r/\n", "<br/>", $recruitments[$i]['recruitmentText']);
        }
        $this->assign('list2',$recruitments);
        $this->assign('list3',Db::name('history')->where('status', 1)->select());
		return $this->fetch ();
	}
}
