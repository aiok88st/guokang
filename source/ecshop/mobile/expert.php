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
    //查询核心团队分类
    $cat_list=$model->table($ecs->table('nav'))
        ->where("`parent_id`=4 and ifshow=1")
        ->field('name,id,wap_url')
        ->order('vieworder asc')
        ->select();


    $smarty->assign('cat_list',$cat_list);
    $cat_id=isset($_GET['cat_id'])?intval($_GET['cat_id']):$cat_list[0]['id'];
    if(!$cat_id){
        $Loaction = 'mobile/';
        header('location:'.$Loaction);
    }

    $table=$ecs->table('expert_cat');
    $cat=$model->table($table)->where('`id`='.$cat_id)->field('cat_name,attr_id')->find();

    if(!empty($cat['keywords'])){
        $smarty->assign('page_title',     htmlspecialchars($cat['keywords']));    // 页面标题
        $smarty->assign('keywords',     htmlspecialchars($cat['keywords']));
        $smarty->assign('description',     htmlspecialchars($cat['cat_desc']));
    }
    $eid=isset($_GET['eid'])?intval($_GET['eid']):0;
    $smarty->assign('eid',$eid);
    $smarty->assign('cat_id',$cat_id);
    $smarty->display('expert.html');

}else if($act=='lists'){
    $cat_id=isset($_GET['cat_id'])?intval($_GET['cat_id']):0;
    $table=$ecs->table('expert');

    $pager=$model->table($table)
        ->where("`cat_id`=".$cat_id)
        ->field('`cat_id`,`name`,`position`,`thumb`,`unit`,`job`,`room`,`desc`,`attr_id`,id')
        ->order('list_order asc,id desc')
        ->paginate2('3','expert.php');


    foreach ($pager['lists'] as $key=>$value){
        $attr_id=explode(',',$value['attr_id']);
        $pager['lists'][$key]['id']=intval($value['id']);
        $pager['lists'][$key]['name']= mb_substr($value['name'],0,14,'utf-8');
        $pager['lists'][$key]['attr']=$attr_id[0];
    }
    $res=[
        'pages'=>$pager['page_count'],
        'list'=>$pager['lists'],
    ];
    echo json_encode($res);

}else if($act=='desc'){
    $id=isset($_GET['id'])?intval($_GET['id']):0;
    if(!$id){
        $Loaction = 'mobile/';
        header('location:'.$Loaction);
    }
    $table=$ecs->table('expert');
    $data=$model->table($table)
        ->where('`id`='.$id)
        ->find();


    $smarty->assign('page_title',     htmlspecialchars($data['name']));    // 页面标题
    $smarty->assign('keywords',     htmlspecialchars($data['name']));
    if(!empty($data['desc'])){
        $smarty->assign('description',     htmlspecialchars($data['desc']));
    }

    $data['content']=rts_elipmoc($data['content']);

    $attr_id=explode(',',$data['attr_id']);
    $data['attr']=$attr_id[0];
    $smarty->assign('data',$data);

    //上一篇，下一篇

    $prev=$model->table($ecs->table('expert'))
        ->where("`cat_id`=".$data['cat_id'].' AND `list_order` < '.$data['list_order'].'')
        ->field('id,name,job')
        ->order('list_order asc,id desc')
        ->find();

    $next=$model->table($ecs->table('expert'))
        ->where("`cat_id`=".$data['cat_id'].' AND `list_order` > '.$data['list_order'].'')
        ->field('id,name,job')
        ->order('list_order asc,id desc')
        ->find();
    if($prev){
        $smarty->assign('prev_article',[
            'title'=>$prev['name'].'&nbsp;'.$prev['job'],
            'url'=>'mobile/expert.php?act=desc&id='.intval($prev['id'])
        ]);
    }
    if($next){
        $smarty->assign('next_article',[
            'title'=>$next['name'].'&nbsp;'.$next['job'],
            'url'=>'mobile/expert.php?act=desc&id='.intval($next['id'])
        ]);
    }

    $smarty->display('expert_desc.html');
}

?>