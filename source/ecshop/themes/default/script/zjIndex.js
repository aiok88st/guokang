$(function(){
	//实例化轮播图
	var mySwiper = new Swiper('.swiper-container-index', {
		loop: true,
		pagination: '.swiper-pagination',
		paginationClickable :true,
		nextButton: '.swiper-button-next',
    	prevButton: '.swiper-button-prev',
		autoplayDisableOnInteraction : false,
//		autoplay:5000,
		onInit: function(swiper){
		}
	});
	//使用layui表单
	layui.use('form', function(){
		  var form = layui.form;
		  $('#part1 .partR .selectBox .layui-input').attr('placeholder','请选择您的需求');
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		    layer.msg(JSON.stringify(data.field));
		    return false;
		  });
	});
	//新闻区域切换
	$('.pfrNav a').click(function(){
		var index =parseInt($(this).attr('index'));
		switch(index){
			case 1:
				$('.pfrNav span').css('left','0px');
				$('.pfrThree1').fadeIn(500);
				$('.pfrThree2').fadeOut();
				$('.pfrThree3').fadeOut();
				break;
			case 2:
				$('.pfrNav span').css('left','140px');
				$('.pfrThree2').fadeIn(500);
				$('.pfrThree1').fadeOut();
				$('.pfrThree3').fadeOut();
				break;
			case 3:
				$('.pfrNav span').css('left','280px');
				$('.pfrThree3').fadeIn(500);
				$('.pfrThree1').fadeOut();
				$('.pfrThree2').fadeOut();
				break;
		}
	});
	var myPlayer1 = videojs('my-video1');
	videojs("my-video1").ready(function() {
		$('.my-video1' + '-dimensions').css({
			'height': '190px',
			'width': '285px'
		});
		$('.playBox1 button').click(function() {
			$(this).parent('.playBox1').hide();
			myPlayer1.play();
			myPlayer2.pause();
			myPlayer3.pause();
			myPlayer4.pause();
		});
	});
	var myPlayer2 = videojs('my-video2');
	videojs("my-video2").ready(function() {
		$('.my-video2' + '-dimensions').css({
			'height': '190px',
			'width': '285px'
		});
		$('.playBox2 button').click(function() {
			$(this).parent('.playBox2').hide();
			myPlayer1.pause();
			myPlayer2.play();
			myPlayer3.pause();
			myPlayer4.pause();
		});
	});
	var myPlayer3 = videojs('my-video3');
	videojs("my-video3").ready(function() {
		$('.my-video3' + '-dimensions').css({
			'height': '190px',
			'width': '285px'
		});
		$('.playBox3 button').click(function() {
			$(this).parent('.playBox3').hide();
			myPlayer1.pause();
			myPlayer2.pause();
			myPlayer3.play();
			myPlayer4.pause();
		});
	});
	var myPlayer4 = videojs('my-video4');
	videojs("my-video4").ready(function() {
		$('.my-video4' + '-dimensions').css({
			'height': '190px',
			'width': '285px'
		});
		$('.playBox4 button').click(function() {
			$(this).parent('.playBox4').hide();
			myPlayer1.pause();
			myPlayer2.pause();
			myPlayer3.pause();
			myPlayer4.play();
		});
	});
});
