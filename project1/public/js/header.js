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
            function jumpTo(){
                $("#header>div:first-child>ul:nth-child(2)>li:nth-child(2)").on("click",function(){
                    location.href="login.html";
                }).next().next().on("click",function(){
                    location.href="reg.html";
                })
            }
            /*sessionStorage读取登录状态和用户名*/
            function stateChange(){
                if(sessionStorage.getItem("isLogin")=="true"){
                    var html=`<li class="float-md-right float-left"><a href="javascript:;" id="logOut">退出登录</a></li><li class="float-md-right float-left mr-2">欢迎回来，${sessionStorage.getItem("uname")}</li>`
                $("#header>div:first-child>ul:nth-child(2)>li:gt(0)").remove();
                    $("#header>div:first-child>ul:nth-child(2)").append($(html))
                }else{
                    var html=`<li class="float-md-right float-left"><a href="javascript:;">登录</a></li>
                    <li class="float-md-right float-left"><a href="javascript:;">|</a></li>
                    <li class="float-md-right float-left"><a href="javascript:;">注册</a></li>`
                $("#header>div:first-child>ul:nth-child(2)>li:gt(0)").remove();
                    $("#header>div:first-child>ul:nth-child(2)").append($(html))
                }
                jumpTo()
            }
            stateChange();
            jumpTo()

            /*点击退出登录，更换sessionS中的isLogin和用户名*/
            $("#logOut").on("click",function(){
                sessionStorage.removeItem("isLogin");
                sessionStorage.removeItem("uname");
                stateChange();
            })
        }
    })
})
