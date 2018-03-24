<?php

define('IN_ECS', true);
require(dirname(__FILE__) . '/includes/init.php');
$act = !empty($_GET['act']) ? $_GET['act'] : '';
$cat_id = !empty($_GET['cat_id']) ? $_GET['cat_id'] : '31';
$nav_id = !empty($_GET['v_id']) ? $_GET['v_id'] : '26';

$smarty->assign('nav_id',$nav_id);
require(ROOT_PATH . 'includes/lib_model.php');

$model=new Model;
assign_template();

$position = assign_ur_here();
$smarty->assign('page_title',      $position['title'].'_国康私人医生集团');    // 页面标题
$smarty->assign('ur_here',         $position['ur_here']);  // 当前位置
$smarty->assign('act',$act);

$cat_list=$model->table($ecs->table('nav'))->where('`ifshow`=1 and `parent_id`=13')->order('vieworder asc')->select();

$smarty->assign('cat_list',$cat_list);


if($cat_id==31){
    $smarty->assign('keywords',     '私人医生,家庭医生,国康简介,关于国康,健康管理公司,私人医生服务,私人健康顾问,健康保险,养老保险');
    $smarty->assign('description',  '国康私人医生健康管理集团是中国领先的私人医生健康管理服务机构.提供私人医生,企业健康福利,亚健康管理,家庭健康顾问,健康保险,养老保险,健康管家等健康医疗服务.国康推出的私人医生诊所+三甲医院转诊的服务体系,有效的解决了客户看病难,服务差,误诊高,亚健康,缺保健等问题.');

    $table=$ecs->table('article');
    /*我们是谁*/
    $cat32=$model->table($ecs->table('article_cat'))->where("`cat_id`=32")->find();
    $cat32_desc=explode("\r\n",$cat32['cat_desc']);
    $cat32['cat_desc']=$cat32_desc;
    $smarty->assign('cat32',$cat32);


    $sql="SELECT content FROM ".$GLOBALS['ecs']->table('article'). " WHERE `cat_id`=32 ORDER BY article_id desc";
    $cat32_info=$db->getRow($sql);
    $smarty->assign('cat32_info',$cat32_info);
    /*我们是谁 end*/

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

    $smarty->display('know.html');
}else{
    $article_id     = $_REQUEST['id'];
    $data=$model->table($ecs->table('article'))
        ->where("`article_id`=".$article_id)
        ->find();
    $smarty->assign('page_title',     htmlspecialchars($data['title']));    // 页面标题
    $smarty->assign('keywords',     htmlspecialchars($data['keywords']));
    if(!empty($article_row['desc'])){
        $smarty->assign('description',     htmlspecialchars($data['desc']));
    }
    $data['title'] = encode_output($data['title']);
    $replace_tag = array('<br />' , '<br/>' , '<br>' , '</p>');
    $data['content'] = rts_elipmoc($data['content']);
    //上一篇，下一篇

    $prev=$model->table($ecs->table('nav'))
        ->where('`ifshow`=1 and `parent_id`=13 and `id`<'.$nav_id)
        ->order('vieworder desc')
        ->find();

    $next=$model->table($ecs->table('nav'))
        ->where('`ifshow`=1 and `parent_id`=13 and `id`>'.$nav_id)
        ->order('vieworder asc')
        ->find();
    if($prev){
        $smarty->assign('prev_article',[
            'title'=>$prev['name'],
            'url'=>$prev['wap_url'].'&v_id='.$prev['id']
        ]);
    }

    if($next){
        $smarty->assign('next_article',[
            'title'=>$next['name'],
            'url'=>$next['wap_url'].'&v_id='.$next['id']
        ]);
    }
    $smarty->assign('data', $data);
    $smarty->display('know_article.html');
}

?>