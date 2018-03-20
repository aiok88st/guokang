<?php

define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');

if ((DEBUG_MODE & 2) != 2)
{
    $smarty->caching = true;
}

include_once(ROOT_PATH . '/includes/lib_model.php');
assign_template('a', $catlist);
$goods_id = isset($_REQUEST['id'])  ? intval($_REQUEST['id']) : 0;

$cache_id = $goods_id . '-over-' . $_SESSION['user_rank'].'-'.$_CFG['lang'];
$cache_id = sprintf('%X', crc32($cache_id));

if (!$smarty->is_cached('goods.dwt', $cache_id))
{
    $goods = get_goods_info($goods_id);
    if(!empty($goods['keywords'])){
        $smarty->assign('keywords',htmlspecialchars($goods['keywords']));
    }
    if(!empty($goods['goods_brief'])){
        $smarty->assign('description',htmlspecialchars($goods['goods_brief']));
    }
    $position = assign_ur_here($goods['cat_id'], $goods['goods_name']);
    $smarty->assign('goods_title',$goods['goods_name']);
    $smarty->assign('page_title',          $position['title']);                    // 页面标题
    $smarty->assign('ur_here',             $position['ur_here']);                  // 当前位置
    $smarty->assign('goods_id',$goods_id);
    $model=new Model;
    $ov=$model->table($ecs->table('goods_overview'))->where('`goods_id`='.$goods_id)->find();

    $ov['point']=unserialize($ov['point']);
    $ov['get']=unserialize($ov['get']);


    $ov['ad_content']=rts_elipmoc($ov['ad_content']);
    $smarty->assign('ov',$ov);

    $service=get_linked_articles($goods_id,40);  //服务体验

    $smarty->assign('service',$service);
}


$smarty->display('goods.dwt',      $cache_id);


/**
 * 获得指定商品的关联文章
 *
 * @access  public
 * @param   integer     $goods_id
 * @param   integer     $cat_id
 * @return  void
 */
function get_linked_articles($goods_id,$cat_id=null)
{
    $where="g.article_id = a.article_id AND g.goods_id = '$goods_id' AND a.is_open = 1 ";

    if(!empty($cat_id)){
        $where .=" AND a.cat_id=".$cat_id." ";
    }
    $sql = 'SELECT a.article_id, a.title, a.file_url, a.open_type, a.add_time ' .
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