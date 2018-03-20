<?php
define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
require_once(ROOT_PATH . '/' . ADMIN_PATH . '/includes/lib_goods.php');
include_once(ROOT_PATH . '/includes/cls_image.php');
$image = new cls_image($_CFG['file']);
$act=isset($_REQUEST['act'])?$_REQUEST['act']:"info";
admin_priv('goods_manage');
if($act=="upload"){
    $upload_image= basename($image->upload_image($_FILES['file'],'temp'));
    if(!empty($upload_image)){     /*判断是否有新的文件上传*/
        $temp = '/data/temp/'.$upload_image;

        echo json_encode([
            "code"=>1,
            "msg"=>'上传错误',
            "data"=>[
                "src"=>$temp
            ]
        ]);
        exit;
    }else{
        echo json_encode([
            "code"=>1,
            "msg"=>'上传错误'
        ]);
        exit;
    }
}elseif($act=="del"){
    try{
        $url=isset($_REQUEST['url'])?$_REQUEST['url']:"";
        if(!$act){
            echo json_encode([
                "code"=>1,
                "msg"=>'参数错误'
            ]);
            exit;
        }
        unlink('..'.$url);
        echo json_encode([
            "code"=>0,
            "msg"=>'参数错误'
        ]);
        exit;
    }catch (\Exception $e){

    }
}
?>