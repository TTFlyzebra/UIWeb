<?php

namespace app\api\controller;

use think\Request;

class Cell extends BaseRestful
{
    public function index()
    {
        $tableName = 'cell';
        $order = 'edittime desc';
        $joins = [
            [
                "fly_celltype b",
                "a.celltypeId=b.celltypeId",
                'INNER'
            ]
        ];
        $field = ['a.cellId','a.width','a.height','a.imageurl1','a.imageurl2','a.textTitle','a.textSize','a.textColor',
            'a.textAlign','a.textFont','a.textLeft','a.textTop','a.textRight','a.textBottom','a.packName','a.className',
            'a.intentFlag','a.action','a.flyAction','a.status','a.remark','a.extend','a.edittime','b.celltypeName'];
        $request = Request::instance();
        if ($request->isPost()&&$request->has('sub')) {
            $subs = $request->param('sub');
        }else if($request->isPut()&&$request->has('sub')){

        }else{
            $this->handle($tableName,$order,$joins,$field);
        }
    }

}
