$(function(){
	//实例化轮播图
	var mySwiper = new Swiper('.swiper-container-index', {
		loop: true,
		pagination: '.swiper-pagination',
		paginationClickable :true,
		nextButton: '.swiper-button-next',
    	prevButton: '.swiper-button-prev',
		autoplayDisableOnInteraction : true,
		autoplay:5000,
		onInit: function(swiper){
		}
	});
	//使用layui表单

	layui.use(['form','layer'], function(){
		  var form = layui.form;
		  var layer=layui.layer;
		  $('#part1 .partR .selectBox .layui-input').attr('placeholder','请选择您的需求');
		  //监听提交
		  form.on('submit(policy)', function(data){
		  	  var postData=data.field;
		  	  $.ajax({
		  	  	  url:'message.php?act=policy',
				  type:'POST',
				  dataType:'JSON',
				  data:postData,
                  success:function (res) {
                      if(res.code==0){
                          layer.msg(res.msg);
                      }else{
                          massges('知道了','提交成功',res.msg)
                      }
                  }
			  });
              return false;
		  });
	});
	//新闻区域切换
	$('.pfrNav li').click(function(){
		var index =parseInt($(this).children('a').attr('index'));
		var offset=140;
		var this_index=$(this).index();
		var left=this_index*offset;
		$('.newList').eq(this_index).show().siblings().hide();

        $('.pfrNav span').css('left',left+'px');

	});

	// var myPlayer2 = videojs('my-video2');
	// videojs("my-video2").ready(function() {
	// 	$('.my-video2' + '-dimensions').css({
	// 		'height': '190px',
	// 		'width': '285px'
	// 	});
	// 	$('.playBox2 button').click(function() {
	// 		$(this).parent('.playBox2').hide();
	// 		myPlayer1.pause();
	// 		myPlayer2.play();
	// 		myPlayer3.pause();
	// 		myPlayer4.pause();
	// 	});
	// });
	// var myPlayer3 = videojs('my-video3');
	// videojs("my-video3").ready(function() {
	// 	$('.my-video3' + '-dimensions').css({
	// 		'height': '190px',
	// 		'width': '285px'
	// 	});
	// 	$('.playBox3 button').click(function() {
	// 		$(this).parent('.playBox3').hide();
	// 		myPlayer1.pause();
	// 		myPlayer2.pause();
	// 		myPlayer3.play();
	// 		myPlayer4.pause();
	// 	});
	// });
	// var myPlayer4 = videojs('my-video4');
	// videojs("my-video4").ready(function() {
	// 	$('.my-video4' + '-dimensions').css({
	// 		'height': '190px',
	// 		'width': '285px'
	// 	});
	// 	$('.playBox4 button').click(function() {
	// 		$(this).parent('.playBox4').hide();
	// 		myPlayer1.pause();
	// 		myPlayer2.pause();
	// 		myPlayer3.pause();
	// 		myPlayer4.play();
	// 	});
	// });
});
