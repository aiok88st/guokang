/* $Id : my_user.js 4865 2007-01-31 14:04:10Z paulgao $ */


$(function(){
    $('.waget').on('click',function(){
        go_captcha();
    });
    $('#loginForm').submit(function(){
        login_submit();
        return false;
    });
});
function go_captcha() { //验证验证码
        var captcha=$('#regCode').val();
        var regPhone=$('#regPhone').val();

        if(!$('#isAgree').is(':checked')){
           layer.msg('请同意国康服务协议');
           return false;
        };
       if(!validatePhone(regPhone)){
           layer.msg('请输入正确的手机号码');
           return false;
        };
        if(!captcha){
           layer.msg('请输入验证码');
           return false;
        }
        var filter = new Object;
        filter.code    = captcha;
        Ajax('user.php?is_ajax=1&act=ajax_validate_vcode', filter, register_vcode_result, 'GET', 'JSON');
    return false;
}
/*
* 验证成功
* */
var waget=120;
function register_vcode_result(result){
    var regPhone=$('#regPhone').val();
    if(result.content =='succ'){
        Ajax('user.php?act=ajax_validate_sms', {"mobile":regPhone}, register_sms, 'POST', 'JSON');
        $('.mobile').text(regPhone);
    }else{
        layer.msg('验证码错误');
    }

}
function register_sms(res) {
    if(res.content=="succ"){
        $('.step1').hide();
        $('.step2').show();
        var html="重新发送(<span id='wagetTime'>120</span>)";
        $('.waget').html(html).attr('disabled','disabled').addClass("disabled");
        if(waget==60){
            var wt=setInterval(function(){
                waget--;
                if(waget<=0){
                    $('.waget').html("重新发送").attr('disabled',false).removeClass("disabled");
                    clearInterval(wt);
                    waget=60;
                }else{
                    $('#wagetTime').text(waget);
                }
            },1000);
        }
    }else{
        layer.msg(res.content);
    }
}

/*完成注册按钮*/
function do_register(){
    var regPhone=$('#regPhone').val();
    var sms_code=$('#sms_code').val();
    var password1=$('#password1').val();
    var confirm_password=$('#confirm_password').val();
    var back_act=$('[name="back_act"]').val();
    if(!sms_code){
        layer.msg('请输入短信验证码');
        return false;
    }
    var regExp = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,15}$/;
    if(!regExp.test(password1)){
        layer.msg('请输入6-16位的密码（字母数字组合，首位需要是字母）');
        return false;
    }
    if(password1!=confirm_password){
        layer.msg('两次输入的密码不一致');
        return false;
    }
    var filter = new Object;
    filter.agreement    = 1;//协议
    filter.sms_code    = sms_code;//短信验证码
    filter.mobile_phone    = regPhone;//短信验证码
    filter.username    = regPhone;//短信验证码
    filter.password    = password1;//密码
    filter.confirm_password    = confirm_password;//密码
    filter.back_act    = back_act;//密码
    AjaxP('user.php?act=act_register', filter, register_succ, 'POST', 'JSON');
}

//注册成功回调
function register_succ(res){
    if(res.content=="succ"){
        window.location.href=res.message;
    }else{
        layer.msg(res.content);
        return false;
    }
}

//登录操作
function login_submit() {
    var username=$('#loginUser').val();
    var loginPwd=$('#loginPwd').val();
    var autoLogin=0;
    if($('#autoLogin').is(":checked")){
        autoLogin=1;
    }
    var filter = new Object;
    filter.username=username;
    filter.password=loginPwd;
    filter.remember=autoLogin;
    AjaxP('user.php?act=signin', filter, login_succ, 'POST', 'JSON');
    return false;
}
function login_succ(res) {
    if(res.error==1){
        layer.msg(res.content);
        return false;
    }else{
        window.location.href='user.php';
    }
}