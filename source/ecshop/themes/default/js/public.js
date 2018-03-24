$(function(){

	$('.dropdown li').click(function(){
		$(this).siblings('li').removeClass('color-active');
		$(this).addClass('color-active');
	})
    $('#secongNav>ul>li').mousemove(function(){
        $(this).find('.thirdNav').stop().slideDown();
    });
    $('#secongNav>ul>li').mouseleave(function(){
        $(this).find('.thirdNav').stop().slideUp();
    });

});
/*
* 消息弹窗提示
* @type:1,两个按钮。2,自定义按钮。否则,一个按钮，按钮名称就是type
* @title:提示窗标题
* @center:提示内容
* @Callback：回调函数
* @action:[
*   {
*       'name':'按钮名称',
*       'class':'按钮样式名称',
*       'Callback'：'回调函数'
*   }
* ]
* */
function massges(type,title,center,Callback,action){
    var body=document.getElementsByTagName("body")[0];
    var bomb=document.createElement('div');
    if(type==1){
        bomb.className="bomb tips-cancle";
    }else{
        bomb.className="bomb tips-cancle2";
    }
    var bomb_conent=document.createElement('div');
    bomb_conent.className="bomb-conent";
    /*关闭按钮start */
    var span=document.createElement('span');
    span.className="close";
    span.innerHTML="x";
    span.addEventListener("click",function(){
        body.removeChild(bomb);
    });
    bomb_conent.appendChild(span);
    /* 关闭按钮end */
    /*提示tile*/
    var h3=document.createElement('h3');
    h3.className="text-center";
    if(!title){
        h3.innerHTML="消息提示";
    }else{
        h3.innerHTML=title;
    }
    bomb_conent.appendChild(h3);
    /*提示title end*/
    bomb_conent.appendChild(document.createElement('hr'));

    /*提示内容*/
    var p=document.createElement('p');
    p.className="words2 text-center";
    p.innerHTML=center;
    bomb_conent.appendChild(p);
    /*提示内容end*/
    /*按钮*/
    var but;
    if(type==1){
        but=document.createElement('div');
        but.className='btn-wrap';
        var but1=document.createElement('button');
        but1.className="btn btn-primary";
        but1.innerHTML="确定";
        but1.addEventListener("click",function(){
            if(typeof(Callback)=="function"){
                Callback();
            }else{
                body.removeChild(bomb);
            }
        });

        var but2=document.createElement('button');
        but2.className="btn btn-default";
        but2.innerHTML="取消";
        but2.addEventListener("click",function(){
            body.removeChild(bomb);
        });
        but.appendChild(but1);
        but.appendChild(but2);
    }else if(type==2){  //自定一按钮
        but=document.createElement('div');
        but.className='btn-wrap';
        var but3;
        for(item in action){
            but3=document.createElement('button');
            but3.className="btn "+action[item].class;
            but3.innerHTML=action[item].name;
            but3.addEventListener("click",function(){
                if(action[item].url){
                   location.href= action[item].url;
                }else{
                    body.removeChild(bomb);
                }


            });
            but.appendChild(but3);
        }
    }else{
        but=document.createElement('button');
        but.className="btn btn-primary center-block btn-que btn-banding";
        but.innerHTML=type;
        but.addEventListener("click",function(){
            if(typeof(Callback)=="function"){
                Callback();
            }else{
                body.removeChild(bomb);
            }
        });
    }
    bomb_conent.appendChild(but);
    /*按钮end*/
    bomb.appendChild(bomb_conent);
    bomb.style.display="block";
    body.appendChild(bomb);
}
/*
* 错误提示
* 在元素下面追加
* */
function erro_text(obj,text) {
    $(obj).find('.erro_text').remove();
    var html = '<span style="color: red" class="erro_text">'+text+'</span>';
    $(obj).append(html);
}














