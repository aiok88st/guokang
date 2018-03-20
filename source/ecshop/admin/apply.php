<?php
define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
require_once(ROOT_PATH . '/' . ADMIN_PATH . '/includes/lib_goods.php');
include_once(ROOT_PATH . '/includes/lib_model.php');
include_once(ROOT_PATH . '/includes/lib_main.php');

$model=new Model;
$act=isset($_REQUEST['act'])?$_REQUEST['act']:"list";
admin_priv('apply');

$smarty->assign('full_page',1);

if($act==""){
    $smarty->assign('action_link2',[
        'text'=>'导出表单',
        'href'=>'apply.php?act=export'
    ]);
    $pam=[];
    $where='';

    $pager=$model->table($ecs->table('apply'))
        ->where($where)
        ->order('id desc')->paginate(20,'apply.php',$pam);

    $lists=$pager['lists'];
    foreach ($lists as $key=>$value){
        $lists[$key]['add_time']=date('Y-m-d H:i:s',$value['add_time']);

    }

    $smarty->assign('pager',$pager);
    $smarty->assign('record_count',$pager['record_count']);
    $smarty->assign('page_count',$pager['page_count']);

    $policy_type=$model->table($ecs->table('policy_type'))->where('`id`=1')->find();
    $policy_type=explode("\n",$policy_type['value']);

    foreach ($policy_type as $key=>$value){
        $policy_type[$key]=trim($value);
    }
    $smarty->assign('policy_type',$policy_type);

    $smarty->assign('filter',$pager);
    $smarty->assign('lists',$lists);

    $smarty->display('apply_list.htm');
}elseif($act=="export"){
    $policy_type=$model->table($ecs->table('policy_type'))->where('`id`=1')->find();
    $policy_type=explode("\n",$policy_type['value']);

    foreach ($policy_type as $key=>$value){
        $policy_type[$key]=trim($value);
    }
    $smarty->assign('policy_type',$policy_type);
    $smarty->assign('action_link',[
        'text'=>'返回列表',
        'href'=>'policy.php'
    ]);
    $smarty->display('apply_export.htm');

}elseif($act=="export_do"){
    $where=array();

    $start_time=isset($_POST['start_time'])?strtotime(trim($_POST['start_time'])):'';
    $end_time=isset($_POST['end_time'])?strtotime(trim($_POST['end_time'])):'';

    if($start_time){
        array_push($where,"`add_time` >={$start_time}");
    }
    if($end_time){
        array_push($where,"`add_time` <={$end_time}");
    }
    $where=implode(' AND ',$where);
    $list=$model->table($ecs->table('apply'))->where($where)->select();
    $data=strpri('姓名').','.strpri('电话').','.strpri('单位').','.strpri('职位').','.strpri('提交时间')."\r\n";

    foreach ($list as $key=>$value){
        $add_time=date('Y-m-d H:i:s',$value['add_time']);
        $data .=strpri($value['username']).',';
        $data .=strpri($value['mobile']).',';
        $data .=strpri($value['company']).',';
        $data .=strpri($value['position']).',';
        $data .=strpri($add_time)."\r\n";
    }

    $file_name="list-".date('Y-m-d').'.csv';
    header("Content-type: text/html; charset=gb312");
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename=' . $file_name);
    header('Cache-Control: max-age=0');
    echo $data;

}

function strpri($str){ //字符串替换
    $str=str_replace(',','，',$str);
    $str=str_replace("\r\n",'',$str);
    $str=str_replace("\r",'',$str);
    $str=str_replace("\n",'',$str);
    $str=str_replace("\"",'',$str);
//    $str=mb_convert_encoding($str,"gb312","utf-8");
    return $str;
}
?>