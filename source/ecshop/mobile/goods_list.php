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

$act=!empty($_GET['act'])?$_GET['act']:'';

if($act==''){

    $position = assign_ur_here();

    $smarty->assign('page_title',      $position['title']);    // 页面标题
    $smarty->assign('ur_here',         $position['ur_here']);  // 当前位置

    $type = !empty($_GET['type']) ? $_GET['type'] : 'best';
    $cat_id = !empty($_GET['cat_id']) ? $_GET['cat_id'] : 0;

    assign_template('c', array($cat_id));

    $cat = get_cat_info($cat_id);   // 获得分类的相关信息

    if (!empty($cat))
    {
        if(!empty($cat['keywords'])){
            $smarty->assign('keywords',    htmlspecialchars($cat['keywords']));
            $smarty->assign('page_title',    htmlspecialchars($cat['keywords']));
        }
        if(!empty($cat['description'])){
            $smarty->assign('description', htmlspecialchars($cat['description']));
        }
        $smarty->assign('cat_style',   htmlspecialchars($cat['style']));
    }

    $temp_type=array();
    $temp_type=array('best','promote','hot','new');

    $smarty->assign('cat_id',$cat_id);

    $cat_list=$model->table($ecs->table('category'))
        ->where('`parent_id`=0 and `is_show`=1')
        ->field('cat_name3,cat_id,thumb')
        ->limit(5)
        ->order('sort_order asc')
        ->select();
    foreach ($cat_list as $key=>$v){
        $cat_list[$key]['thumb']='../'.$v['thumb'];
    }

    $smarty->assign('cat_id',$cat_id);
    $smarty->assign('cat_list',$cat_list);
    $smarty->display('goods_list.html');
}else if($act=='goods_list') {
    $page = isset($_REQUEST['page'])   && intval($_REQUEST['page'])  > 0 ? intval($_REQUEST['page'])  : 1;
    $cat_id = !empty($_GET['cat_id']) ? intval($_GET['cat_id']) : 0;
    if($cat_id==0){
        $cat="IN ('')";
    }else{
        $cat_list=$model->table($ecs->table('category'))
            ->where("`cat_id`=".$cat_id .' or `parent_id`='.$cat_id)
            ->field('cat_id')
            ->select();
        $data=[];
        foreach ($cat_list as $key=>$value){
            $data[$key]=$value['cat_id'];
        }
        $cat_ids=implode(',',$data);
        $cat="IN (".$cat_ids.")";

    }
    $size=5;

    $count  = $db->getOne("SELECT COUNT(*) FROM " . $ecs->table('goods') . " WHERE  is_on_sale = 1 AND cat_id ".$cat);
    $pager = get_pager('category', array('id'=>2,'cid'=>$cid), $count, $page,$size);
    $sqls = 'SELECT is_real,shop_price,tag_id,goods_id, cat_id, goods_name, market_price, member_price, vip_price, goods_img, goods_brief' .
        ' FROM ' .$GLOBALS['ecs']->table('goods') .
        ' WHERE is_on_sale = 1 AND cat_id ' . $cat .
        ' ORDER BY sort_order ASC, add_time DESC'.
        ' limit '.$pager[start] . ',' .$pager[size];

    $data = $db->getAll($sqls);
    foreach($data as $k=>$v){
        if(!empty($v['tag_id'])){
            $sql='SELECT * FROM `ecs_goods_tag` WHERE id IN ('.$v['tag_id'].')';
            $data[$k]['attr_value'] = $db->getAll($sql);
        }

    }
    if(empty($data)){
        $data = '';
    }
    foreach ($data as $key=>$value){
        $data[$key]['goods_img']='../'.$value['goods_img'];
    }
    $res=[
        'pages'=>$pager['page_count'],
        'list'=>$data
    ];
    echo json_encode($res);
}

/**
 * 获得分类的信息
 *
 * @param   integer $cat_id
 *
 * @return  void
 */
function get_cat_info($cat_id)
{
    return $GLOBALS['db']->getRow('SELECT cat_name,description, keywords, cat_desc, style, grade, filter_attr, parent_id FROM ' . $GLOBALS['ecs']->table('category') .
        " WHERE cat_id = '$cat_id'");
}
?>