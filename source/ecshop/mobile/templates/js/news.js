$(function(){
	//宽度
	setTimeout(function(){
		var wth = 0;
		for(var i=0;i<$('.newsBox').children('a').length;i++)
		{
			wth +=  ($('.newsBox').children('a').eq(i).width()+parseInt($('.newsBox').children('a').eq(0).css('margin-right')));
		}
		$('#newsChoice .newsBox').width(wth);
	},100);
	
});
