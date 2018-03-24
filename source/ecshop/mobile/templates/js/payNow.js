$(function(){
	//选择方式
	$('.method').on('click',function(){
		$(this).find('.box').addClass('hasChoice');
		$(this).siblings('.method').find('.box').removeClass('hasChoice');
	});
	setTimeout(function(){
		$('#success').height($(window).height()-$('#headers').height());
	},200);
	//付款
	$('#payMoney button').on('click',function(){
		$('#success').show();
		$('.payBox').hide();
	});
});
