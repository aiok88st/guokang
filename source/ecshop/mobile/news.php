<?php
define('IN_ECS', true);
require(dirname(__FILE__) . '/includes/init.php');
$act = !empty($_GET['act']) ? $_GET['act'] : '';

require(ROOT_PATH . 'includes/lib_model.php');
$model=new Model;
assign_template();

$position = assign_ur_here();
$smarty->assign('page_title',      $position['title']);    // 页面标题
$smarty->assign('ur_here',         $position['ur_here']);  // 当前位置
$smarty->assign('act',$act);

if($act==''){
    //查询文章分类
    $cat_list=$model->table($ecs->table('nav'))
        ->where("`parent_id`=14 and ifshow=1")
        ->field('name,id,wap_url,id')
        ->order('vieworder asc')
        ->select();

    $nav=isset($_GET['nav'])?intval($_GET['nav']):$cat_list[0]['id'];
    $smarty->assign('nav',$nav);

    $smarty->assign('cat_list',$cat_list);
    $cat_id=isset($_GET['cat_id'])?intval($_GET['cat_id']):0;
    $smarty->assign('cat_id',$cat_id);


    $smarty->display('news.html');
}else if($act=='lists'){
    $cat_id=isset($_GET['cat_id'])?intval($_GET['cat_id']):0;
    $table=$ecs->table('article');

    $pager=$model->table($table)
        ->where("`cat_id`=".$cat_id)
        ->field('cat_id,file_url,keywords,description,new_url,link,title,article_id,add_time')
        ->order('article_type DESC, article_id DESC')
        ->paginate2('3','news.php');
    $datas=[];
    foreach ($pager['lists'] as $key=>$value){
//        $cat_name=$model->table($ecs->table('article_cat'))->where('`cat_id`='.$value['cat_id'])->value('cat_name');
        $datas[$key]=$value;
        $datas[$key]['add_time']=date('Y-m-d',$value['add_time']);
        $datas[$key]['cat_name']='国康健康';
    }
    $res=[
        'pages'=>$pager['page_count'],
        'list'=>$datas,
    ];
    echo json_encode($res);
}else if($act=='desc'){
    $id=isset($_GET['id'])?intval($_GET['id']):0;
    if(!$id){
        $Loaction = 'mobile/';
        header('location:'.$Loaction);
    }

    $table=$ecs->table('article');
    $data=$model->table($table)
        ->where('`article_id`='.$id)
        ->find();

    $smarty->assign('page_title',     htmlspecialchars($data['name']));    // 页面标题
    $smarty->assign('keywords',     htmlspecialchars($data['name']));
    if(!empty($data['desc'])){
        $smarty->assign('description',     htmlspecialchars($data['desc']));
    }

    $data['content']=rts_elipmoc($data['content']);

    $smarty->assign('data',$data);

    //上一篇，下一篇

    $prev=$model->table($ecs->table('article'))

        ->where('`cat_id`='.$data['cat_id'].' and `article_id` > '.$data['article_id'].'')
        ->field('article_id,title')
        ->order('article_type DESC, article_id DESC')
        ->find();

    $next=$model->table($ecs->table('article'))
        ->where('`cat_id`='.$data['cat_id'].' and`article_id` < '.$data['article_id'].'')
        ->field('article_id,title')
        ->order('article_type DESC, article_id DESC')
        ->find();

    if($prev){
        $smarty->assign('prev_article',[
            'title'=>$prev['title'],
            'url'=>'mobile/news.php?act=desc&id='.intval($prev['article_id'])
        ]);
    }
    if($next){
        $smarty->assign('next_article',[
            'title'=>$next['title'],
            'url'=>'mobile/news.php?act=desc&id='.intval($next['article_id'])
        ]);
    }

    $smarty->display('news_desc.html');
}
?>