$('#top').click(function () {
    $('html,body').animate({
        scrollTop: 0
    }, 500);
})
$(window).scroll(function (event) {
    if($(document).scrollTop()>400){
        $('#top').show()
    }else{
        $('#top').hide()
    }
})