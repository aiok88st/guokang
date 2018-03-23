<?php
define('IN_ECS', true);
require(dirname(__FILE__) . '/includes/init.php');
require(ROOT_PATH . 'includes/lib_model.php');
$model=new Model;
$act=!empty($_GET['act'])?$_GET['act']:'';
if($act=="goods_article"){
    $goods_id=!empty($_GET['goods_id'])?$_GET['goods_id']:'';
    $cat_id=!empty($_GET['cat_id'])?$_GET['cat_id']:30;

    $list=$model->table($ecs->table('goods_article'))
        ->where("`goods_id`=".$goods_id)
        ->paginate(5,'goods.php');

    $data=[];

    foreach ($list['lists'] as $key=>$value){
        $article=$model->table($ecs->table('article'))
            ->where("`article_id`=".$value['article_id'])
            ->field('article_id,title,file_url,add_time')
            ->find();
        $article['add_time']=date('Y-m-d',$article['add_time']);
        if(mb_strlen($article['title'])>24){
            $article['title']=mb_substr($article['title'],0,25,'utf-8').'...';
        }

        $data[$key]=$article;
    }

    $res=[
        'pages'=>$list['page_count'],
        'list'=>$data,
    ];
    echo json_encode($res);
}else if($act=='article'){
    $table=$ecs->table('article');
    //文章列表
    $cat_id=isset($_GET['cat_id'])?intval($_GET['cat_id']):0;

    $pager=$model->table($table)
        ->where('`cat_id`='.$cat_id)
        ->field('article_id,title,file_url_wap,file_url,add_time,description')
        ->order('article_id asc')
        ->paginate(2,'case.php');

    $res=[
        'pages'=>$pager['page_count'],
        'list'=>$pager['lists'],
    ];
    echo json_encode($res);
}


function get_linked_articles($goods_id,$cat_id=null)
{
    $where="g.article_id = a.article_id AND g.goods_id = '$goods_id' AND a.is_open = 1 ";

    if(!empty($cat_id)){
        $where .=" AND a.cat_id=".$cat_id." ";
    }
    $sql = 'SELECT a.article_id,a.description,a.content, a.title, a.file_url, a.open_type, a.add_time ' .
        'FROM ' . $GLOBALS['ecs']->table('goods_article') . ' AS g, ' .
        $GLOBALS['ecs']->table('article') . ' AS a ' .
        "WHERE $where" .
        'ORDER BY a.add_time DESC';
    $res = $GLOBALS['db']->query($sql);

    $arr = array();
    while ($row = $GLOBALS['db']->fetchRow($res))
    {
        $row['url']         = $row['open_type'] != 1 ?
            build_uri('article', array('aid'=>$row['article_id']), $row['title']) : trim($row['file_url']);
        $row['add_time']    = local_date($GLOBALS['_CFG']['date_format'], $row['add_time']);
        $row['short_title'] = $GLOBALS['_CFG']['article_title_length'] > 0 ?
            sub_str($row['title'], $GLOBALS['_CFG']['article_title_length']) : $row['title'];

        $arr[] = $row;
    }

    return $arr;
}

?>