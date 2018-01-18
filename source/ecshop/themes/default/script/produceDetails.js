$(function(){
	$('section').width($(window).width());
	$('section').height($(window).height());
	$('.section1').css('margin-left',-($('.section1').children('img').width()-$(window).width())/2+'px');
	$('.section4').css('margin-left',-($('.section4').children('img').width()-$(window).width())/2+'px');
	$('.scBox1').css('margin-top',-$('.scBox1').height()/2+'px');
	$('#server .serverTitle p').css({'line-height':$('#server .serverTitle').height()/2+'px','padding-top':$('#server .serverTitle').height()/2+'px'});
	$('#server .serverTitle1 p').css({'line-height':$('#server .serverTitle1').height()+'px','padding-top':0+'px'});
	$(window).resize(function(){
		$('section').width($(window).width());
		$('section').height($(window).height());
		$('.section1').css('margin-left',-($('.section1').children('img').width()-$(window).width())/2+'px');
		$('.section4').css('margin-left',-($('.section4').children('img').width()-$(window).width())/2+'px');
		$('.scBox1').css('margin-top',-$('.scBox1').height()/2+'px');
		$('#server .serverTitle p').css({'line-height':$('#server .serverTitle').height()/2+'px','padding-top':$('#server .serverTitle').height()/2+'px'});
		$('#server .serverTitle1 p').css({'line-height':$('#server .serverTitle1').height()+'px','padding-top':0+'px'});
	});
	var tLength = $('.swiperBtnTop').children('a').length;
	console.log(tLength);
	//实例化轮播图
	var mySwiperTop = new Swiper('.swiper-container-top', {
		loop: true,
		nextButton: '.swiper-button-next-top',
    	prevButton: '.swiper-button-prev-top',
		autoplayDisableOnInteraction : true,
//		autoplay:5000,
		onInit: function(swiper){
			
		},
		onSlideChangeEnd:function(swiper){
			var sindex = swiper.activeIndex!=0?swiper.activeIndex%tLength-1:tLength-1;
			$('.swiperBtnTop').children('a').eq(sindex).find('img').attr('src','image/swiperBtnActive.png');
			$('.swiperBtnTop').children('a').eq(sindex).siblings('a').find('img').attr('src','image/swiperBtn.png');
		}
	});
	$('.swiperBtnTop').children('a').click(function(){
		var index = $(this).index();
		mySwiperTop.slideTo(index+1);
	});
	var tLength = $('.swiperBtnBottom').children('a').length;
	var mySwiperBottom = new Swiper('.swiper-container-bottom', {
		loop: true,
		nextButton: '.swiper-button-next-bottom',
    	prevButton: '.swiper-button-prev-bottom',
		autoplayDisableOnInteraction : true,
//		autoplay:5000,
		onInit: function(swiper){
		},
		onSlideChangeEnd:function(swiper){
			var sindex = swiper.activeIndex!=0?swiper.activeIndex%tLength-1:tLength-1;
			$('.swiperBtnBottom').children('a').eq(sindex).find('img').attr('src','image/swiperBtnActive.png');
			$('.swiperBtnBottom').children('a').eq(sindex).siblings('a').find('img').attr('src','image/swiperBtn.png');
		}
	});
	$('.swiperBtnBottom').children('a').click(function(){
		var index = $(this).index();
		mySwiperBottom.slideTo(index+1);
	});
	var bodyNav = 121;
	$(window).scroll(function(){
		var h = $(window).height();
		if($(this).scrollTop()>=121+h*0.5&&$(this).scrollTop()<121+h*1.5){
			$('#pageCircle ul li').eq(1).addClass('liActive');
			$('#pageCircle ul li').eq(1).siblings('li').removeClass('liActive');
		}else if($(this).scrollTop()>=121+h*1.5&&$(this).scrollTop()<121+h*2.5){
			$('#pageCircle ul li').eq(2).addClass('liActive');
			$('#pageCircle ul li').eq(2).siblings('li').removeClass('liActive');
		}else if($(this).scrollTop()>=121+h*2.5&&$(this).scrollTop()<121+h*3.5){
			$('#pageCircle ul li').eq(3).addClass('liActive');
			$('#pageCircle ul li').eq(3).siblings('li').removeClass('liActive');
		}else if($(this).scrollTop()>=121+h*3.5){
			$('#pageCircle ul li').eq(4).addClass('liActive');
			$('#pageCircle ul li').eq(4).siblings('li').removeClass('liActive');
		}else if($(this).scrollTop()<121+h*0.5){
			$('#pageCircle ul li').eq(0).addClass('liActive');
			$('#pageCircle ul li').eq(0).siblings('li').removeClass('liActive');
		}	
	});
	$('#pageCircle ul li').click(function(){
		var index = $(this).index();
		var h = $(window).height();
		$(this).addClass('liActive');
		$(this).siblings('li').removeClass('liActive');
		$('html,body').animate({  
            scrollTop: 121+h*index
        }, 500); 
	});
});
