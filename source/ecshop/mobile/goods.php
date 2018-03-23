<?php

/**
 * ECSHOP 商品页
 * ============================================================================
 * * 版权所有 2005-2012 上海商派网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.ecshop.com；
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和
 * 使用；不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * $Author: testyang $
 * $Id: goods.php 15013 2008-10-23 09:31:42Z testyang $
*/

define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');

$goods_id = !empty($_GET['id']) ? intval($_GET['id']) : '';
$act = !empty($_GET['act']) ? $_GET['act'] : '';

$_LANG['kilogram'] = '千克';
$_LANG['gram'] = '克';
$_LANG['home'] = '首页';
$_LANG['goods_attr'] = '';
$smarty->assign('goods_id', $goods_id);
$goods_info = get_goods_info($goods_id);
if ($goods_info === false)
{
   /* 如果没有找到任何记录则跳回到首页 */
   ecs_header("Location: ./\n");
   exit;
}
$goods_info['goods_name'] = encode_output($goods_info['goods_name']);
$goods_info['goods_brief'] = encode_output($goods_info['goods_brief']);
$goods_info['promote_price'] = encode_output($goods_info['promote_price']);
$goods_info['market_price'] = encode_output($goods_info['market_price']);
$goods_info['shop_price'] = encode_output($goods_info['shop_price']);
$goods_info['shop_price_formated'] = encode_output($goods_info['shop_price_formated']);
$goods_info['goods_number'] = encode_output($goods_info['goods_number']);


$smarty->assign('pictures',            get_goods_gallery($goods_id));

$smarty->assign('goods_info', $goods_info);

$shop_price   = $goods_info['shop_price'];

$smarty->assign('rank_prices',         get_user_rank_prices($goods_id, $shop_price));    // 会员等级价格
$smarty->assign('footer', get_footer());

/* 查看商品图片操作 */
if ($act == 'view_img')
{
    $smarty->display('goods_img.html');
    exit();
}

/* 检查是否有商品品牌 */
if (!empty($goods_info['brand_id']))
{
    $brand_name = $db->getOne("SELECT brand_name FROM " . $ecs->table('brand') . " WHERE brand_id={$goods_info['brand_id']}");
    $smarty->assign('brand_name', encode_output($brand_name));
}
/* 显示分类名称 */
$cat_array = get_parent_cats($goods_info['cat_id']);
krsort($cat_array);
$cat_str = '';
foreach ($cat_array as $key => $cat_data)
{
    $cat_array[$key]['cat_name'] = encode_output($cat_data['cat_name']);
    $cat_str .= "<a href='category.php?c_id={$cat_data['cat_id']}'>" . encode_output($cat_data['cat_name']) . "</a>-&gt;";
}

$smarty->assign('cat_array', $cat_array);


$properties = get_goods_properties($goods_id);  // 获得商品的规格和属性
$smarty->assign('specification',       $properties['spe']);  // 商品规格

assign_template();
$position = assign_ur_here();

$smarty->assign('page_title',      $position['title']);    // 页面标题
$smarty->assign('ur_here',         $position['ur_here']);  // 当前位置
$smarty->assign('keywords',           htmlspecialchars($goods_info['keywords']));
$smarty->assign('description',        htmlspecialchars($goods_info['goods_brief']));

//案例


//评论
$m = '';
if(isset($_REQUEST['m']) && $_REQUEST['m'] == 1){
    $sql = 'SELECT comment_id, comment_type, id_value, user_name, content, comment_rank, user_id, add_time' .
        ' FROM ' .$GLOBALS['ecs']->table('comment') .
        ' WHERE status = 1 AND comment_type = 0 AND parent_id=0 AND id_value =' .$goods_info['goods_id'].
        ' ORDER BY add_time DESC';
    $m = $_REQUEST['m'];
}else{
    $sql = 'SELECT comment_id, comment_type, id_value, user_name, content, comment_rank, user_id, add_time' .
        ' FROM ' .$GLOBALS['ecs']->table('comment') .
        ' WHERE status = 1 AND comment_type = 0 AND parent_id=0 AND id_value =' .$goods_info['goods_id'].
        ' ORDER BY add_time DESC limit 10';
}
$comment = $db->getAll($sql);
$sql="select count(*) num from ".$GLOBALS['ecs']->table('comment').' where status = 1 AND comment_type = 0 AND parent_id=0 AND id_value =' .$goods_info['goods_id'];
$cc=$db->getOne($sql);
$smarty->assign('cc',$cc);

$sql="select count(*) num from ".$GLOBALS['ecs']->table('comment').' where status = 1 AND comment_type = 0 AND parent_id=0 AND comment_rank>=4 AND id_value =' .$goods_info['goods_id'];
$c4=$db->getOne($sql);

$a=floor((100*$c4)/$cc);

$smarty->assign('c4',$a);

foreach($comment as $k=>$v){
    $comment[$k]['add_time'] = date($GLOBALS['_CFG']['date_format'], $v['add_time']);
    //回复
    $sql1 = 'SELECT comment_id, comment_type, id_value, user_name, content, add_time' .
        ' FROM ' .$GLOBALS['ecs']->table('comment') .
        ' WHERE  parent_id =' .$v['comment_id'].
        ' ORDER BY add_time';
    $comment[$k]['re_comment'] = $db->getAll($sql1);
    //会员
    $sql2='SELECT user_name,name, user_id, open_face FROM  ecs_users WHERE user_id = '.$v['user_id'];

    $comment[$k]['user'] = $GLOBALS['db']->getRow($sql2);
}

$smarty->assign('m',              $m);
$smarty->assign('comment',              $comment);
$smarty->display('goods.html');

/**
 * 获得指定商品的各会员等级对应的价格
 *
 * @access  public
 * @param   integer     $goods_id
 * @return  array
 */
function get_user_rank_prices($goods_id, $shop_price)
{
    $sql = "SELECT rank_id, IFNULL(mp.user_price, r.discount * $shop_price / 100) AS price, r.rank_name, r.discount " .
            'FROM ' . $GLOBALS['ecs']->table('user_rank') . ' AS r ' .
            'LEFT JOIN ' . $GLOBALS['ecs']->table('member_price') . " AS mp ".
                "ON mp.goods_id = '$goods_id' AND mp.user_rank = r.rank_id " .
            "WHERE r.show_price = 1 OR r.rank_id = '$_SESSION[user_rank]'";
    $res = $GLOBALS['db']->query($sql);

    $arr = array();
    while ($row = $GLOBALS['db']->fetchRow($res))
    {

        $arr[$row['rank_id']] = array(
                        'rank_name' => htmlspecialchars($row['rank_name']),
                        'price'     => price_format($row['price']));
    }

    return $arr;
}


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