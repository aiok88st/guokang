$(function(){
	//获得验证码
	var timeCount;
	$('.get').on('click',function(){
		$('.get').attr('disabled','disabled');
		$('.get').prev('input').attr('value',"qiuzijia");
		$('.get').prev('input').focusin();
		timeCount = 60;
		var self = $(this);
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
	//开眼
	$('.eye1').on('click',function(){
		$(this).hide();
		$(this).next('.eye2').show();
		$(this).prevAll('input').attr('type',"text");
	});
	//闭眼
	$('.eye2').on('click',function(){
		$(this).hide();
		$(this).prev('.eye1').show();
		$(this).prevAll('input').attr('type',"password");
	});
	//正则表达式
	var regeEmail = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
	var regePhone = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;
	//第一步
	$('.stepBtn1').on('click',function(){
		var act = $('.accountInput').val();
		if(regeEmail.test(act)){
			$('.step1').hide();
			$('.step2').show();
			$('.formContent2').text('验证码已发送至邮箱 '+act);
		}else if(regePhone.test(act)){
			$('.step1').hide();
			$('.step2').show();
			$('.formContent2').text('验证码已发送至手机 '+act);
		}else if(act==""){
			alert("空");
		}else{
			alert(4);
		}
	});
	//第二步
	$('.stepBtn2').on('click',function(){
		$('.step2').hide();
		$('.step3').show();
	});
	//完后
	$('.finish').on('click',function(){
		window.location.href = "shopIndex.html";
	});
});
