/**
 * Created by web on 2018/11/19.
 */
$(function(){
    $.ajax({
        url: "http://localhost:3000/index",
        type: "get",
        dataType: "json",
        success: function (res) {
            var {cities,details}=res;
            console.log(cities)
            var floor1=new Vue({
                el: "#floor>div:first-child>div:nth-child(2)>div:nth-child(2)",
                data: {
                    cities
                }
            })
        }
    })
})
/*1.1*/
$("#section>ul:first-child").on("mouseenter","li",function(){
    var i=$(this).index()+1;
    if(i>7){
        i=-1;
    }
    if(i!=-1){
        $(this).css({"border":"1px solid #AD3F4A","border-right":"0"}).siblings().removeAttr("style").css("border-right","2px solid #BE313F");
    }
    var remove=function(){
        $("#section>div:nth-child(2)").addClass("d-none").removeClass("d-md-block").children().addClass("d-none").children().addClass("d-none")
        $("#section>ul:first-child>li").removeAttr("style");
    }
    if(i!=-1){
        $("#section>ul:first-child").next().removeClass("d-none").addClass("d-md-block").children().removeClass("d-none")
        var a="#section>div:nth-child(2)>div>div:nth-child("+i+")";
        $(a).removeClass("d-none").siblings().addClass("d-none")
    }else{
        remove();
    }
    $("#section>div:nth-child(2)").mouseleave(function(){
        remove();
    })
})
/*1.2*/

var dept=2;
setInterval(function(){
        $("#section").css("background-image",function(){
            if(dept==5){
                dept=1;
            }
            //ע�⣺����·�������indexλ����css��һ��//
            var m="url('../images/index/ca-"+ dept++ +".jpg')"
            return m
        });
},2000);
/*1.3button*/
