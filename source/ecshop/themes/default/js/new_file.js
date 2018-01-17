var isMsIe6 = false;
// 针对IE6 不支持验证码显示的解决方案，显示用户提示
if($.browser.msie && $.browser.version == '6.0') {
	isMsIe6 = true;
	/*
	getFcmmValidCode = function(imgId, codeId, url, appId) {
		$("#" + imgId).attr("src", "https://member.pingan.com.cn/pinganone/pa/paic/common/vcode.do?r="+Math.random());
		$("#" + codeId).attr("name", "validCodeId");
		$("#" + codeId).attr("value", "");
	};
	$("#vcodeVer").val("");
	*/
	showErrorInfo("手机注册暂不支持IE6浏览器，请升级到IE8及以上版本", "check_info");
}
$(function() {
	// 密码框focus , blur事件
	$('#phonePassword,#phoneConfirmPassword').bind('focus', function() {
		$(this).removeClass('valid_csselfocus').removeClass('valid_csselerror');
		$(this).parent().removeClass('valid_csselerror').addClass('valid_csselfocus');
	}).bind('blur', function() {
		$(this).removeClass('valid_csselfocus').removeClass('valid_csselerror');
		$(this).parent().removeClass('valid_csselerror').removeClass('valid_csselfocus');
	});

	// 填充手机号
	var mobileNo = GetRequest("mobile");
	mobileNo && $("#mobileNo").val(mobileNo);

	// 直通会员安全问题
	inityjmdnffkds("register1DIV", "pc");

	$.getJSON('/customer/getEvercookie.do', function(res) {
		if(res.resultCode == 'Y') {
			$('#ecus').val(res.evercookie);
		}
	});

});

// 直通会员安全问题
function mobileNocheckData() {
	document.getElementById("checkData").value = yjmdnffkdsout();
}

//获取url参数
function GetRequest(param_name) {
	var url = location.search; //获取url中"?"符后的字串
	var theRequest = '';
	if(url == '') {
		return '';
	}
	if(url.indexOf("?") != -1) {
		var str = url.substr(1);
		strs = str.split("&");
		for(var i = 0; i < strs.length; i++) {
			if(strs[i].split("=")[0] == param_name) {
				theRequest = strs[i].split("=")[1];
			}
		}
	}
	return theRequest;
}
// 重写showErrorInfo方法，在执行显示操作之前，将上面的提示信息清空
function showErrorInfo(str, id) {
	// 清空上面的提示信息
	$('#check_info').empty().html('&nbsp;');
	var _div = "<div class='pa_ui_valid_tip pa_ui_validator_onerror'>" + str + "</div>";
	// 如果为手机验证码则修改显示样式
	if(id == 'activeTip') {
		_div = "<div style='color:#666;margin-left:130px;line-height:25px;'>" + str + "</div>";
	}
	$('#' + id).html(_div).show();
}
// 更新错误信息
function updateErrorInfo() {
	var validElList = $('table .pa_ui_validator_onerror:not("#activeTip .pa_ui_validator_onerror")');
	if(validElList.length > 0) {
		$('#check_info').html(validElList.eq(0).parent().html());
		$('#activeTip').empty();
	} else {
		$('#check_info').empty().html('&nbsp;');
	}
}

function endValidCallback(elem, result) {
	// 处理密码框出错样式
	if(elem.id == 'phonePassword' || elem.id == 'phoneConfirmPassword') {
		if(!result) {
			$(elem).parent().removeClass('valid_csselfocus').addClass('valid_csselerror');
		} else {
			$(elem).parent().removeClass('valid_csselfocus').removeClass('valid_csselerror');
		}
	}

	if(!result) {
		$(elem).validator('showMessage')
	}
	// 更新错误信息
	updateErrorInfo();
	// 手机号检测是否已注册
	if(result && elem.id == 'mobileNo') {
		$.getJSON('https://member.pingan.com.cn/pinganone/pa/validateMobileNoForFcmm.view?checkMobileLogin=1&mobileNo=' + $(elem).val() + '&callback=?', function(res) {
			// 如果手机号已被注册，则提示用户
			if(res.status == 'success' && res.data.errorCode == '0') {
				showErrorInfo(res.data.errorMessage, "check_info");
			}
		});
	}
	return result;
}
//提交按钮
function submitForm() {
	var isValid = $('#register_form').validator({
		triggerOnSubmit: false
	}).validator('check');
	// 更新错误信息
	updateErrorInfo();
	if(isValid) {
		//检查同意条款框有没有打勾
		var remember = $("#phoneRemember");
		if(!remember.attr("checked")) {
			showErrorInfo("请看过并同意服务条款并在前面的选择框打勾。", "check_info");
			return;
		}
		//验证图片验证码
		$.getJSON('https://member.pingan.com.cn/pinganone/pa/checkValidCode.do?validCode=' + $("#phoneValidCode").val() + '&validCodeId=' + $("#phoneValidCodeId").val() + '&callback=?', function(data) {
			if(data.status == 'fail' && !isMsIe6) {
				showErrorInfo(data.msg, "check_info");
				getFcmmValidCode('phoneValidateImg', 'phoneValidCodeId', 'https://member.pingan.com.cn/pinganone/pa/paic/common/urlvcode.do');
				return;
			}
			//验证手机动态码
			var urlss = 'https://member.pingan.com.cn/pinganone/pa/validateShortMessageForOut.do?mobileNo=' + $("#mobileNo").val() + '&activeNo=' + $("#activeNo").val() + '&validTime=' + $("#validTime").val() + '&callBack=?';

			$.ajax({
				type: "GET",
				contentType: "application/x-www-form-urlencoded;charset=UTF-8",
				url: urlss,
				dataType: 'jsonp',
				success: function(data) {
					if(data.status == 'fail') {
						showErrorInfo(data.data.errorMessage, "check_info");
						return;
					}
					//密码加密
					var PublicKey = 'BDAD3EB2F9681EAF6FBE41A073531AE4619DB772AB44451C2D46140F746B3B20271D46DAF6F00D699582E9D41BADE4A14C80AEE4A5DEA85B0255369E9E107B6B4F74A18CCDB4EFD490773C3B752C5555F463CB378B89F42AF51D8AE48F9CE607ACC47229CCC62C4F7606DED2B087CBAF0A1626B01EF08D3C2B05092C71BB6C75';
					var pwd = $("#phonePassword").val();
					var RSA = new RSAKey();
					RSA.setPublic(PublicKey, "10001");
					var Res = RSA.encrypt(pwd);
					$("#loginPwd").val(Res);
					PublicKey = 'B92CC7D38872CFE8B0EAABBCA86D0315DC803B3E70FA99CC8FA5035002527FC18118E4003B9B12E29864F3BBBA98DF6F42D4DEC7FB2757E36CDABC39A55FCBF3B3AAFB2503EBF33762F3D86AF8839179D5543FDF7816FC3538FAAAFE5A75A281A112734BF4D89271299EF63850D2099654DC4C45069964A951F76389A93AB0CF352D2B360E2ADB9FC291E0B625C2B2D0DE008DE5DA3BAB852A67642A2D0C9530E512D46D335C3E48876AFCB77A06E151D284964F6755C94EF1EE3CDB97D6421BF5C04718F17BFCCA81769D6FBFDC9A037CECCAF2CD008038DA4255346A9FE6607D197ADC8649C85B00F51F0A960E343E67215975A8167ACB235EEF1567D46789';
					pwd = $("#phonePassword").val();
					RSA = new RSAKey();
					RSA.setPublic(PublicKey, "10001");
					//Res = RSA.encrypt(pwd);
					Res = RSA.encryptPama(pwd);
					$("#loginPwdBank").val(Res);
					$("#phonePassword").val('');
					$("#phoneConfirmPassword").val('');

					try {
						//防攻击1
						//var registerData = Security.registerValue('PA18RUM',$("#mobileNo").val(),'',returnCitySN["cip"]);
						$('#kjSafeKey').val(Security.getDeviceAllInfo());
					} catch(err) {

					} finally {
						//发送签名串给后台
						$.ajax({
							type: "GET",
							async: false,
							cache: false,
							url: "./param-sign.ajax",
							data: {},
							success: function(data) {
								var signData = eval("(" + data + ")");
								$('#signature').val(signData.sign);
								//获取后台返回的时间戳
								$('#timestamp').val(signData.timestamp);
								$('#appId').val(signData.appID);
								$('#regResource').val(signData.appID);
								encryptFnForUsage(function() {
									//提交表单
									mobileNocheckData();
									$("#register_form").attr("method", "post");
									$("#register_form").attr("action", "https://member.pingan.com.cn/pinganone/pa/publicRegister.do");
									$("#register_form").submit();
								});
							}
						});
					}

				}
			});

		});
	}
	return false;
}
//发送手机动态码
function sendActiveNo() {
	if('' == $("#mobileNo").val()) {
		showErrorInfo('请输入您的手机号码再点击发送。', "check_info");
		return;
	} else if('' == $("#phoneValidCode").val()) {
		showErrorInfo('请输入验证码再点击发送。', "check_info");
	} else {
		$.getJSON('https://member.pingan.com.cn/pinganone/pa/sendShortMessageForOut.do?mobileNo=' + $("#mobileNo").val() + '&needVcode=1' + '&validCode=' + $("#phoneValidCode").val() + '&validCodeId=' + $("#phoneValidCodeId").val() + '&vcodeVer=' + $("#vcodeVer").val() + '&validTime=' + $("#validTime").val() + '&callBack=?', function(data) {
			if(data.status == 'fail') {
				showErrorInfo(data.data.errorMessage, "check_info");
				getFcmmValidCode('phoneValidateImg', 'phoneValidCodeId', 'https://member.pingan.com.cn/pinganone/pa/paic/common/urlvcode.do')
				var validTime = Number($("#validTime").val());
				$("#validTime").val(1 + validTime);
			} else {
				$("#sendShortMessageCode").val(data.sendShortMessageCode);
				timedown('init');
			}
		});
	}
}

//手机动态码按钮倒数计时
var _time = 60,
	tipSpeedTime = 120,
	tipTimer = null;

function timedown(arg1) {
	if(arg1 == 'init') {
		clearInterval(tipTimer);
		showErrorInfo("手机动态码已发送到手机" + $("#mobileNo").val() + "，请于" + tipSpeedTime + "秒内输入", "activeTip");
		tipTimer = setTimeout(function() {
			showErrorInfo("手机动态码已过期，请点击重新发送获取。", "activeTip");
		}, 119000);
	}

	$("#get_mobile_code_btn").attr("style", "text-decoration:none;");
	$("#get_mobile_code_btn").attr("href", "javascript:sendActiveNo();");
	var t = $("#get_mobile_code_btn");
	if(_time == 0) {
		t.text("重新发送动态码");
		_time = 60;
	} else {
		$("#get_mobile_code_btn").attr("style", "text-decoration:none;background:#fbb03b;cursor:default;");
		$("#get_mobile_code_btn").attr("href", "#");
		t.text("" + _time + "秒后再次获取");
		_time--;
		setTimeout(function() {
			timedown(t)
		}, 1000);
	}
}
//同意条款打勾之后消除提示
function phoneCheck() {
	var phoneRemember = $("#phoneRemember");
	if(phoneRemember.attr("checked")) {
		$("#phoneRemTip").text("");
	}
	// 更新错误信息
	updateErrorInfo();
}

function switchPwd() {
	var passwordeye = $('#passwordeye');
	var showPwd = $("#password");
	passwordeye.off('click').on('click', function() {
		if(passwordeye.hasClass('invisible')) {
			passwordeye.removeClass('invisible').addClass('visible'); //密码可见
			showPwd.prop('type', 'text');
		} else {
			passwordeye.removeClass('visible').addClass('invisible'); //密码不可见
			showPwd.prop('type', 'password');
		};
	});
}