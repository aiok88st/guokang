$(function(){
	//实例化轮播图
	var swiperIndex = new Swiper('.swiper-container-index', {
		loop: true,
		pagination: '.swiper-pagination',
		paginationClickable :true,
		autoplayDisableOnInteraction : true,
		autoplay:5000,
		onInit: function(swiper){
		}
	});
	//实例化轮播图
	var swiperCj = new Swiper('.swiper-container-cj', {
		onInit: function(swiper){
			
		}
	});

    var swipergoods = new Swiper('.swiper-container-goods', {
        onInit: function(swiper){

        }
    });
    var swipernews = new Swiper('.swiper-container-new', {
        onInit: function(swiper){

        }
    });
});
