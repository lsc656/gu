/**
 * Created by web on 2018/12/1.
 */
var canUpwd=false;
var canUname=false;
$("#uname").on("blur",function(){
    if(!$(this).val()){
        $("#uname").next().html('请输入邮箱/手机号码/用户名！').css("color","#DA1E3A");
    }else{
        $("#uname").next().html("");
        canUname=true;
    }
})
$("#section table>tbody>tr:not(:first-child)>td").on("blur","input",function(){
    var reg=/^\w{6,20}$/;
    var str1=$("#upwd").val();
    var str2=$("#cpwd").val();
    if(reg.test(str1) && reg.test(str2)){
        if($("#upwd").val()!=$("#cpwd").val()){
            $("#cpwd").next().css("color","#DA1E3A");
        }else{
            $("#cpwd").next().removeAttr("style").html("密码一致").css("color","green");
            canUpwd=true;
        }
    }
})
$("#section>div:nth-child(2)>div:nth-child(2)>p:first-child>button").on("click",function(){
    location.href="login.html"
})
$("table button").on("click",function(){
    if(canUpwd && canUname){
        var uname=$("#uname").val();
        var upwd=$("#upwd").val();
        $.ajax({
            url:"http://127.0.0.1:3000/user/reg",
            data:{uname,upwd},
            dataType:"json",
            type:"post",
            success:function(res){
                function alert(e){
                    $("body").append("<div id='msg'><span>"+e+"</span></div>");
                    clearmsg();
                }
                function clearmsg(){
                    var t = setTimeout(function(){
                        $("#msg").remove();
                    },1000)
                };
                if(res.code==1){
                    var t=3;
                    alert(`注册成功，${t}秒后跳转到登录页面`)
                    setInterval(function(){
                        if(t>1){
                            t--;
                            alert(`注册成功，${t}秒后跳转到登录页面`)
                        }else{
                            location.href="login.html"
                        }
                    },1000)
                }else{
                    alert(res.data)
                }
            }
        })
    }
})
