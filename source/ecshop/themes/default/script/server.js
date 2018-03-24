$(function(){
	var bannerLeft = $('#banner img').width();
	// $('#banner>img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
	// $('#partTwo>img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
	$(window).resize(function(){
		var bannerLeft = $('#banner>img').width();
		// $('#banner>img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
		// $('#partTwo>img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
	});
	var swiper = new Swiper('.swiper-container-part3', {
        slidesPerView: 3,
        spaceBetween: 20,
        autoplayDisableOnInteraction : true,
        loop:true,
        prevButton:'.prevLeft',
		nextButton:'.nextRight',
    });
});
