var waget=120;
$(function(){
	$('.main-bg-left a').click(function(){

		$('.main-bg-left a').removeClass('active');
		$(this).addClass('active');

	});

	/*我的订单*/
	$('.btn-myOrder').click(function(){
		$('.right-content').hide();
		$('.my-order').show();
	});
	/*未评价订单*/
	$('.btn-noEva').click(function(){
		$('.right-content').hide();
		$('.no-evaluate').show();
	});
	/*已评价订单*/
	$('.btn-alreadyEva').click(function(){
		$('.right-content').hide();
		$('.already-evaluate').show();
	});
	/*个人资料*/
	$('.btn-personalDate').click(function(){
		$('.right-content').hide();
		$('.personal-date').show();
	});
	/*收获地址*/
	$('.btn-address').click(function(){
		$('.right-content').hide();
		$('.address-bg').show();
	});
	/*账号设置*/
	$('.btn-setting').click(function(){
		$('.right-content').hide();
		$('.account-settings').show();
	});
	/*我的个人中心*/
	$('.btn-personalCenter').click(function(){
		$('.right-content').hide();
		$('.personal-center').show();
	});
	/*通知消息*/
	$('.btn-notice').click(function(){
		$('.right-content').hide();
		$('.notice').show();
	});
	/*我的奖励金*/
	$('.btn-reward').click(function(){
		$('.right-content').hide();
		$('.reward').show();
	});


	/*=============================*/
	/*新增收货地址*/
	$('.address-add').click(function(){
		$('.addess-message').show();
	});
	/*保存*/
	$('.btn-save').click(function(){
		
	});
	/*取消*/
	$('.btn-del').click(function(){
		$('.addess-message').hide();
	});


	// 马上去评价
	$('.goEva').click(function(){

		window.location.href='evaluate.html';
	});

	/*=========================*/
	/*<!-- 我的订单 -->*/
	$('.my-order-nav a').click(function(){
		$('.my-order-nav a').removeClass('active');
		$(this).addClass('active');

		var _this = $(this).index();

		$('.my-order-list-wrap .my-order-list').hide();
		$('.my-order-list-wrap .my-order-list').eq(_this).show();
	});
	/*查看待支付订单*/
	$('.btn-obligation').click(function(){
		$('.personal-center').hide();
		$('.my-order').show();
		$('.my-order-nav a').removeClass('active');
		$('.my-order-list-wrap .my-order-list').hide();
		$('.my-order-nav a').eq(1).addClass('active');
		$('.my-order-list-wrap .my-order-list').eq(1).show();
	});
	/*查看待收货订单*/
	$('.btn-receipt').click(function(){
		$('.personal-center').hide();
		$('.my-order').show();
		$('.my-order-nav a').removeClass('active');
		$('.my-order-list-wrap .my-order-list').hide();
		$('.my-order-nav a').eq(2).addClass('active');
		$('.my-order-list-wrap .my-order-list').eq(2).show();
	});
	/*查看待评价订单*/
	$('.btn-evaluate').click(function(){
		$('.personal-center').hide();
		$('.my-order').show();
		$('.my-order-nav a').removeClass('active');
		$('.my-order-list-wrap .my-order-list').hide();
		$('.my-order-nav a').eq(3).addClass('active');
		$('.my-order-list-wrap .my-order-list').eq(3).show();
	});
	/*查看已完成付订单*/
	$('.btn-complete').click(function(){
		$('.personal-center').hide();
		$('.my-order').show();
		$('.my-order-nav a').removeClass('active');
		$('.my-order-list-wrap .my-order-list').hide();
		$('.my-order-nav a').eq(4).addClass('active');
		$('.my-order-list-wrap .my-order-list').eq(4).show();
	});


	/*修改密码*/
	$('.btn-modifyPassword').click(function(){
		$('.set-password').show();
	});
	/*下一步*/
	$('.btn-modfiy-phone-step1').click(function(){
		var mobile=$('.new_mobile').val();
		var code=$('.new_captcha').val();
		if(!mobile || !validatePhone(mobile)){
			$(this).prev('.error').show().find('.error_text').text('手机号码格式错误');
			return false;
		}
		if(!code){
            $(this).prev('.error').show().find('.error_text').text('请输入验证码');
            return false;
		}

        AjaxP('user.php?act=mobile_has', {"code":code,"mobile":mobile}, function (res) {
            if(res.content=="succ"){
                $('.error').hide();
                step1();
			}else{
                $('.btn-modfiy-phone-step1').prev('.error').show().find('.error_text').text(res.content);
			}
        }, 'POST', 'JSON',false,false);


	});
	$('.btn-modfiy-phone-step2').click(function(){
        var mobile=$('.new_mobile').val();
        var code=$('.new_code').val();
        AjaxP('user.php?act=edi_mobile',{"sms_code":code,"mobile":mobile},function(res){
            if(res.content=="succ"){
                $('.modfiy-phone-step2').hide();
                $('.modfiy-phone-step3').show();
			}else{
                $('.btn-modfiy-phone-step2').prev('.error').show().find('.error_text').text(res.content);
			}
		},'POST','JSON');

	});
	$('.btn-modfiy-phone-step3').click(function(){
		$('.modfiy-phone-step3').hide();
		window.location.reload();
	});
	/*修改手机号*/
	$('.btn-modifyPhone').click(function(){
		$('.validate-step1').show();
	});
	$('.btn-validate-step1').click(function(){
        go_captcha();
	});
	$('.btn-validate-step2').click(function(){
		var old_code=$('#old_code').val();
        AjaxP('user.php?act=user_set_sms', {"sms_code":old_code}, set_mobie_1, 'POST', 'JSON');
	});
	/*绑定邮箱*/
	$('.btn-modifyMailbox').click(function(){
		$('.modfiy-mailbox-step1').show();
	});
	$('.btn-modfiy-mailbox-step1').click(function(){
		$('.modfiy-mailbox-step1').hide();
		$('.modfiy-mailbox-step2').show();
	});
	$('.btn-modfiy-mailbox-step2').click(function(){
		$('.modfiy-mailbox-step2').hide();
		$('.modfiy-mailbox-step3').show();
	});
	$('.btn-modfiy-mailbox-step3').click(function(){
		$('.modfiy-mailbox-step3').hide();
	});



	/*关闭浮层*/
	$('.close').click(function(){
		$('.bomb').hide();
	});



	/*<!-- 消息通知 -->*/
	$('.notice-nav a').click(function(){

		$('.notice-nav a').removeClass('active');
		$(this).addClass('active');

		var _this = $(this).index();
		$('.notice-wrap ul').hide();
		$('.notice-wrap ul').eq(_this).show();
	});

	/*提现*/
	$('.btn-withdrawals').click(function(){
		$('.bomb-withdrawals').show();
	});

	/*马上去绑定*/
	$('.btn-banding').click(function(){
		
	});

	/*提现*/
	$('.btn-tixian').click(function(){
		$('.bomb-withdrawals').hide();
		$('.tips-success').show();
	})

	//密码可见
	$('.eye').on('click',function(){
		var type=$(this).prev('input').attr('type');
		if(type=="password"){
            $(this).prev('input').attr("type","text");
		}else{
            $(this).prev('input').attr("type","password");
		}
	})


});
function resstart(){
	if($(this).attr("disabled")==false){
        go_captcha();
	}
}
function resstart2(){
    if($(this).attr("disabled")==false){
        step1();
    }
}
function go_captcha(){
    var captcha=$('.captcha').val();
    var filter = new Object;
    filter.code    = captcha;
    Ajax('user.php?is_ajax=1&act=ajax_validate_vcode', filter, register_vcode_result, 'GET', 'JSON');
}

function register_vcode_result(result){
    var regPhone=$('#regPhone').val();
    if(result.content =='succ'){
        $('.error').hide();
        Ajax('user.php?act=ajax_validate_sms', {"mobile":regPhone}, register_sms, 'POST', 'JSON');

    }else{
        var v=Math.random();
        $('.captchaimg').attr('src','captcha.php?v='+v);
        $('.btn-validate-step1').prev('.error').show().find('.error_text').text('您输入的验证码有误');
        $('.validate-step1').show();
        $('.validate-step2').hide();
    }
}

function register_sms(res) {
    if(res.content=="succ"){
    	$('.error').hide();
        $('.validate-step1').hide();
        $('.validate-step2').show();

        var html="重新发送(<span id='wagetTime'>120</span>)";
        $('.waget').html(html).attr('disabled','disabled').addClass("disabled");
        if(waget==120){
            var wt=setInterval(function(){
                waget--;
                if(waget<=0){
                    $('.waget').html("获取验证码").attr('disabled',false).removeClass("disabled");
                    clearInterval(wt);
                    waget=120;
                }else{
                    $('#wagetTime').text(waget);
                }
            },1000);
        }
    }else{
        $('.btn-validate-step2').prev('.error').show().find('.error_text').text(res.content);
    }
}
/*验证旧手机号码的短信验证码*/
function set_mobie_1(res){
    if(res.content=="succ"){
        waget=120;
        $('.error').hide();
        $('.validate-step2').hide();
        $('.modfiy-phone-step1').show();

	}else{
        $('.btn-validate-step2').prev('.error').show().find('.error_text').text(res.content);
	}
}
/*验证手机号码是否被使用*/
function mobile_has(fun){
	var mobile=$('.new_mobile').val();
    $('.error').hide();
    AjaxP('user.php?act=mobile_has', {"mobile":mobile}, fun, 'POST', 'JSON');
}

/*输入新手机号码时候验证的回调函数*/

function new_mobile_1(res){
    if(res.content=="succ"){
        $('.error').hide();
	}else{
    	$('.btn-modfiy-phone-step1').prev('.error').show().find('.error_text').text(res.content);
	}
}
/*修改手机号码第一步,发送短信验证码*/
function step1() {
    var mobile=$('.new_mobile').val();
    Ajax('user.php?act=ajax_validate_sms', {"mobile":mobile}, function (res2) {
        if(res2.content=="succ"){
            $('.text-primary').text(mobile);
            $('.modfiy-phone-step1').hide();
            $('.modfiy-phone-step2').show();
            var html="重新发送(<span id='wagetTime2'>120</span>)";
            $('.waget2').html(html).attr('disabled','disabled').addClass("disabled");
            if(waget==120){
                var wt=setInterval(function(){
                    waget--;
                    if(waget<=0){
                        $('.waget2').html("获取验证码").attr('disabled',false).removeClass("disabled");
                        clearInterval(wt);
                        waget=120;
                    }else{
                        $('#wagetTime2').text(waget);
                    }
                },1000);
            }
        }else{
            $('.btn-modfiy-phone-step1').prev('.error').show().find('.error_text').text(res2.content);
        }
    }, 'POST', 'JSON');
}