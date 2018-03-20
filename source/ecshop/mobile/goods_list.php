<?php

/**
 * ECSHOP WAP首页
 * ============================================================================
 * * 版权所有 2005-2012 上海商派网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.ecshop.com；
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和
 * 使用；不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * $Author: testyang $
 * $Id: goods_list.php 15013 2008-10-23 09:31:42Z testyang $
*/

define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
require(ROOT_PATH . 'includes/lib_model.php');
$model=new Model;
assign_template();
$act=!empty($_GET['act'])?$_GET['act']:'';

if($act==''){
    $type = !empty($_GET['type']) ? $_GET['type'] : 'best';
    $cat_id = !empty($_GET['cat_id']) ? $_GET['cat_id'] : 0;
    $temp_type=array();
    $temp_type=array('best','promote','hot','new');

    $smarty->assign('cat_id',$cat_id);

    $cat_list=$model->table($ecs->table('category'))
        ->where('`parent_id`=0')
        ->field('cat_name,cat_id')
        ->order('sort_order asc')
        ->select();
    $smarty->assign('cat_list',$cat_list);
    $smarty->display('goods_list.html');
}else if($act=='goods_list'){

}





?>