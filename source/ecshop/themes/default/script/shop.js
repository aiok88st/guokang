$(function(){
	//增加减少
	$('.increase').click(function(){
		var n = parseInt($('.nbBtn').find('p').text());
		n++;
		$('.reduce').removeAttr('disabled');
		$('.reduce').find('span').css('border-color','#333333');
		$('.nbBtn').find('p').text(n);
	});
	$('.reduce').click(function(){
		var n = parseInt($('.nbBtn').find('p').text());
		n--;
		if(n==0)
		{
			$('.reduce').attr('disabled','disabled');
			$('.reduce').find('span').css('border-color','#cfcfcf');
		}
		$('.nbBtn').find('p').text(n);
	});
	//选择对象
	$('.forBtn button').click(function(){
		$(this).addClass('forActive');
		$(this).siblings('button').removeClass('forActive');
	});
	//
	$('.rightNav ul li').click(function(){
		var index = parseInt($(this).index());
		switch(index){
			case 0:
				$('html,body').animate({  
		            scrollTop: $('#shopOne').offset().top-127
		        }, 500);
		        $('.rightNav ul li a').removeClass('aActive');
				$('.rightNav ul li').eq(0).find('a').addClass('aActive');
				break;
			case 1:
				$('html,body').animate({  
		            scrollTop: $('#part1').offset().top-127
		        }, 500);
		        $('.rightNav ul li a').removeClass('aActive');
				$('.rightNav ul li').eq(1).find('a').addClass('aActive');
				break;
			case 2:
				$('html,body').animate({  
		            scrollTop: $('#part2').offset().top-127
		        }, 500);
		        $('.rightNav ul li a').removeClass('aActive');
				$('.rightNav ul li').eq(2).find('a').addClass('aActive');
				break;
			case 3:
				$('html,body').animate({  
		            scrollTop: $('#part3').offset().top-127
		        }, 500);
		        $('.rightNav ul li a').removeClass('aActive');
				$('.rightNav ul li').eq(3).find('a').addClass('aActive');
				break;
			case 4:
				$('html,body').animate({  
		            scrollTop: $('#part4').offset().top-127
		        }, 500);
		        $('.rightNav ul li a').removeClass('aActive');
				$('.rightNav ul li').eq(4).find('a').addClass('aActive');
				break;
			case 5:
				$('html,body').animate({  
		            scrollTop: $('#part5').offset().top-127
		        }, 500);
		        $('.rightNav ul li a').removeClass('aActive');
				$('.rightNav ul li').eq(5).find('a').addClass('aActive');
				break;
		}
	});
	$(window).scroll(function(){
		if($('#part1').offset().top-$(this).scrollTop()<$(window).height()/2)
		{
			$('.rightNav ul li a').removeClass('aActive');
			$('.rightNav ul li').eq(1).find('a').addClass('aActive');
		}
		if($('#part2').offset().top-$(this).scrollTop()<$(window).height()/2)
		{
			$('.rightNav ul li a').removeClass('aActive');
			$('.rightNav ul li').eq(2).find('a').addClass('aActive');
		}
		if($('#part3').offset().top-$(this).scrollTop()<$(window).height()/2)
		{
			$('.rightNav ul li a').removeClass('aActive');
			$('.rightNav ul li').eq(3).find('a').addClass('aActive');
		}
		if($('#part4').offset().top-$(this).scrollTop()<$(window).height()/2)
		{
			$('.rightNav ul li a').removeClass('aActive');
			$('.rightNav ul li').eq(4).find('a').addClass('aActive');
		}
		if($('#part5').offset().top-$(this).scrollTop()<$(window).height()/2)
		{
			$('.rightNav ul li a').removeClass('aActive');
			$('.rightNav ul li').eq(5).find('a').addClass('aActive');
		}
		if($(this).scrollTop()<=$('#part1').offset().top-$(this).scrollTop()){
			$('.rightNav ul li a').removeClass('aActive');
			$('.rightNav ul li').eq(0).find('a').addClass('aActive');
		}
		if($(this).scrollTop()>66)
		{
			$('.topNav').css('position','fixed');
			$('.topNav').css('top','55px');
		}else{
			$('.topNav').css('position','absolute');
			$('.topNav').css('top','auto');
		}
	});
});
