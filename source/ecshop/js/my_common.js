/* $Id : my_common.js 4865 2007-01-31 14:04:10Z paulgao $ */

/*
*
* */
function Ajax(url,params,callback,transferMode,responseType,asyn,has_json){
    var async=asyn?true:false;
    if(has_json){
        var datas=JSON.stringify(params);
    }else{
        var datas=params;
    }

    $.ajax({
        url:url,
        type:transferMode,
        async:async,
        data:{"JSON":datas},
        dataType:responseType,
        success:function(res){
            if (typeof(callback) == 'function') {
                callback(res);
            }
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            switch(XMLHttpRequest.status) {
                case 404 : layer.msg("404错误", {icon: 5}); break;
                case 500 : layer.msg("505错误", {icon: 5}); break;
            }
            return false;
        }
    })
}
function AjaxP(url,params,callback,transferMode,responseType,asyn){
    var async=asyn?true:false;
    $.ajax({
        url:url,
        type:transferMode,
        async:async,
        data:params,
        dataType:responseType,
        success:function(res){
            if (typeof(callback) == 'function') {
                callback(res);
            }
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            switch(XMLHttpRequest.status) {
                case 404 : layer.msg("404错误", {icon: 5}); break;
                case 500 : layer.msg("505错误", {icon: 5}); break;
            }
            return false;
        }
    })
}

/*
* 获取表单
* */
function my_from() {
    var from=$('.my_from');
    var data={};
    from.find('input').each(function(){
        var type=$(this).attr('type');
        switch (type)
        {
            case "text":
            case "hidden":
                var name = $(this).attr('name');
                data[name]=$(this).val();
        }
    });
    from.find('select').each(function () {
        var name = $(this).attr('name');
        data[name]=$(this).val();
    });
    from.find('textarea').each(function(){
        var name = $(this).attr('name');
        data[name]=$(this).val();
    });
    return JSON.stringify(data);
}

/*
* 数组转json字符串
* */
function datetoJSONString () {


};
