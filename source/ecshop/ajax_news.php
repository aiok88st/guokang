<?php
define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');

$act=isset($_REQUEST['act'])?$_REQUEST['act']:'def';

if($act=="article"){
    include_once(ROOT_PATH.'includes/lib_model.php');

    $cat_id=isset($_REQUEST['cat_id'])?$_REQUEST['cat_id']:0;
    $pagesize=isset($_REQUEST['page_size'])?$_REQUEST['page_size']:10;
    $model = new Model;
    $res=$model->table($GLOBALS['ecs']->table('article'))
          ->where("`cat_id`=".$cat_id)
          ->field('file_url,article_id')
          ->order('article_id desc')
          ->paginate($pagesize,'ajax_news.php',['act'=>'article']);
    echo json_encode($res);
}elseif($act=="comment"){
    $id=isset($_GET['id'])?intval($_GET['id']):'';
    $type=isset($_GET['type'])?intval($_GET['type']):'';
    $page=isset($_GET['page'])?intval($_GET['page']):'';
    if(empty($id) || empty($type) || empty($page)){
        echo json_encode([
            'code'=>0,
            'mss'=>'啥都没'
        ]);
        exit;
    }
    $cmt=assign_comment($id,$type,$page);
    echo json_encode([
        'comments'=>$cmt['comments'],
        'pager'=>$cmt['pager'],
    ]);
    exit;
}

?>