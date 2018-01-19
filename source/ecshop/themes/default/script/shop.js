$(function(){
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
});
