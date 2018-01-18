/* $Id : my_common.js 4865 2007-01-31 14:04:10Z paulgao $ */

/*
*
* */
function Ajax(url,params,callback,transferMode,responseType,asyn){
    var async=asyn?true:false;
    var datas=JSON.stringify(params);
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