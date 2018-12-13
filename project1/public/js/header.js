/**
 * Created by web on 2018/11/20.
 */
$(function(){
    $.ajax({
        url:"header.html",
        type:"get",
        success:function(res){
            $(res).replaceAll($("#header"))
            /*首页事件处理函数*/
            $("#header>div:first-child>ul:nth-child(2)>li:nth-child(2)").on("click",function(){
                location.href="login.html";
            }).next().next().on("click",function(){
                location.href="reg.html";
            })
        }
    })
})



