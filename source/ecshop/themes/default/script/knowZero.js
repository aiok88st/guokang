$(function(){
	var bannerLeft = $('#banner img').width();
	$('#banner img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
	$('#weDo>img').css('margin-left',-($('#weDo>img').width()-$(window).width())/2+'px');
	$('#apply>img').css('margin-left',-($('#apply>img').width()-$(window).width())/2+'px');
	$(window).resize(function(){
		var bannerLeft = $('#banner img').width();
		$('#banner img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
		$('#weDo>img').css('margin-left',-($('#weDo>img').width()-$(window).width())/2+'px');
		$('#apply>img').css('margin-left',-($('#apply>img').width()-$(window).width())/2+'px');
	});
	//选择区域
	$('.wdLeft ul li a').click(function(){
		$('.aActive').css('color',$(this).css('color'));
		$('.aActive').css('background',$(this).css('background-color'));
		$('.aActive').removeClass('aActive');
		$(this).addClass('aActive');
		var index = parseInt($(this).attr('index'));
		console.log(index);
		switch(index){
			case 1:
				$('.wdRight1').show();
				$('.wdRight2').hide();
				$('.wdRight3').hide();
				break;
			case 2:
				$('.wdRight1').hide();
				$('.wdRight2').show();
				$('.wdRight3').hide();
				break;
			case 3:
				$('.wdRight1').hide();
				$('.wdRight2').hide();
				$('.wdRight3').show();
				break;
		}
	});
	var swiper = new Swiper('.swiper-container-doctor', {
        slidesPerView: 4,
        spaceBetween: 28,
        autoplayDisableOnInteraction : true,
        loop:true,
        prevButton:'.prevLeft',
		nextButton:'.nextRight',
    });
});