<?php

define('IN_ECS', true);

require(dirname(__FILE__) . '/includes/init.php');
assign_template();
include_once(dirname(__FILE__)  . '/includes/lib_model.php');
$model=new Model;
$act=isset($_REQUEST['act']) ? $_REQUEST['act'] : '';
if($act==''){
    $ur_here='<li><a href="index.php">首页 &gt;</a></li><li><a href="">就医转诊服务</a></li>';
    $smarty->assign('page_title',      '就医转诊服务体系_中国领先的健康养老保险和医疗保健服务商-国康健康管理服务有限公司');    // 页面标题
    $smarty->assign('keywords',     '就医转诊服务体系,看名医体系,分诊体系,专家预约体系,专业陪诊体系,大病专案体系,档案系统');
    $smarty->assign('description',   '经过12年的就医服务经验积累，国康形成了行业最强大的，满意度最高的就医转诊体系，该体系由专业分诊体系、专家预约体系、专业陪诊体系、大病专案体系、档案系统组成，涵盖全国3万多名各学科、各病种的专家，为客户提供防误诊误治、解决看病难、快速找名医、同一专家连续性看诊等服务，实现提升就诊治疗效率的目标。');
    $smarty->assign('url_html',        $ur_here);  // 当前位置
    $smarty->display('service_treat.dwt');
}elseif($act=='health'){
    $ur_here='<li><a href="index.php">首页 &gt;</a></li><li><a href="">保健体系</a></li>';
    $smarty->assign('page_title',      '保健体系_康管家_中国领先的健康养老保险和医疗保健服务商-国康健康管理服务有限公司');    // 页面标题
	$smarty->assign('keywords',     '保健体系,国康康管家,康管家,保健办,慢性病调理,运动康复调理,亚健康管理');
    $smarty->assign('description',   '国康参照国家卫生部慢性病管理规范，建立了亚健康管理体系、慢性病管理体系和家族病管理体系等保健体系，保健团队由国康全科医生、营养师、运动师和理疗师组成，各学科保健专家定期指导服务过程，保证保健效果。保健团队从疾病防治、饮食、运动、康复理疗等方面系统为客户制定保健方案，并监督、跟踪保健方案的实施效果。通过标准规范的保健管理体系，帮助客户改善亚健康状态，防止慢性病恶化和并发症的发生，降低家族性疾病发生的几率。');
    $smarty->assign('url_html',        $ur_here);  // 当前位置
    $smarty->display('service_health.dwt');
}
elseif($act=='doctor'){
    $ur_here='<li><a href="index.php">首页 &gt;</a></li><li><a href="">私人医生会员体系</a></li>';
    $smarty->assign('page_title',      '私人医生会员体系就是家庭医生体系_让高品质的医疗健康服务更便捷_中国领先的健康养老保险和医疗保健服务商-国康健康管理服务有限公司');    // 页面标题
	    $smarty->assign('keywords',     '私人医生会员体系,中央首长保健体系,西方家庭医生制度,家族健康保障,专业陪诊体系,私人医生会员,私人定制医疗');
    $smarty->assign('description',   ' 国康私人医生会员体系是参照中央首长保健制度的最高级的医疗保健体系。为每一个保健对象都配备了专职的专业保健团队，长期、系统维护保健对象的身心健康，对中央首长群体保持身心健康起了重要作用。有效解决企业家（家庭）医疗保健面临的问题，让企业家保持身心健康，高效地投入到企业经营管理之中，同时也解决企业家家人及其高管团队的健康问题，实现企业家“基业长青、健康长寿”的梦想。
		');
    $smarty->assign('url_html',        $ur_here);  // 当前位置
    $smarty->display('service_vip.dwt');
}
?>