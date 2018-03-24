$(function(){
	//选择地址
	$('.addressBox').on('click',function(){
		$(this).addClass('sbChoice');
		$(this).siblings('.addressBox').removeClass('sbChoice');
	});
	//删除
	$('.delete').on('click',function(){
		$(this).parents('.addressBox').remove();
		if($('.addressList').children('.addressBox')==0)
		{
			
		}
	});
});
