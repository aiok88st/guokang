$(function(){
	//判断是否勾选了复选框
	if($(".checkBox input").is(':checked')==true)
	{
		$('.checkBox').addClass('checkHas');
	}else{
		$('.checkBox').removeClass('checkHas');
	}
	//勾选事件
	$('.checkBox input').on('click',function(){
		if($(this).is(':checked')==true)
		{
			$(this).attr('checked','checked');
			$('.checkBox').addClass('checkHas');
		}else{
			$(this).removeAttr('checked');
			$('.checkBox').removeClass('checkHas');
		}
	});
});
