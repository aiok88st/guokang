$(function(){


	var tLength = $('.swiperBtnTop').children('a').length;

	//实例化轮播图
	var mySwiperTop = new Swiper('.swiper-container-top', {
		loop: true,
		nextButton: '.swiper-button-next-top',
    	prevButton: '.swiper-button-prev-top',
		autoplayDisableOnInteraction : true,
//		autoplay:5000,
		onInit: function(swiper){
            var sindex=swiper.activeIndex;
            $('.swiperBtnTop').children('a').eq(sindex).find('img').attr('src','themes/default/image/swiperBtnActive.png');
            $('.swiperBtnTop').children('a').eq(sindex).siblings('a').find('img').attr('src','themes/default/image/swiperBtn.png');

            $('.point_title').eq(sindex).show();
            $('.point_des').eq(sindex).show();
		},
		onSlideChangeEnd:function(swiper){
            var sindex=swiper.activeIndex;
			$('.swiperBtnTop').children('a').eq(sindex).find('img').attr('src','themes/default/image/swiperBtnActive.png');
			$('.swiperBtnTop').children('a').eq(sindex).siblings('a').find('img').attr('src','themes/default/image/swiperBtn.png');

            $('.point_title').eq(sindex).show().siblings().hide();
            $('.point_des').eq(sindex).show().siblings().hide();
		}
	});
	$('.swiperBtnTop').children('a').click(function(){
		var index = $(this).index();
		mySwiperTop.slideTo(index);
	});
	var tLength = $('.swiperBtnBottom').children('a').length;
	var mySwiperBottom = new Swiper('.swiper-container-bottom', {
		loop: true,
		nextButton: '.swiper-button-next-bottom',
    	prevButton: '.swiper-button-prev-bottom',
		autoplayDisableOnInteraction : true,
//		autoplay:5000,
		onInit: function(swiper){
            var sindex = swiper.activeIndex;
            $('.swiperBtnBottom').children('a').eq(sindex).find('img').attr('src','themes/default/image/swiperBtnActive.png');
            $('.swiperBtnBottom').children('a').eq(sindex).siblings('a').find('img').attr('src','themes/default/image/swiperBtn.png');

            $('.get_title').eq(sindex).show();
            $('.get_des').eq(sindex).show();

		},
		onSlideChangeEnd:function(swiper){
			var sindex = swiper.activeIndex;
			$('.swiperBtnBottom').children('a').eq(sindex).find('img').attr('src','themes/default/image/swiperBtnActive.png');
			$('.swiperBtnBottom').children('a').eq(sindex).siblings('a').find('img').attr('src','themes/default/image/swiperBtn.png');

            $('.get_title').eq(sindex).show().siblings().hide();
            $('.get_des').eq(sindex).show().siblings().hide();
		}
	});
	$('.swiperBtnBottom').children('a').click(function(){
		var index = $(this).index();
		mySwiperBottom.slideTo(index);
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
