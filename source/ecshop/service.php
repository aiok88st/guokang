<?php

define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
assign_template();
include_once(dirname(__FILE__)  . '/includes/lib_model.php');
$model=new Model;
$act=isset($_REQUEST['act']) ? $_REQUEST['act'] : '';
if($act==''){
    $ur_here='<li><a href="index.php">首页 &gt;</a></li><li><a href="">就医转诊服务</a></li>';
    $smarty->assign('page_title',      '就医转诊服务_国康');    // 页面标题
    $smarty->assign('url_html',        $ur_here);  // 当前位置
    $smarty->display('service_treat.dwt');
}elseif($act=='health'){
    $ur_here='<li><a href="index.php">首页 &gt;</a></li><li><a href="">保健体系</a></li>';
    $smarty->assign('page_title',      '保健体系_国康');    // 页面标题
    $smarty->assign('url_html',        $ur_here);  // 当前位置
    $smarty->display('service_health.dwt');
}
elseif($act=='doctor'){
    $ur_here='<li><a href="index.php">首页 &gt;</a></li><li><a href="">私人医生会员体系</a></li>';
    $smarty->assign('page_title',      '私人医生会员体系_国康');    // 页面标题
    $smarty->assign('url_html',        $ur_here);  // 当前位置
    $smarty->display('service_vip.dwt');
}
?>