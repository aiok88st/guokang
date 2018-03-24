<?php

define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
assign_template();
include_once(dirname(__FILE__)  . '/includes/lib_model.php');
$model=new Model;
$act=isset($_REQUEST['act']) ? $_REQUEST['act'] : '';
if($act==''){
    $ur_here='<li><a href="index.php">首页 &gt;</a></li><li><a href="">就医转诊服务</a></li>';
    $smarty->assign('page_title',      '国康健康管家企业版,健康管理界的滴滴企业版,为企业健康管理提供全方位解决方案_成就健康幸福团队_国康企业版_国康私人医生企业版_企业健康福利平台-国康健康管理服务有限公司');    // 页面标题
    $smarty->assign('keywords',     '国康企业版,滴滴企业版,国康健康管家企业版,健康幸福团队,国康私人医生企业版,企业健康福利平台');
    $smarty->assign('description',   '国康健康管家企业版是健康管理界的滴滴企业版,为企业健康管理提供全方位解决方案,成就健康幸福团队_国康企业版_国康私人医生企业版_企业健康福利平台-国康健康管理服务有限公司');
    $smarty->assign('url_html',        $ur_here);  // 当前位置
    $smarty->display('es.dwt');
	
}
?>