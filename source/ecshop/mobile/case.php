<?php

define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
$act = !empty($_GET['act']) ? $_GET['act'] : '';


require(ROOT_PATH . 'includes/lib_model.php');
$model=new Model;
assign_template();

$position = assign_ur_here();
$smarty->assign('page_title',      $position['title']);    // 页面标题
$smarty->assign('ur_here',         $position['ur_here']);  // 当前位置
$smarty->assign('act',$act);
if($act==''){

    $cat=$ecs->table('article_cat');
    $cat=$model->table($cat)->where('`cat_id`=41')->field('cat_name,keywords,cat_desc')->find();

    if(!empty($cat['keywords'])){
        $smarty->assign('page_title',     htmlspecialchars($cat['keywords']));    // 页面标题
        $smarty->assign('keywords',     htmlspecialchars($cat['keywords']));
        $smarty->assign('description',     htmlspecialchars($cat['cat_desc']));
    }
    if(!empty($cat['cat_desc'])){
        $smarty->assign('cat_desc', htmlspecialchars($cat['cat_desc']));
    }
    $table=$ecs->table('article');
    //解决方案
    $case_list=$model->table($table)->where('`cat_id`=42')->field('article_id,title,file_url_wap')->order('article_id asc')->paginate(2,'case.php');

    $smarty->assign('case_list',$case_list['lists']);
    $smarty->display('case.html');
}else if($act=='company'){

    $table=$ecs->table('article');

    $cat=$ecs->table('article_cat');
    $cat=$model->table($cat)->where('`cat_id`=45')->field('cat_name,keywords,cat_desc')->find();

    if(!empty($cat['keywords'])){
        $smarty->assign('page_title',     htmlspecialchars($cat['keywords']));    // 页面标题
        $smarty->assign('keywords',     htmlspecialchars($cat['keywords']));
        $smarty->assign('description',     htmlspecialchars($cat['cat_desc']));
    }else{

        $smarty->assign('page_title',      '合作的企业_国康典型客户_中国500强企业的选择_腾讯美的的私人医生服务商_中国领先的健康保险和医疗保健服务商');    // 页面标题

    }
    $smarty->assign('url_html',        $ur_here);  // 当前位置
    //65

    $smarty->display('company.html');
}
?>