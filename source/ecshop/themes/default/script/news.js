$(function(){
	var bannerLeft = $('#banner').find('img').width();

	$('#banner').find('img').css('margin-left','-'+((bannerLeft-$(window).width())/2)+'px');
	$(window).resize(function(){
		var bannerLeft = $('#banner').find('img').width();
        $('#banner').find('img').css('margin-left','-'+((bannerLeft-$(window).width())/2)+'px');
	});
});