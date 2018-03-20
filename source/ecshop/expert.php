<?php
define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
assign_template();
include_once(dirname(__FILE__)  . '/includes/lib_model.php');
$model=new Model;
$id = isset($_REQUEST['id']) ? intval($_REQUEST['id']) : 0;
$cat_id = isset($_REQUEST['cat_id']) ? intval($_REQUEST['cat_id']) : 0;
$act=isset($_REQUEST['act']) ? $_REQUEST['act'] : '';
if($act==''){
    $cache_id = sprintf('%X', crc32('expert-'.$id . '-' . 'list'));
    if (!$smarty->is_cached('.dwt', $cache_id))
    {
        $table=$ecs->table('expert_cat');
        $cat=$model->table($table)->where('`id`='.$cat_id)->field('cat_name,attr_id')->find();
        if(!$cat){
            header('location:index.html');
        }
        $ur_here='<li><a href="index.html">首页 &gt;</a></li><li><a href="expert-'.$cat_id.'.html">'.$cat['cat_name'].'</a></li>';

        if($cat['attr_id']){
            $attr=$model->table($ecs->table('expert_attr'))
                ->where('id IN ('.$cat['attr_id'].')')
                ->order('list_order asc,id desc')
                ->select();
            foreach ($attr as $key=>$value){
                $attr[$key]['child']=explode("\n",$value['attr']);
            }
            $smarty->assign('attr',$attr);
        }

        $attr_array=[];
        $attr_str='';
        $where="`cat_id`=".$cat_id;
        if(isset($_GET['attr']) && !empty($_GET['attr'])){
            $attr=trim(addslashes($_GET['attr']),',');
            $where .=" AND `attr_id` like '%".$attr."%'";
            $attr_array=explode(',',$attr);
        }
        $param=array();
        $param['cat_id']=  $cat_id;
        if($attr){
            $param['attr']='attr'.$attr;
        }
        $pages=$model->table($ecs->table('expert'))
            ->where($where)
            ->field('`id`,`cat_id`,`name`,`position`,`unit`,`thumb`,`job`,`list_order`')
            ->order('list_order asc,id desc')
            ->paginate2(45,'expert',$param);
        //45
        $smarty->assign('pager',$pages);


        $smarty->assign('attr_value',$attr_array);
        $smarty->assign('page_title',      $cat['cat_name'].'_国康');    // 页面标题
        $smarty->assign('url_html',        $ur_here);  // 当前位置
        $smarty->assign('cat_id',$cat_id);
    }
    $smarty->display('expert.dwt', $cache_id);
}elseif($act=='details'){
     if(!$id){
         show_message('您查询的内容不存在');
         exit;
     }
     $data=$model->table($ecs->table('expert'))->where("`id`=".$id)->find();
     if(!$data){
         show_message('您查询的内容不存在');
         exit;
     }
     $smarty->assign('data',$data);

     $table=$ecs->table('expert_cat');
     $cat=$model->table($table)->where('`id`='.$data['cat_id'])->field('cat_name,attr_id')->find();
     $ur_here='<li><a href="index.html">首页 &gt;</a></li><li><a href="expert-'.$cat_id.'.html">'.$cat['cat_name'].'</a></li>';


     $prev=$model->table($ecs->table('expert'))
         ->where("`cat_id`=".$data['cat_id'].' AND (`list_order` < '.$data['list_order'].' OR `id` > '.$data['id'].')')
         ->field('id,name,job')
         ->find();
     $next=$model->table($ecs->table('expert'))
         ->where("`cat_id`=".$data['cat_id'].' AND (`list_order` > '.$data['list_order'].' OR `id` < '.$data['id'].')')
         ->field('id,name,job')
         ->find();
     if($prev){
         $smarty->assign('prev_article',[
             'title'=>$prev['name'].'&nbsp;'.$prev['job'],
             'url'=>'expert-act_details-'.intval($prev['id']).'.html',
         ]);
     }
     if($next){
        $smarty->assign('next_article',[
            'title'=>$next['name'].'&nbsp;'.$next['job'],
            'url'=>'expert-act_details-'.intval($next['id']).'.html',
        ]);
     }

     //相关专家
     $smarty->assign('cat_name','相关专家');
     $new_list=$model->table($ecs->table('expert'))->where("`cat_id`=".$data['cat_id'])->field('`name`,`id`,`job`,`desc`,`thumb`')->order('list_order asc,id desc')->limit(5)->select();
     $new_article_list=[];
     foreach ($new_list as $key=>$value){
         $new_article_list[$key]['url']        ='expert-act_details-'.intval($value['id']).'.html';
         $new_article_list[$key]['title']      =$value['name'].'&nbsp;'.$value['job'];
         $new_article_list[$key]['description']=$value['desc'];
         $new_article_list[$key]['file_url']   ='.'.$value['thumb'];
     }
     $smarty->assign('more_url','expert-'.$data['cat_id'].'.html');

     $smarty->assign('new_article_list',$new_article_list);
     $smarty->assign('content',rts_elipmoc($data['content']));
     $smarty->assign('page_title',      $data['name'].'_国康');    // 页面标题
     $smarty->assign('url_html',        $ur_here);  // 当前位置
     $smarty->assign('cat_id',$cat_id);
     $smarty->assign('data',$data);
     $smarty->assign('id',$data['id']);
     $smarty->display('expert_details.dwt');
}
?>