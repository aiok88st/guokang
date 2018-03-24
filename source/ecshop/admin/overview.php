<?php
define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
require_once(ROOT_PATH . '/' . ADMIN_PATH . '/includes/lib_goods.php');
include_once(ROOT_PATH . '/includes/cls_image.php');

include_once(ROOT_PATH . '/includes/lib_model.php');
include_once(ROOT_PATH . '/includes/lib_main.php');
$model=new Model;
$act=isset($_REQUEST['act'])?$_REQUEST['act']:"info";

$action_link['text']="商品标签列表";

$goods_id = isset($_REQUEST['goods_id'])  ? intval($_REQUEST['goods_id']) : 0;
admin_priv('goods_manage');
$smarty->assign('goods_id',$goods_id);
/*------------------------------------------------------ */
//-- 商品列表，商品回收站
/*------------------------------------------------------ */
if($act=="info"){

    $res=$model->table($GLOBALS['ecs']->table('goods_overview'))->where('goods_id='.$goods_id)->find();

    if($res){
        $res['point']=unserialize($res['point']);

        if($res['point']){
            $point=array();
            foreach ($res['point'] as $value){
                $point[]=$value;
            }
            $res['point']=$point;
        }

        $res['get']=unserialize($res['get']);
        if($res['get']){
            $get=array();
            foreach ($res['get'] as $value){
                $get[]=$value;
            }
            $res['get']=$get;
        }

        $smarty->assign('over_id',$res['id']);
        $res['ad_content']=rts_elipmoc($res['ad_content']);
        $smarty->assign('data',$res);
    }
    $smarty->assign('hasJq',1);
    $smarty->assign('action_link',[
        'href'=>'javascript:history.go(-1);',
        'text'=>'返回商品列表'
    ]);
    $smarty->assign('form_act',"add");
    $smarty->display('goods_overview.htm');
}elseif($act=="add"){
    try{

        $data=$_POST;
        unset($data['MAX_FILE_SIZE']);
        unset($data['file']);
        unset($data['act']);

        $data=filters($data);

        foreach ($data as $key=>$value){

            if(empty($value)){

                echo json_encode([
                    'code'=>0,
                    'msg'=>'所有项都必填'
                ]);
                exit;
            }
        }

        $data['point']=serialize($data['point']);
        $data['get']=serialize($data['get']);

        if($data['over_id']){
            $id=$data['over_id'];
            unset($data['over_id']);
            $model->table($GLOBALS['ecs']->table('goods_overview'))->where("id=".$id)->update($data);
        }else{
            unset($data['over_id']);
            $model->table($GLOBALS['ecs']->table('goods_overview'))->insert($data);
        }
        echo json_encode([
            'code'=>1,
            'msg'=>'添加成功'
        ]);
        exit;
    }catch (\Exception $e){
        echo json_encode([
            'code'=>0,
            'msg'=>$e->getMessage()
        ]);
        exit;
    }
}
?>