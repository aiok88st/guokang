$(function(){
	//选择发票类型
	$('.invoices .pTwoBtn').find('button').on('click',function(){
		$(this).addClass('cBtn');
		$(this).siblings('button').removeClass('cBtn');
		if($(this).index()==0)
		{
			$('.iInput').find('input').attr('placeholder',"个人名称");
		}else{
			$('.iInput').find('input').attr('placeholder',"公司名称");
		}
	});
	//选择付款类型
	$('.payMethods .pTwoBtn').find('button').on('click',function(){
		$(this).addClass('cBtn');
		$(this).siblings('button').removeClass('cBtn');
		if($(this).index()==0)
		{
			$('.mtdBox').show();
		}else{
			$('.mtdBox').hide();
		}
	});
	//选择付款类型
	$('.sex').find('button').on('click',function(){
		$(this).addClass('cBtn');
		$(this).siblings('button').removeClass('cBtn');
	});
	//省市区三级联动
	!function () {
        var $target = $('#city1');

        $target.citySelect();

        $target.on('click', function (event) {
            event.stopPropagation();
            $target.citySelect('open');
        });

        $target.on('done.ydui.cityselect', function (ret) {
            $(this).val(ret.provance + ' ' + ret.city + ' ' + ret.area);
        });
    }();
    $('#city1').on('click',function(){
    	$(this).blur();
    });
	//省市区三级联动
	!function () {
        var $target = $('#city2');

        $target.citySelect();

        $target.on('click', function (event) {
            event.stopPropagation();
            $target.citySelect('open');
        });

        $target.on('done.ydui.cityselect', function (ret) {
            $(this).val(ret.provance + ' ' + ret.city + ' ' + ret.area);
        });
    }();
    $('#city2').on('click',function(){
    	$(this).blur();
    });
    //选择证件类型
    $('.mbRight').find('select').change(function(){
    	$(this).prev('p').text($(this).children('option:selected').text());	
    });
});
