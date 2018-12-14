/**
 * Created by web on 2018/12/1.
 */
var un=false;
var up=false;
$("#email").on("blur",function(){
    var val=$(this).val()
    var reg=/^\S{6,20}$/
    un=reg.test(val);
})
$("#upwd").on("blur",function(){
    var val=$(this).val();
    var reg=/^\S{6,12}$/;
    up=reg.test(val);
})
$("#section>div>div:nth-child(2)>div:nth-child(2)>p:nth-child(2)>a").on("click",function(){
    location.href="reg.html";
})
$("#section table button").on("click",function(){
    if(un && up){
        var uname=$("#email").val();
        var upwd=$("#upwd").val();
        $.ajax({
            url:"http://127.0.0.1:3000/user/login",
            data:{uname,upwd},
            type:"post",
            dataType:"json",
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
                if(res.code==0){
                    alert(res.data)
                }else if(res.code==1){
                    sessionStorage.setItem("uname",res.data[0].uname);
                    sessionStorage.setItem("isLogin",true);
                    var t=3
                    alert(`登录成功，${t}秒后自动跳转首页`)
                    setInterval(function(){
                        if(t>1){
                            t--;
                            alert(`登录成功，${t}秒后自动跳转首页`)
                        }else{
                            location.href="index.html"
                        }
                    },1000)
                }
            }
        })
    }
})