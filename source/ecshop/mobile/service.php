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
    $cat_id = !empty($_GET['cat_id']) ? $_GET['cat_id'] : '';

    $cat=$model->table($ecs->table('article_cat'))
        ->where('`cat_id`='.$cat_id)
        ->field('cat_name,keywords,cat_desc,cat_thumb')
        ->find();
    if(!empty($cat['cat_thumb'])){
        $smarty->assign('banner',$cat['cat_thumb']);
    }
    if(!empty($cat['keywords'])){
        $smarty->assign('page_title',     htmlspecialchars($cat['keywords']));    // 页面标题
        $smarty->assign('keywords',     htmlspecialchars($cat['keywords']));
        $smarty->assign('description',     htmlspecialchars($cat['cat_desc']));
    }
    $smarty->assign('cat_id',$cat_id);
    $smarty->display('article.html');
}
?>