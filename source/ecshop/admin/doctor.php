<?php

/**
 * ECSHOP 管理中心文章处理程序文件
 * ============================================================================
 * * 版权所有 2005-2012 上海商派网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.ecshop.com；
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和
 * 使用；不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * $Author: liubo $
 * $Id: doctor.php 17217 2011-01-19 06:29:08Z liubo $
 */

define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
require_once(ROOT_PATH . "includes/fckeditor/fckeditor.php");
require_once(ROOT_PATH . 'includes/cls_image.php');

include_once(ROOT_PATH . '/includes/lib_model.php');
include_once(ROOT_PATH . '/includes/lib_main.php');
$model=new Model;
$image = new cls_image($_CFG['file']);
$act=isset($_REQUEST['act'])?$_REQUEST['act']:"list";
/* 允许上传的文件类型 */
$allow_file_types = '|GIF|JPG|PNG|BMP|SWF|DOC|XLS|PPT|MID|WAV|ZIP|RAR|PDF|CHM|RM|TXT|';

admin_priv('doctor');
$smarty->assign('full_page',1);
$type=isset($_REQUEST['type'])?intval($_REQUEST['type']):1;
//团队列表
if($act=="list"){
    //获取专家分类
    $cat_list=$model->table($ecs->table('expert_cat'))->order('list_order asc,id desc')->select();
    $smarty->assign('action_link',array(
        'href'=>'doctor.php?act=expert_add',
        'text'=>'添加专家'
    ));
    $pam=[
        'act'=>'list'
    ];
    $where='';

    if(isset($_GET['cat_id']) && $_GET['cat_id']){
        $where .=' `cat_id`='.intval($_GET['cat_id']).'';
        $pam['cat_id']=intval($_GET['cat_id']);
    }
    if(isset($_GET['name']) && $_GET['name']){
        if(isset($_GET['cat_id']) && $_GET['cat_id']){
            $where .=" AND ";
        }
        $where .=" `name` like '%".trim($_GET['name'])."%'";
        $pam['name']=trim($_GET['name']);
    }
    if(!empty($where)){
        $pager=$model
            ->table($ecs->table('expert'))
            ->where($where)

            ->order('list_order asc,id desc')
            ->paginate(20,'doctor.php',$pam);
    }else{
        $pager=$model->table($ecs->table('expert'))->order('list_order asc,id desc')->paginate(20,'doctor.php',$pam);
    }

    $lists=$pager['lists'];
    foreach ($lists as $key=>$value){
        $cat_name=$model->table($ecs->table('expert_cat'))->where("`id`=".$value['cat_id'])->value('cat_name');
        $lists[$key]['cat_name']=$cat_name;
    }
    $smarty->assign('pager',$pager);
    $smarty->assign('record_count',$pager['record_count']);
    $smarty->assign('page_count',$pager['page_count']);

    $smarty->assign('filter',$pager);
    $smarty->assign('lists',$lists);

    $smarty->assign('cat_list',$cat_list);
    $smarty->display('doctor_list.htm');
}
//添加团队页面
elseif($act=="expert_add"){
    $smarty->assign('action_link',array(
        'href'=>'doctor.php?act=list',
        'text'=>'返回列表'
    ));
    create_html_editor('content');

    $id=isset($_REQUEST['id'])?intval($_REQUEST['id']):'';

    if($id){
        $data=$model->table($ecs->table('expert'))->where('`id`='.$id)->find();
        if(!$data)  sys_msg('找不到内容详情', 1, array(), false);

        create_html_editor('content',rts_elipmoc($data['content']));
        $smarty->assign('doctor',$data);

    }else{
        create_html_editor('content');
    }

    $cat_list=$model->table($ecs->table('expert_cat'))->order('list_order asc,id desc')->select();
    $smarty->assign('cat_list',$cat_list);
    $smarty->assign('act','expert_inster');

    $smarty->display('doctor_info.htm');
}
//添加团队
elseif($act=="expert_inster"){
    try{
        $info=filters($_POST);
        if(!$info['name'])  sys_msg('请填写姓名', 1, array(), false);
        if(!$info['cat_id'])  sys_msg('请选择分类', 1, array(), false);

        if($info['cat_id']!=7){
            if(!$info['position'])  sys_msg('请填写职位', 1, array(), false);
            if(!$info['unit'])  sys_msg('请填写所属单位', 1, array(), false);
        }

        //循环获取属性
        $attr=array();
        foreach ($info as $key=>$value){
            if(strpos($key,'attr')!==false){
                $attr[]=$value;
            }
        }
        $thumb='';

        if($_FILES['file']['error']==0){
            $upload_image= basename($image->upload_image($_FILES['file'],'expert'));
            $thumb= '/data/expert/'.$upload_image;
        }
        if($info['file_url']){
            $thumb=$info['file_url'];
        }

        if(isset($info['id'])){
            //先去删除旧的
            $old_thumb=$model->table($ecs->table('expert'))
                ->where("`id`=".intval($info['id']))->value('thumb');

            if($thumb && $old_thumb){
                @unlink('../'.$old_thumb);
            }
            if(empty($thumb)){
                $thumb= $old_thumb;
            }
            $model->table($ecs->table('expert'))
                ->where("`id`=".intval($info['id']))
                ->update([
                    'cat_id'=>intval($info['cat_id']),
                    'name'=>$info['name'],
                    'position'=>$info['position'],
                    'attr_id'=>implode(',',$attr),
                    'thumb'=>$thumb,
                    'unit'=>$info['unit'],
                    'content'=>$info['content'],
                    'desc'=>$info['desc'],
                    'job'=>$info['job'],
                    'list_order'=>intval($info['list_order']),
                ]);
            sys_msg('修改成功', 0, array(
                [
                    'text'=>'返回',
                    'href'=>'doctor.php?act=expert_add&id='.intval($info['id'])
                ],
                [
                    'text'=>'返回列表',
                    'href'=>'doctor.php?act=list'
                ]
            ), true);
        }else{
            $res=$model->table($ecs->table('expert'))->insert([
                'cat_id'=>intval($info['cat_id']),
                'name'=>$info['name'],
                'position'=>$info['position'],
                'attr_id'=>implode(',',$attr),
                'thumb'=>$thumb,
                'unit'=>$info['unit'],
                'content'=>$info['content'],
                'desc'=>$info['desc'],
                'job'=>$info['job'],
                'list_order'=>intval($info['list_order']),
                'add_time'=>time(),
            ]);
            sys_msg('添加成功', 0, array(
                [
                    'text'=>'继续添加',
                    'href'=>'doctor.php?act=expert_add'
                ],
                [
                    'text'=>'返回列表',
                    'href'=>'doctor.php?act=list'
                ]
            ), true);
        }

    }catch (\Exception $e){
        sys_msg($e->getMessage(), 1, array(), true);
    }

}
//删除团队
elseif($act=='remove_expert'){
    $id=isset($_GET['id'])?$_GET['id']:0;
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $table=$ecs->table('expert');

    $model->table($table)->where("`id`=".$id)->del();
    echo json_encode([
        'code'=>1
    ]);
    exit;
}
//团队类型列表
elseif($act=="cat" && $type==1){
    $table=$ecs->table('expert_attr');
    $model->table($table);
    $pager=$model->where('`type`='.$type)->order('list_order asc,id desc')->paginate(20,'doctor.php',['act'=>'cat','type'=>$type]);

    $filter=$pager;
    $lists=$pager['lists'];
    foreach ($lists as $key=>$value){
        $lists[$key]['attr']=str_replace("\n", ", ", $value['attr']);
    }

    $smarty->assign('pager',$pager);

    $smarty->assign('record_count',$pager['record_count']);
    $smarty->assign('page_count',$pager['page_count']);

    $smarty->assign('filter',$filter);
    $smarty->assign('lists',$lists);
    $smarty->assign('action_link',array(
        'href'=>'doctor.php?act=cat_add&type='.$type,
        'text'=>'添加分类'
    ));

    $smarty->display('doctorcat_list.htm');
}
//团队分类列表
elseif($type==2 && $act=="cat"){
    $table=$ecs->table('expert_cat');
    $model->table($table);

    $pager=$model->order('list_order asc,id desc')->paginate(20,'doctor.php',['act'=>'cat','type'=>$type]);
    $filter=$pager;
    $lists=$pager['lists'];
    foreach ($lists as $key=>$value){
        if($value['attr_id']){
            $attr=$model->table($ecs->table('expert_attr'))->where('`id` IN ('.$value['attr_id'].')')->field('name')->select();
            $attr_arr=array();
            foreach ($attr as $v){
                $attr_arr[]=$v['name'];
            }

            $lists[$key]['attr']=implode(',',$attr_arr);
        }
    }

    $smarty->assign('pager',$pager);

    $smarty->assign('record_count',$pager['record_count']);
    $smarty->assign('page_count',$pager['page_count']);

    $smarty->assign('filter',$filter);
    $smarty->assign('lists',$lists);
    $smarty->assign('action_link',array(
        'href'=>'doctor.php?act=cat_add&type='.$type,
        'text'=>'添加分类'
    ));
    $smarty->display('doctorcat_list2.htm');
}
//团队类型添加页面
elseif($act=='cat_add' && $type==1){
    $table=$ecs->table('expert_attr');
    $model->table($table);
    $id=isset($_REQUEST['id'])?intval($_REQUEST['id']):'';
    if($id){
        $attr=$model->where('`id`='.$id)->find();
        if(!$attr)  sys_msg('找不到内容详情', 1, array(), false);
        $smarty->assign('attr',$attr);
    }

    $smarty->assign('action_link',array(
        'href'=>'doctor.php?act=cat&type='.$type,
        'text'=>'返回列表'
    ));
    $smarty->assign('type',$type);
    $smarty->assign('type_name','类型');
    $smarty->display('doctorcat_info.htm');
}
//团队分类添加页面
elseif($act=='cat_add' && $type==2){
    $attr_list=$model->table($ecs->table('expert_attr'))->order('list_order asc,id desc')->field('id,name')->select();

    $smarty->assign('attr_list',$attr_list);

    $id=isset($_REQUEST['id'])?intval($_REQUEST['id']):'';
    if($id){
        $cat=$model->table($ecs->table('expert_cat'))->where('`id`='.$id)->find();
        if(!$cat)  sys_msg('找不到内容详情', 1, array(), true);

        $smarty->assign('cat_attr',explode(',',$cat['attr_id']));
        $smarty->assign('cat',$cat);
    }else{
        $smarty->assign('cat_attr',[]);
    }
    $smarty->assign('action_link',array(
        'href'=>'doctor.php?act=cat&type=2',
        'text'=>'返回列表'
    ));
    $smarty->assign('type',$type);
    $smarty->display('doctorcat_info2.htm');
}
//团队类型添加
elseif($act=='update'){
    try{
        $table=$ecs->table('expert_attr');
        $model->table($table);

        $info=filters($_POST);

        if(!$info['name'])sys_msg('请填写类型名称', 1, array(), true);
        //检查名称是否存在


        $info['list_order']=intval($info['list_order'])?intval($info['list_order']):50;
        unset($info['act']);
        $link=array();

        if(isset($info['id'])){
            $id=intval($info['id']);
            $c_n_c=$model->where("`name`='$info[name]'")->field('id')->find();
            if($c_n_c && $id!=$c_n_c['id'])sys_msg($info['name'].'已存在', 1, array(), true);

            unset($info['id']);
            $model->where('`id`='.$id)->update($info);
            $link[0]=array(
                array(
                    'text'=>'返回修改',
                    'href'=>'doctor.php?act=cat_add&type=1&id='.$id
                )
            );

        }else{

            $c_n_c=$model->where("`name`='$info[name]'")->count();
            if($c_n_c>=1)sys_msg($info['name'].'已存在', 1, array(), true);
            $link[0]=array(
                array(
                    'text'=>'继续添加',
                    'href'=>'doctor.php?act=cat_add&type=1'
                )
            );
            $model->insert($info);
        }
        array_push($link,[
            'text'=>'返回列表',
            'href'=>'doctor.php?act=cat&type=1'
        ]);
        sys_msg('保存成功',0);
    }catch (\Exception $e){
        sys_msg($e->getMessage(), 1, array(
            array(
                'text'=>'返回',
                'href'=>'javascript:window.history.go(-1);'
            )
        ), true);
    }
}
//团队分类添加
elseif($act=="update_cat"){
    try{
        $table=$ecs->table('expert_cat');
        $model->table($table);
        $info=filters($_POST);
        if(!$info['cat_name'])sys_msg('请填写分类名称', 1, array(), true);

        $info['list_order']=intval($info['list_order'])?intval($info['list_order']):50;
        if(!empty($info['attr_id'])){
            $info['attr_id']=implode(',',$info['attr_id']);
        }else{
            $info['attr_id']=null;
        }
        unset($info['act']);

        $link=array();

        if(isset($info['id'])){
            $id=intval($info['id']);
            //检查名称是否存在
            $c_n_c=$model->where("`cat_name`='$info[cat_name]'")->field('id')->find();

            if($c_n_c && $c_n_c['id']!=$id)sys_msg($info['cat_name'].'已存在', 1, array(), true);
            unset($info['id']);
            $model->where('`id`='.$id)->update($info);
            $link[0]=array(
                array(
                    'text'=>'返回修改',
                    'href'=>'doctor.php?act=cat_add&type=2&id='.$id
                )
            );
        }else{
            $link[0]=array(
                array(
                    'text'=>'继续添加',
                    'href'=>'doctor.php?act=cat_add&type=2'
                )
            );
            //检查名称是否存在
            $c_n_c=$model->where("`cat_name`='$info[cat_name]'")->count();
            if($c_n_c>=1)sys_msg($info['cat_name'].'已存在', 1, array(), true);
            $model->insert($info);
        }
        array_push($link,[
            'text'=>'返回列表',
            'href'=>'doctor.php?act=cat&type=2'
        ]);

        sys_msg('保存成功',0,$link,true);
    }catch (\Exception $e){
        sys_msg($e->getMessage(), 1, array(
            array(
                'text'=>'返回',
                'href'=>'javascript:window.history.go(-1);'
            )
        ), true);
    }
}

//修改团队类型名称
elseif($act=='edit_cat_name'){

    $table=$ecs->table('expert_attr');
    $model->table($table);
    $id=isset($_POST['id'])?$_POST['id']:'';
    $name=isset($_POST['val'])?$_POST['val']:'';
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $model->where('`id`='.$id)->update([
        'name'=>$name
    ]);
    echo json_encode([
        'error'=>0,
        'act'=>'article_auto',
        'content'=>$name
    ]);
    exit;
}
//修改团队分类名称
elseif($act=="edit_cat_name2"){
    $table=$ecs->table('expert_cat');
    $model->table($table);
    $id=isset($_POST['id'])?$_POST['id']:'';
    $name=isset($_POST['val'])?$_POST['val']:'';
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $model->where('`id`='.$id)->update([
        'cat_name'=>$name
    ]);
    echo json_encode([
        'error'=>0,
        'act'=>'article_auto',
        'content'=>$name
    ]);
    exit;
}
//修改团队类型排序
elseif($act=='edit_cat_list_order'){

    $table=$ecs->table('expert_attr');
    $model->table($table);
    $id=isset($_POST['id'])?$_POST['id']:'';
    $name=isset($_POST['val'])?$_POST['val']:'';
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $model->where('`id`='.$id)->update([
        'list_order'=>$name
    ]);
    echo json_encode([
        'error'=>0,
        'act'=>'article_auto',
        'content'=>$name
    ]);
    exit;
}
//修改团队分类排序
elseif($act=='edit_cat_list_order2'){
    $table=$ecs->table('expert_cat');
    $model->table($table);
    $id=isset($_POST['id'])?$_POST['id']:'';
    $name=isset($_POST['val'])?$_POST['val']:'';
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $model->where('`id`='.$id)->update([
        'list_order'=>$name
    ]);
    echo json_encode([
        'error'=>0,
        'act'=>'article_auto',
        'content'=>$name
    ]);
    exit;
}

//删除团队类型
elseif($act == "remove"){
    $id=isset($_GET['id'])?$_GET['id']:0;
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $table=$ecs->table('expert_attr');
    $model->table($table)->where("`id`=".$id)->del();
    echo json_encode([
        'code'=>1
    ]);
    exit;

}
//删除团队分类
elseif($act=="remove2"){
    $id=isset($_GET['id'])?$_GET['id']:0;
    if(!$id){
        echo json_encode([
            'code'=>0,
            'message'=>'错误'
        ]);
        exit;
    }
    $table=$ecs->table('expert_cat');
    $model->table($table)->where("`id`=".$id)->del();
    echo json_encode([
        'code'=>1
    ]);
    exit;
}
//获取分类下的属性
elseif($act=='attr_select'){
    $cat_id=isset($_GET['cat_id'])?intval($_GET['cat_id']):0;
    $id=isset($_GET['eid'])?intval($_GET['eid']):0;
    $table=$ecs->table('expert_cat');
    $table2=$ecs->table('expert_attr');
    $table3=$ecs->table('expert');

    echo attr_select($table,$table2,$table3,$cat_id,$id);
    exit;
}

function attr_select($table,$table2,$table3,$cat_id,$id){
    $model=new Model;
    if(!$cat_id){
        return 0;
    }
    $attr_id=$model->table($table)->where("`id`=".$cat_id)->value('attr_id');
    $attr=$model->table($table2)->where("`id` IN ($attr_id)")->order('list_order asc,id desc')->select();
    $attrs=[];
    if($id){
        $attr_ids=$model->table($table3)->where("`id`=".$id)->value('attr_id');

        $attrs=explode(',',$attr_ids);

    }

    $html='';
    foreach ($attr as $key=>$v){
        $html .='<tr>';
        $html .='<td class="narrow-label">'.$v['name'].'</td>';
        $attr_vale=explode("\n",$v['attr']);
        $html .='<td>';

        foreach ($attr_vale as $item){
            $html .='<label>';
            if(in_array(trim($item),$attrs)){
                $html .='<input type="radio" name="attr_'.$key.'" value="'.$item.'" checked>'.$item;
            }else{
                $html .='<input type="radio" name="attr_'.$key.'" value="'.$item.'">'.$item;
            }

            $html .='</label>';
        }
        $html .='</td>';
        $html .='</tr>';
    }
    return $html;


}
?>