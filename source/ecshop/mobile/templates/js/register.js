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
	//获得验证码
	var timeCount;
	$('.stepBtn1').on('click',function(){
		$('.get').attr('disabled','disabled');
		$('.get').prev('input').focusin();
		$('.formContent2').text('验证码已发送至手机 '+$('.phoneInput').val());
		$('.step1').hide();
		$('.step2').show();
		timeCount = 60;
		var self = $('.get');
		self.text("重新获取("+timeCount+")");
		var tTween = setInterval(function(){
			timeCount--;
			if(timeCount==-1)
			{
				clearInterval(tTween);
				self.text("重新获取");
				self.removeAttr('disabled');
			}else{
				self.text("重新获取("+timeCount+")");
			}
		},1000);
	});
	//返回登录
	$('.backLogin').on('click',function(){
		window.location.href = 'shopIndex.html';
	});
	//上一步
	$('.prevStep').on('click',function(){
		$('.step1').show();
		$('.step2').hide();
		$('input').val("");
	});
});
