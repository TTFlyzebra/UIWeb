<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Product
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delproduct = $request->only('productId');
            $result = Db::name("product")->where('productId', $delproduct['productId'])->delete();
        } elseif ($request->isPut()) {
            $product = $request->put();
            $product['ip'] = request()->ip();
            $result = Db::name("product")->update($product);
        } elseif ($request->isPost()) {
            $product = $request->post();;
            $product['ip'] = request()->ip();
            $result = Db::name("product")->insert($product);
        } elseif ($request->isGet()) {
            $db = Db::name("product");
            $db->order('productSort asc');
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $products = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $products;
                echo json_encode($resultdata);
            } else {
                echo json_encode($products);
            }
        }
    }

}
