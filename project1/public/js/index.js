/**
 * Created by web on 2018/11/19.
 */
$.ajax({
    url:"http://localhost:3000/index",
    type:"get",
    dataType:"json",
    success:function(res){
        var {cities,details}=res;
    }
})
/*1.1第一列悬浮导航*/
$("#section>ul:first-child").on("mouseenter","li",function(){
    var i=$(this).index()+1;
    if(i>7){
        i=-1;
    }
    //this有左中右边框，siblings有右边框
    if(i!=-1){
        $(this).css({"border":"1px solid #AD3F4A","border-right":"0"}).siblings().removeAttr("style").css("border-right","2px solid #BE313F");
    }
    //移入ul列表，右侧div出现
    //i=-1时，移除右侧所有东西
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
    //鼠标移出右侧时，移除所有
    $("#section>div:nth-child(2)").mouseleave(function(){
        remove();
    })
})
/*1.2第一行背景切换*/
//找到#section,每隔N秒替换其背景
//css("background-image","url("../../images/index/ca-1.jpg")")
var dept=2;
setInterval(function(){
        $("#section").css("background-image",function(){
            if(dept==5){
                dept=1;
            }
            //注意：背景路径相对于index位置与css不一样//
            var m="url('../images/index/ca-"+ dept++ +".jpg')"
            return m
        });
},2000);
/*1.3button按钮*/
//button按钮点击时显示所有，文字变为查看部分；再次点击时显示4个

