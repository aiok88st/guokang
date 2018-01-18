$(function(){
	//var bannerLeft = $('#banner img').width();
	//$('#banner img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
	//$(window).resize(function(){
	//	var bannerLeft = $('#banner img').width();
	//	$('#banner img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
	//});
	//knowSeven
	$('.mapContent a').click(function(){
		$(this).parents('.mapContent').prev('.mapImg').slideToggle();
	});
});
