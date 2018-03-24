$(function(){
	var bannerLeft = $('#banner>img').width();


	$('#banner>img').css('margin-left','-'+((bannerLeft-$(window).width())/2)+'px');
	var bottomLeft = $('#case>img').width();
	$('#case>img').css('margin-left','-'+((bottomLeft-$(window).width())/2)+'px');
	$(window).resize(function(){
		var bannerLeft = $('#banner>img').width();
		$('#banner>img').css('margin-left','-'+((bannerLeft-$(window).width())/2)+'px');
		var bottomLeft = $('#case>img').width();
		$('#case>img').css('margin-left','-'+((bottomLeft-$(window).width())/2)+'px');
	});
});
