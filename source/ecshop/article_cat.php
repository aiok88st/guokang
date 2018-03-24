<?php

/**
 * ECSHOP 文章分类
 * ============================================================================
 * * 版权所有 2005-2012 上海商派网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.ecshop.com；
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和
 * 使用；不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * $Author: liubo $
 * $Id: article_cat.php 17217 2011-01-19 06:29:08Z liubo $
*/


define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');

if ((DEBUG_MODE & 2) != 2)
{
    $smarty->caching = true;
}

/* 清除缓存 */
clear_cache_files();

/*------------------------------------------------------ */
//-- INPUT
/*------------------------------------------------------ */

/* 获得指定的分类ID */
if (!empty($_GET['id']))
{
    $cat_id = intval($_GET['id']);
}
elseif (!empty($_GET['category']))
{
    $cat_id = intval($_GET['category']);
}
else
{
    ecs_header("Location: ./\n");

    exit;
}

/* 获得当前页码 */
$page   = !empty($_REQUEST['page'])  && intval($_REQUEST['page'])  > 0 ? intval($_REQUEST['page'])  : 1;

/*------------------------------------------------------ */
//-- PROCESSOR
/*------------------------------------------------------ */

/* 获得页面的缓存ID */
$cache_id = sprintf('%X', crc32($cat_id . '-' . $page . '-' . $_CFG['lang']));

if (!$smarty->is_cached('news.dwt', $cache_id))
{
    //分类
    $sql = 'SELECT cat_id, cat_name, parent_id FROM  ecs_article_cat WHERE parent_id = 17 ORDER BY sort_order ASC';
    $catlist = $db->getAll($sql);
    $smarty->assign('catlist',           $catlist);
    $smarty->assign('cat_id',    $cat_id);
    //面包屑
    $cat = get_cat_info($cat_id);
    $url_html = '<li><a href="./index.html">首页 &gt;</a></li><li><a href="article_cat-6.html">新闻资讯 &gt;</a></li><li><a href="javascript:;">'.$cat['cat_name'].'</a></li>';
    $smarty->assign('url_html', $url_html);
    //最新新闻
    $new = get_new_news_article(17);
    $smarty->assign('new', $new);



    /* 如果页面没有被缓存则重新获得页面的内容 */

    assign_template('a', array($cat_id));
    $position = assign_ur_here($cat_id);
    $smarty->assign('page_title',           $position['title']);     // 页面标题
    $smarty->assign('ur_here',              $position['ur_here']);   // 当前位置

    $smarty->assign('categories',           get_categories_tree(0)); // 分类树
    $smarty->assign('article_categories',   article_categories_tree($cat_id)); //文章分类树
    $smarty->assign('helps',                get_shop_help());        // 网店帮助
    $smarty->assign('top_goods',            get_top10());            // 销售排行

    $smarty->assign('best_goods',           get_recommend_goods('best'));
    $smarty->assign('new_goods',            get_recommend_goods('new'));
    $smarty->assign('hot_goods',            get_recommend_goods('hot'));
    $smarty->assign('promotion_goods',      get_promote_goods());
    $smarty->assign('promotion_info', get_promotion_info());

    /* Meta */
    $meta = $db->getRow("SELECT keywords, cat_desc FROM " . $ecs->table('article_cat') . " WHERE cat_id = '$cat_id'");

    if ($meta === false || empty($meta))
    {
        /* 如果没有找到任何记录则返回首页 */
        ecs_header("Location: ./\n");
        exit;
    }

    $smarty->assign('keywords',    htmlspecialchars($meta['keywords']));
    $smarty->assign('description', htmlspecialchars($meta['cat_desc']));

    /* 获得文章总数 */
    $size   = 7;
    $count  = get_article_count($cat_id);
    $pager = get_pager('article_cat', array('id'=>$cat_id), $count, $page,$size);
    $smarty->assign('pager', $pager);
    $sql = 'SELECT article_id, title, author, add_time, file_url, open_type, description, cat_id' .
        ' FROM ' .$GLOBALS['ecs']->table('article') .
        ' WHERE is_open = 1 AND cat_id=' . $cat_id .
        ' ORDER BY article_type DESC, article_id DESC'.
        ' limit '.$pager[start] . ',' .$pager[size];
    $data = $db->getAll($sql);
    foreach($data as $k=>$v){
        if(mb_strlen($v['title'])>20){
            $data[$k]['title'] = mb_substr($v['title'],0,20,'utf-8').'...';
        }
        if(mb_strlen($v['description'])>100){
            $data[$k]['description'] = mb_substr($v['description'],0,100,'utf-8').'...';
        }
        $data[$k]['add_time'] = explode('-',date($GLOBALS['_CFG']['date_format'], $v['add_time']));
    }
    $smarty->assign('artciles_list',    $data);


    assign_dynamic('article_cat');
}

$smarty->assign('feed_url',         ($_CFG['rewrite'] == 1) ? "feed-typearticle_cat" . $cat_id . ".xml" : 'feed.php?type=article_cat' . $cat_id); // RSS URL

$smarty->display('news.dwt', $cache_id);


/**
 * 获得分类的信息
 *
 * @param   integer $cat_id
 *
 * @return  void
 */
function get_cat_info($cat_id)
{
    return $GLOBALS['db']->getRow('SELECT cat_id, cat_name, parent_id FROM ' . $GLOBALS['ecs']->table('article_cat') .
        " WHERE cat_id = '$cat_id'");
}

?>