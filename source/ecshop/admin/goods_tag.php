<?php
define('IN_ECS', true);
require(dirname(__FILE__) . '/includes/init.php');
include_once(ROOT_PATH . '/includes/lib_model.php');
include_once(ROOT_PATH . '/includes/lib_main.php');
$model=new Model;
$act=isset($_REQUEST['act'])?$_REQUEST['act']:"list";
$table=$GLOBALS['ecs']->table('goods_tag');
admin_priv('goods_tag');
if($act=="list"){
    $tag_list=get_tag_list();

    $smarty->assign('tag_list',$tag_list['arr']);
    $smarty->assign('filter',          $tag_list['filter']);
    $smarty->assign('record_count',    $tag_list['record_count']);
    $smarty->assign('page_count',      $tag_list['page_count']);

    $smarty->assign('full_page',1);

    $smarty->display('goods_tag.htm');
}elseif($act=="add"){
    try{
        $data = str_replace('\\','',$_REQUEST['JSON']);
        $data = json_decode($data,1);
        $data=filters($data);

        if(empty($data['name'])){
            echo json_encode([
                'code'=>0,
                'msg'=>'请填写标签名称'
            ]);
            exit;
        }
        $res=$model->table($table)->where("name='".$data['title']."'")->find();
        if($res){
            echo json_encode([
                'code'=>0,
                'msg'=>'标签已存在，请不要重复添加'
            ]);
            exit;
        }
        unset($data['act']);
        $data['sort_order']=0;
        $model->table($table)->insert($data);
        admin_log($name, 'add', 'goods_tag');
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
}elseif($act=='edit_name'){
    $id=isset($_POST['id'])?$_POST['id']:'';
    $name=isset($_POST['val'])?$_POST['val']:'';
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $model->table($table)->where("`id`=".$id)->update([
        'name'=>$name
    ]);
    clear_cache_files();

    admin_log($name, 'edit', 'goods_tag');
    echo json_encode([
        'error'=>0,
        'act'=>'article_auto',
        'content'=>$name
    ]);
    exit;
}elseif($act == "remove"){
    $id=isset($_GET['id'])?$_GET['id']:0;
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $model->table($table)->where("`id`=".$id)->del();
    echo json_encode([
        'code'=>1
    ]);
    exit;

}elseif($act=="remove_all"){
    $data = str_replace('\\','',$_REQUEST['JSON']);
    $data = json_decode($data,1);
    $data=filters($data);

}

/* 获得标签列表 */
function get_tag_list()
{
    $result = get_filter();
    if ($result === false)
    {
        /* 文章总数 */

        $sql='SELECT COUNT(*) FROM '.$GLOBALS['ecs']->table('goods_tag');

        $filter['record_count'] = $GLOBALS['db']->getOne($sql);

        $filter = page_and_size($filter);

        /* 获取文章数据 */
        $sql = 'SELECT * FROM ' .$GLOBALS['ecs']->table('goods_tag').' ORDER by id desc,sort_order ASC';

        set_filter($filter, $sql);
    }
    else
    {
        $sql    = $result['sql'];
        $filter = $result['filter'];
    }

    $arr = array();
    $res = $GLOBALS['db']->selectLimit($sql, $filter['page_size'], $filter['start']);

    while ($rows = $GLOBALS['db']->fetchRow($res))
    {
        $arr[] = $rows;
    }
    return array('arr' => $arr, 'filter' => $filter, 'page_count' => $filter['page_count'], 'record_count' => $filter['record_count']);
}
?>