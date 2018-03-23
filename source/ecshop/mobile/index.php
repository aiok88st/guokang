<?php

/**
 * ECSHOP mobile首页
 * ============================================================================
 * * 版权所有 2005-2012 上海商派网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.ecshop.com；
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和
 * 使用；不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * $Author: liuhui $
 * $Id: index.php 15013 2010-03-25 09:31:42Z liuhui $
*/

define('IN_ECS', true);
define('ECS_ADMIN', true);

require(dirname(__FILE__) . '/includes/init.php');

require(ROOT_PATH . 'includes/lib_model.php');
$model=new Model;
assign_template();

$position = assign_ur_here();
$smarty->assign('page_title',      $position['title']);    // 页面标题
$smarty->assign('ur_here',         $position['ur_here']);  // 当前位置


/* 热门商品 */
$hot_goods = get_recommend_goods('hot');

/*行业解决方案*/
$case_list=$model->table($ecs->table('article'))
    ->where('`cat_id`=42')
    ->order('article_id asc')
    ->field('title,file_url_wap,article_id')
    ->limit(6)
    ->select();
$smarty->assign('case_list',$case_list);
/*行业解决方案 END*/

/*国康服务 (goods)*/
$goods_list=$model->table($ecs->table('goods'))
    ->order('is_best desc')
    ->field('goods_name,goods_id,goods_thumb,goods_brief,goods_desc')
    ->limit(9)
    ->select();
foreach ($goods_list as $key=>$value){
    $goods_list[$key]['goods_desc']=mb_substr($value['goods_desc'],0,10,'utf-8');
}
$smarty->assign('last_goods',count($goods_list));
$smarty->assign('goods_list',$goods_list);

/*国康服务 end*/

/*名医团队*/
$expert_list=$model->table($ecs->table('expert'))
    ->where("`cat_id`=1")
    ->field('`id`,`cat_id`,`name`,`position`,`unit`,`thumb`,`job`,`list_order`')
    ->limit(4)
    ->order('list_order asc,id desc')
    ->select();
$smarty->assign('expert_list',$expert_list);
/*名医团队 end*/

/*标杆客户*/
$article_list=$model->table($ecs->table('article'))
    ->where("`cat_id`=45")
    ->limit(12)
    ->field('file_url,article_id,title')
    ->select();
$smarty->assign('article_list',$article_list);
/*标杆客户 end*/
/*新闻动态*/
$new_cat=$model->table($ecs->table('article_cat'))
    ->where('`parent_id`=17')
    ->order('sort_order asc')
    ->field('cat_id,cat_name')
    ->select();
$smarty->assign('new_cat',$new_cat);
$news_list=array();
foreach ($new_cat as $key=>$value){
    $news_list[$key]['cat_name']=$value['cat_name'];
    $news_list[$key]['cat_id']=$value['cat_id'];

    $news=$model->table($ecs->table('article'))
        ->where("`cat_id`=".$value['cat_id'])
        ->limit(6)
        ->field('article_id,file_url,title,add_time')
        ->select();
    $news_list[$key]['list']=$news;
    $news_list[$key]['count']=count($news);
}
$smarty->assign('news_list',$news_list);
/*新闻动态 end*/

$smarty->display("index.html");

?>
