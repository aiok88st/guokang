<?php

/**
 * ECSHOP 文章内容
 * ============================================================================
 * * 版权所有 2005-2012 上海商派网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.ecshop.com；
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和
 * 使用；不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * $Author: liubo $
 * $Id: article.php 17217 2011-01-19 06:29:08Z liubo $
 */



define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
include_once(dirname(__FILE__)  . '/includes/lib_model.php');

$model=new Model;
if ((DEBUG_MODE & 2) != 2)
{
    $smarty->caching = true;
}

/*------------------------------------------------------ */
//-- INPUT
/*------------------------------------------------------ */

$_REQUEST['id'] = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$article_id     = $_REQUEST['id'];
if(isset($_REQUEST['cat_id']) && $_REQUEST['cat_id'] < 0)
{
    $article_id = $db->getOne("SELECT article_id FROM " . $ecs->table('article') . " WHERE cat_id = '".intval($_REQUEST['cat_id'])."' ");
}

//页面模板
$tpl = $_REQUEST['tpl'] ? $_REQUEST['tpl'] : 'hd';
$catid = $_REQUEST['cat_id'] ? $_REQUEST['cat_id'] : 5;
/*------------------------------------------------------ */
//-- PROCESSOR
/*------------------------------------------------------ */

if($catid == 14){
    /* 获得当前页码 */
    $page   = !empty($_REQUEST['page'])  && intval($_REQUEST['page'])  > 0 ? intval($_REQUEST['page'])  : 1;
    /* 获得页面的缓存ID */
    $cache_id = sprintf('%X', crc32($catid . '-' . $page . '-' . $_CFG['lang']));
    if (!$smarty->is_cached($tpl.'.dwt', $cache_id))
    {
        /* 文章详情 */
        $article = get_article_info($article_id);

        //面包屑
        $smarty->assign('url_html', '<li><a href="./index.php">首页 &gt;</a></li><li><a href="./about.php?tpl='.$tpl.'&id='.$article_id.'">了解国康 &gt;</a></li><li><a href="javascript:;">'.$article['title'] .'</a></li>');
        //侧边分类导航
        $smarty->assign('cat_id', $catid);
        $sql = 'SELECT cat_id,cat_name,cat_link FROM ecs_article_cat where parent_id = 9 ORDER BY sort_order ASC';
        $smarty->assign('catList', $db->getAll($sql));


        /* 如果页面没有被缓存则重新获得页面的内容 */
        assign_template('a', array($catid));
        $position = assign_ur_here($article['cat_id'], $article['title']);
        $smarty->assign('page_title',   $position['title']);    // 页面标题
        $smarty->assign('ur_here',      $position['ur_here']);  // 当前位置

        $smarty->assign('categories',           get_categories_tree(0)); // 分类树
        $smarty->assign('article_categories',   article_categories_tree($catid)); //文章分类树
        $smarty->assign('helps',                get_shop_help());        // 网店帮助
        $smarty->assign('top_goods',            get_top10());            // 销售排行
        $smarty->assign('best_goods',           get_recommend_goods('best'));
        $smarty->assign('new_goods',            get_recommend_goods('new'));
        $smarty->assign('hot_goods',            get_recommend_goods('hot'));
        $smarty->assign('promotion_goods',      get_promote_goods());
        $smarty->assign('promotion_info', get_promotion_info());
        $smarty->assign('keywords',    htmlspecialchars($meta['keywords']));
        $smarty->assign('description', htmlspecialchars($meta['cat_desc']));

    }

    //$db->selectLimit();

    $smarty->assign('feed_url',         ($_CFG['rewrite'] == 1) ? "feed-typearticle_cat" . $catid . ".xml" : 'feed.php?type=article_cat' . $catid); // RSS URL

    $smarty->display($tpl.'.dwt', $cache_id);
}elseif($catid == 31){
    $catlist = array();
    $res=get_article_parent_cats(31);

    assign_template('a', $catlist);
    $position = assign_ur_here(31, $res[0]['cat_name']);
    $smarty->assign('page_title',  $position['title']);    // 页面标题

    assign_dynamic($tpl);
    /**我们是谁:分类ID，32**/


    $cat32=get_article_cat(32);
    $cat32_desc=explode("\r\n",$cat32['cat_desc']);
    $cat32['cat_desc']=$cat32_desc;
    $smarty->assign('cat32',$cat32);

    $sql="SELECT content FROM ".$GLOBALS['ecs']->table('article'). " WHERE `cat_id`=32 ORDER BY article_id desc";
    $cat32_info=$db->getRow($sql);
    $smarty->assign('cat32_info',$cat32_info);

    /**我们是谁 END**/

    /**国康能干啥:分类ID，33**/
    $cat33=get_article_cat(33);

    $cat33_desc=explode("\r\n",$cat33['cat_desc']);
    $cat33['cat_desc']=$cat33_desc;
    $smarty->assign('cat33',$cat33);


    /*保险：分类ID，34*/
    $article=get_article_attr(34);
    $smarty->assign('article34',$article);

    /*健康管理：分类ID，35*/
    $article=get_article_attr(35);
    $smarty->assign('article35',$article);

    /*保健理疗：分类ID，36*/


    $article=get_article_attr(36);

    $smarty->assign('article36',$article);

    $cat34=get_article_cat(34);

    $smarty->assign('cat34',$cat34);
    $cat34=get_article_cat(35);
    $smarty->assign('cat35',$cat34);
    $cat34=get_article_cat(36);
    $smarty->assign('cat36',$cat34);
    /**合作企业**/
    $bs2=$model->table($ecs->table('article'))->where('`cat_id`=45')->limit(24)->select();

    $bs2_count=count($bs2);
    $smarty->assign('bs2_count',$bs2_count);
    $smarty->assign('bs2',$bs2);
    /**合作企业end**/

    /**国康能干啥 END**/
    /**专家团队**/
    $expert=$model->table($ecs->table('expert'))->limit(10)->select();
    $smarty->assign('expert',$expert);
    /**专家团队end**/
    /**最新动态**/
    $news=$model->table($ecs->table('article'))->where("cat_id IN (6,46)")->order('title,file_url,description,add_time')->limit(3)->select();
    foreach ($news as $key=>$value){
        $news[$key]['addTime']=date('Y-m-d',$value['add_time']);
        $news[$key]['addDay']=date('d',$value['add_time']);
        $news[$key]['addMoth']=date('Y-m',$value['add_time']);
    }
    $smarty->assign('news',$news);
    /**最新动态end**/
    $smarty->display('knowZero.dwt', $cache_id);
} else{
    $cache_id = sprintf('%X', crc32($_REQUEST['id'] . '-' . $_CFG['lang']));

    if (!$smarty->is_cached($tpl.'.dwt', $cache_id))
    {
        /* 文章详情 */
        $article = get_article_info($article_id);

        if (empty($article))
        {
            ecs_header("Location: ./\n");
            exit;
        }

        if (!empty($article['link']) && $article['link'] != 'http://' && $article['link'] != 'https://')
        {
            ecs_header("location:$article[link]\n");
            exit;
        }
        if($catid == 16){
            $sql = 'SELECT article_id,title,cat_id, content, file_url, description FROM ecs_article where cat_id = 16 ORDER BY add_time DESC';
            $smarty->assign('article2', $db->getAll($sql));
        }



        $smarty->assign('article_categories',   article_categories_tree($article_id)); //文章分类树
        $smarty->assign('categories',       get_categories_tree());  // 分类树
        $smarty->assign('helps',            get_shop_help()); // 网店帮助
        $smarty->assign('top_goods',        get_top10());    // 销售排行
        $smarty->assign('best_goods',       get_recommend_goods('best'));       // 推荐商品
        $smarty->assign('new_goods',        get_recommend_goods('new'));        // 最新商品
        $smarty->assign('hot_goods',        get_recommend_goods('hot'));        // 热点文章
        $smarty->assign('promotion_goods',  get_promote_goods());    // 特价商品
        $smarty->assign('related_goods',    article_related_goods($_REQUEST['id']));  // 特价商品
        $smarty->assign('id',               $article_id);
        $smarty->assign('username',         $_SESSION['user_name']);
        $smarty->assign('email',            $_SESSION['email']);
        $smarty->assign('type',            '1');
        $smarty->assign('promotion_info', get_promotion_info());

        /* 验证码相关设置 */
        if ((intval($_CFG['captcha']) & CAPTCHA_COMMENT) && gd_version() > 0)
        {
            $smarty->assign('enabled_captcha', 1);
            $smarty->assign('rand',            mt_rand());
        }

        $smarty->assign('article',      $article);
        $smarty->assign('keywords',     htmlspecialchars($article['keywords']));
        $smarty->assign('description', htmlspecialchars($article['description']));

        $catlist = array();
        foreach(get_article_parent_cats($article['cat_id']) as $k=>$v)
        {
            $catlist[] = $v['cat_id'];
        }

        assign_template('a', $catlist);



        $position = assign_ur_here($article['cat_id'], $article['title']);
        $smarty->assign('page_title',   $position['title']);    // 页面标题
        $smarty->assign('ur_here',      $position['ur_here']);  // 当前位置
        $smarty->assign('comment_type', 1);

        //面包屑
        $smarty->assign('url_html', '<li><a href="./index.php">首页 &gt;</a></li><li><a href="./about.php?tpl='.$tpl.'&id='.$article_id.'">了解国康 &gt;</a></li><li><a href="javascript:;">'.$article['title'] .'</a></li>');
        //侧边分类导航
        $smarty->assign('cat_id', $catid);
        $sql = 'SELECT cat_id,cat_name,cat_link FROM ecs_article_cat where parent_id = 9 ORDER BY sort_order ASC';
        $smarty->assign('catList', $db->getAll($sql));


        /* 相关商品 */
        $sql = "SELECT a.goods_id, g.goods_name " .
            "FROM " . $ecs->table('goods_article') . " AS a, " . $ecs->table('goods') . " AS g " .
            "WHERE a.goods_id = g.goods_id " .
            "AND a.article_id = '$_REQUEST[id]' ";
        $smarty->assign('goods_list', $db->getAll($sql));

        /* 上一篇下一篇文章 */
        $next_article = $db->getRow("SELECT article_id, title FROM " .$ecs->table('article'). " WHERE article_id > $article_id AND cat_id=$article[cat_id] AND is_open=1 LIMIT 1");
        if (!empty($next_article))
        {
            $next_article['url'] = build_uri('article', array('aid'=>$next_article['article_id']), $next_article['title']);
            $smarty->assign('next_article', $next_article);
        }

        $prev_aid = $db->getOne("SELECT max(article_id) FROM " . $ecs->table('article') . " WHERE article_id < $article_id AND cat_id=$article[cat_id] AND is_open=1");
        if (!empty($prev_aid))
        {
            $prev_article = $db->getRow("SELECT article_id, title FROM " .$ecs->table('article'). " WHERE article_id = $prev_aid");
            $prev_article['url'] = build_uri('article', array('aid'=>$prev_article['article_id']), $prev_article['title']);
            $smarty->assign('prev_article', $prev_article);
        }

        assign_dynamic($tpl);
    }
    if(isset($article) && $article['cat_id'] > 2)
    {
        $smarty->display($tpl.'.dwt', $cache_id);
    }
    else
    {
        $smarty->display('article_pro.dwt', $cache_id);
    }
}




/*------------------------------------------------------ */
//-- PRIVATE FUNCTION
/*------------------------------------------------------ */

/**
 * 获得指定的文章的详细信息
 *
 * @access  private
 * @param   integer     $article_id
 * @return  array
 */
function get_article_info($article_id)
{
    /* 获得文章的信息 */
    $sql = "SELECT a.*, IFNULL(AVG(r.comment_rank), 0) AS comment_rank ".
        "FROM " .$GLOBALS['ecs']->table('article'). " AS a ".
        "LEFT JOIN " .$GLOBALS['ecs']->table('comment'). " AS r ON r.id_value = a.article_id AND comment_type = 1 ".
        "WHERE a.is_open = 1 AND a.article_id = '$article_id' GROUP BY a.article_id";
    $row = $GLOBALS['db']->getRow($sql);

    if ($row !== false)
    {
        $row['comment_rank'] = ceil($row['comment_rank']);                              // 用户评论级别取整
        $row['add_time']     = local_date($GLOBALS['_CFG']['date_format'], $row['add_time']); // 修正添加时间显示

        /* 作者信息如果为空，则用网站名称替换 */
        if (empty($row['author']) || $row['author'] == '_SHOPHELP')
        {
            $row['author'] = $GLOBALS['_CFG']['shop_name'];
        }
    }

    return $row;
}
/*获取分类属性*/
function get_article_cat($cat_id){

    $sql="SELECT * FROM ".$GLOBALS['ecs']->table('article_cat') .' WHERE `cat_id`='.$cat_id;
    $row=$GLOBALS['db']->getRow($sql);
    return $row;
}

/*
 * 根据分类获取文章，和查询文章拓展属性
 * @cat_id:分类ID
 * @limit:文章条数
 * @attr_limit：属性条数
 * */
function get_article_attr($cat_id,$limit=2,$attr_limit=3){
    $sql="SELECT * FROM ".$GLOBALS['ecs']->table('article'). " WHERE `cat_id`=".$cat_id." ORDER BY article_id asc limit ".$limit;
    $article=$GLOBALS['db']->getAll($sql);
    foreach ($article as $key => $value){
        $sql="SELECT * FROM ".$GLOBALS['ecs']->table('article_attr'). " WHERE `article_id`=".$value['article_id']." ORDER BY article_id asc limit ".$attr_limit;
        $attr=$GLOBALS['db']->getAll($sql);
        $article[$key]['attr']=$attr;
    }
    return $article;
}
/**
 * 获得文章关联的商品
 *
 * @access  public
 * @param   integer $id
 * @return  array
 */
function article_related_goods($id)
{
    $sql = 'SELECT g.goods_id, g.goods_name, g.goods_thumb, g.goods_img, g.shop_price AS org_price, ' .
        "IFNULL(mp.user_price, g.shop_price * '$_SESSION[discount]') AS shop_price, ".
        'g.market_price, g.promote_price, g.promote_start_date, g.promote_end_date ' .
        'FROM ' . $GLOBALS['ecs']->table('goods_article') . ' ga ' .
        'LEFT JOIN ' . $GLOBALS['ecs']->table('goods') . ' AS g ON g.goods_id = ga.goods_id ' .
        "LEFT JOIN " . $GLOBALS['ecs']->table('member_price') . " AS mp ".
        "ON mp.goods_id = g.goods_id AND mp.user_rank = '$_SESSION[user_rank]' ".
        "WHERE ga.article_id = '$id' AND g.is_on_sale = 1 AND g.is_alone_sale = 1 AND g.is_delete = 0";
    $res = $GLOBALS['db']->query($sql);

    $arr = array();
    while ($row = $GLOBALS['db']->fetchRow($res))
    {
        $arr[$row['goods_id']]['goods_id']      = $row['goods_id'];
        $arr[$row['goods_id']]['goods_name']    = $row['goods_name'];
        $arr[$row['goods_id']]['short_name']   = $GLOBALS['_CFG']['goods_name_length'] > 0 ?
            sub_str($row['goods_name'], $GLOBALS['_CFG']['goods_name_length']) : $row['goods_name'];
        $arr[$row['goods_id']]['goods_thumb']   = get_image_path($row['goods_id'], $row['goods_thumb'], true);
        $arr[$row['goods_id']]['goods_img']     = get_image_path($row['goods_id'], $row['goods_img']);
        $arr[$row['goods_id']]['market_price']  = price_format($row['market_price']);
        $arr[$row['goods_id']]['shop_price']    = price_format($row['shop_price']);
        $arr[$row['goods_id']]['url']           = build_uri('goods', array('gid' => $row['goods_id']), $row['goods_name']);

        if ($row['promote_price'] > 0)
        {
            $arr[$row['goods_id']]['promote_price'] = bargain_price($row['promote_price'], $row['promote_start_date'], $row['promote_end_date']);
            $arr[$row['goods_id']]['formated_promote_price'] = price_format($arr[$row['goods_id']]['promote_price']);
        }
        else
        {
            $arr[$row['goods_id']]['promote_price'] = 0;
        }
    }

    return $arr;
}


?>