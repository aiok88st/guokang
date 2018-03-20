$(function(){
	//添加
	$('.add').on('click',function(){
		var index = parseInt($(this).prevAll('p').html());
		$(this).prevAll('p').html(++index);
		if(index>0)
		{
			$(this).prevAll('.reduce').removeClass('noReduce');
		}
	});
	//减少
	$('.reduce').on('click',function(){
		var index = parseInt($(this).prevAll('p').html());		
		if(index!=1)
		{
			$(this).prevAll('p').html(--index);
			if(index==1)
			{
				$(this).addClass('noReduce');
			}
		}
	});
	//选择中
	$('.shingLeft input').on('click',function(){
		if($(this).is(':checked')==true)
		{
			$(this).attr('checked','checked');
			$(this).parent('.shingLeft').addClass('slChoice');
		}else{
			$(this).removeAttr('checked');
			$(this).parent('.shingLeft').removeClass('slChoice');
		}
	});
	//删除
	$('.shingRight button').on('click',function(){
		var self = $(this);
		popw("温馨提示","是否删除该订单！",2,function(){
		 	self.parents('.shingBoxOut').remove();
		 	if($('#shingList').children('.shingBoxOut').length==0)
		 	{
		 		$('#noshing').show();
		 		$('#shingList').hide();
		 	}
		});
	});
	//全选
	$('.pay .pyLeft input').on('click',function(){
		if($(this).is(':checked')==true)
		{
			$(this).attr('checked','checked');
			$(this).parent('.pyLeft').addClass('slChoice');
			$('.shingLeft input').attr('checked','checked');
			$('.shingLeft input').parent('.shingLeft').addClass('slChoice');
		}else{
			$(this).removeAttr('checked');
			$(this).parent('.pyLeft').removeClass('slChoice');
			$('.shingLeft input').removeAttr('checked');
			$('.shingLeft input').parent('.shingLeft').removeClass('slChoice');
		}
	});
});
