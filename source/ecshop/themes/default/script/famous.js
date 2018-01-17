$(function(){
	var bannerLeft = $('#banner img').width();
	$('#banner img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
	$(window).resize(function(){
		var bannerLeft = $('#banner img').width();
		$('#banner img').css('margin-left',-(bannerLeft-$(window).width())/2+'px');
	});
});
