<?php
define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
assign_template();
include_once(dirname(__FILE__)  . '/includes/lib_model.php');

$model=new Model;
$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$cat_id = isset($_REQUEST['cat_id']) ? intval($_REQUEST['cat_id']) : 0;
$act=isset($_REQUEST['act']) ? $_REQUEST['act'] : '';

if ((DEBUG_MODE & 2) != 2)
{
    $smarty->caching = true;
}
/*
 * $act:
 *     @info:承接页
 * */

if($act==''){
    $cache_id = sprintf('%X', crc32('case-'.$id . '-' . 'info'));

    if (!$smarty->is_cached('case.dwt', $cache_id))
    {
        $ur_here='<li><a href="index.html">首页 &gt;</a></li><li><a href="case.html">解决方案</a></li>';

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
        $smarty->assign('url_html',        $ur_here);  // 当前位置
        $table=$ecs->table('article');

        //我是HRD
        $hrd_list=$model->table($table)->where('`cat_id`=43')->limit(3)->select();
        $smarty->assign('hrd_list',$hrd_list);
        //解决方案
        $case_list=$model->table($table)->where('`cat_id`=42')->order('article_id asc')->limit(6)->select();
        //国康平台特色及优势
        $youshi_list=$model->table($table)->where('`cat_id`=44')->order('article_id asc')->limit(8)->select();

        $smarty->assign('case_list',$case_list);
        $smarty->assign('youshi_list',$youshi_list);
        //已合作的企业

        $bs1=$model->table($table)->where('`cat_id`=45 AND `article_type`=1')->find();
      
        if($bs1['article_id']){
            $bs1_attr=$model->table($ecs->table('article_attr'))->where('`article_id`='.$bs1['article_id'])->select();
            $smarty->assign('bs1_attr',$bs1_attr);
        }
        $bs2=$model->table($table)->where('`cat_id`=45 AND `article_type`=1')->field('title,article_id,file_url')->limit(9)->select();
        $bs2_count=count($bs2);

        $smarty->assign('bs2_count',$bs2_count);
        $smarty->assign('bs1',$bs1);

        $smarty->assign('bs2',$bs2);
    }
    $smarty->display('case.dwt', $cache_id);
}elseif($act=='company'){
    $cache_id = sprintf('%X', crc32('case-'.$id . '-' . 'company'));
    if (!$smarty->is_cached('.dwt', $cache_id))
    {
        $ur_here='<li><a href="index.html">首页 &gt;</a></li><li><a href="case.html">合作的企业</a></li>';

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
        $pages=$model->table($table)->where("`cat_id`=45")->paginate2(65,'case',['act'=>'company']);

        $smarty->assign('pager',$pages);
    }
    $smarty->display('case_company.dwt', $cache_id);
}

?>
