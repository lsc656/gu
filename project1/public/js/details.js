/**
 * Created by web on 2018/12/6.
 */

var $img=$("#section div.enlarged-image");/*右侧放大图的父元素*/
var $ul=$("#section>div:first-child>div:nth-child(2)>div:first-child>div:nth-child(2)>div>ul");
var $btnp=$("#section>div:first-child>div:nth-child(2)>div:first-child>div:nth-child(2)").children().first();
var $btnn=$("#section>div:first-child>div:nth-child(2)>div:first-child>div:nth-child(2)").children().last();
var canRight=false;
var moved=0;
var li_length=75;

var getComment=function(pno){
    if(!pno){
        pno=1;
    }
    $.ajax({
        url:"http://127.0.0.1:3000/user/comment",
        data:"pid=1&pno="+pno,
        type:"get",
        success:function(res){
            res=res.data;
            console.log(res);
            var html="";
            for(var i=0;i<res.length;i++){
                html+=`<div class="d-flex content-item">
                <div class="w-25 p-2 d-flex justify-content-center">
                <div><img src="./images/details/avatar_none.jpg" class="w-100" alt=""/></div>
                <div class="m-2">
                <div>${res[i].cname}</div>
                <div><img src="./images/details/member_level_1.png" alt=""/></div>
                </div>
                </div>
                <div class="w-75 p-2">
                <div class="d-flex justify-content-between">
                <div>评分：<img src="./images/details/icon_star_5.gif" alt=""/></div>
                <div>${res[i].ctime}</div>
                </div>
                <p class="pt-3">
                <span class="text-danger">购物体验：</span>${res[i].content}
                </p>
                </div>
                </div>`
            }
            $(html).replaceAll("#section>div:last-child>div:nth-child(2)>div:nth-child(5) div.content-item")
        }
    })
}
//初始隐藏m-point 和 右侧放大图
$(function(){
    $img.hide();
    $("#section>div:first-child>div:nth-child(2)>div:first-child>div:first-child div.m-point").hide();
    //改变小图ul长度
    var $ul=$("#section>div:first-child>div:nth-child(2)>div:first-child>div:nth-child(2)>div>ul");
    $ul.css("width",$ul.children().length*($ul.children().first().width()+20)+"px");
    //初始禁用ul左侧按钮，右侧按钮查看长度
    $btnp.attr("disabled","disabled");
    if($ul.width()<=300){
        $btnn.attr("disabled","disabled");
    }else{
        canRight=true;
    }
    $("#section>div:first-child>div:nth-child(2)>div:nth-child(2)>div:first-child>div:nth-child(4)>p").addClass("active");
    $("#section>div:nth-child(2)>div:nth-child(3)>ul").children("li:first-child").addClass("active");
    $("#section>div:last-child>div:first-child>div:nth-child(2)>div:nth-child(2)>div:first-child").addClass("d-block");
    $("#section>div:last-child>div:first-child>div:nth-child(2)>div:first-child>p:first-child").addClass("active");
    $("#section>div:last-child>div:first-child>div:nth-child(2)>div:nth-child(2)>div>div:first-child").addClass("flex-column").children("div:first-child").addClass("d-none").next().addClass("d-block");
    $("#section>div:last-child>div:nth-child(2)>div:nth-child(4)>div:nth-child(4)>p").css("width",$("#section>div:last-child>div:nth-child(2)>div:nth-child(4)>div:nth-child(4)>div>a").css("width"));
    getComment();
});

var $pmask=$("#section>div:first-child>div:nth-child(2)>div:first-child>div:first-child").on("mousemove","div.mask",function(e){
    var $mask=$(this);
    $(this).prev().css({
        "top":function(){
            var offtop;
            if(e.offsetY<($(this).height())/2){
                offtop=0
            }else if(e.offsetY>($(this).height())/2 && e.offsetY<($(this).prev().height())-($(this).height()-6)/2){
                offtop=e.offsetY-($(this).height())/2;
            }else{
                offtop=$(this).prev().height()-($(this).height()-2);
            }
            return offtop+"px"
        },
        "left":function(){
            var offleft;
            if(e.offsetX<($(this).width())/2){
                offleft=0
            }else if(e.offsetX>($(this).width())/2 && e.offsetX<($(this).prev().width())-($(this).width()-6)/2){
                offleft=e.offsetX-($(this).width())/2;
            }else{
                offleft=$(this).prev().width()-($(this).width()-2);
            }
            return offleft+"px"
        }
    })
    var toTop=parseFloat($(this).prev().css("top"));
    var toLeft=parseFloat($(this).prev().css("left"))

    var $img=$("#section div.enlarged-image>img")
   $img.css({
        "top":function(){
            return -toTop/$mask.height()*$img.height()+"px";
        },
        "left":function(){
            return -toLeft/$mask.width()*$img.width()+"px";
        }
    })
});


$pmask.on("mouseenter","div.mask",function(){
    $(this).prev().show();
    $img.show();
}).on("mouseleave","div.mask",function(){
    $(this).prev().hide();
    $img.hide();
});
var $lg_img=$("#section div.enlarged-image").children();
var $md_img=$("#section>div:first-child>div:nth-child(2)>div:first-child>div:first-child div.m-point").prev();

//切换上方大图片src
$ul.on("mouseenter","img",function(){
    var $src=$(this)[0].src;
    $lg_img.attr("src",$src);
    $md_img.attr("src",$src);
});
//左右移动
var maxMoved=$ul.children().length*($ul.children().first().width()+20)/li_length-4;
$btnp.on("click",function(){
    moved+=1;
    $ul.css("margin-left",moved*li_length+"px");
    $btnn.removeAttr("disabled");
    if(moved==0){
        $btnp.attr("disabled","disabled");
    }
});
$btnn.on("click",function(){
    moved+=-1;
    $btnp.removeAttr("disabled");
    $ul.css("margin-left",moved*li_length+"px");
    if(moved==-maxMoved){
        $btnn.attr("disabled","disabled");
    }
});
$("#section>div:first-child>div:nth-child(2)>div:nth-child(2)>div:first-child>div:nth-child(4)>p").on("click",function(){
    $(this).toggleClass("active");
})
$("#section>div:first-child>div:nth-child(2)>div:first-child>div:nth-child(2)>div>ul>li img").on("mouseenter",function(){
    var a=$(this).css("border-color","#b21f2d").parent().parent().siblings().children().children().css("border-color","#c3c3c3");
})

$("#section>div:nth-child(2)>div:nth-child(3)>ul").on("click","li",function(){
    $(this).addClass("active").siblings().removeClass("active");
    $(this).children("a").addClass("active").parent().siblings().children("a").removeClass("active");
    var $img=$("#section>div:nth-child(2)>div:nth-child(3)>div>div:first-child>img");
    $img.attr("src",$(this).children("a").attr("data-dataset"))

    $("#section>div:nth-child(2)>div:nth-child(3)>div>div>p>span").first().html($(this).children("a").attr("data-price"))
})
$("#section>div:last-child>div:first-child>div:nth-child(2)>div:first-child").on("click","p",function(e){
    if($(this).html()=="相似款式"){
        $(this).addClass("active").siblings().removeClass("active").parent().next().children("div:first-child").addClass("d-block").siblings().removeClass("d-block")
    }else{
        $(this).addClass("active").siblings().removeClass("active").parent().next().children("div:last-child").addClass("d-block").siblings().removeClass("d-block")
    }
})
$("#section>div:last-child>div:first-child>div:nth-child(2)>div:nth-child(2)>div").on("mouseenter","div.c2-item",function(){
    $(this).addClass("flex-column").children("div:first-child").addClass("d-none").next().addClass("d-block").parent().siblings().removeClass("flex-column").children("div:first-child").removeClass("d-none").next().removeClass("d-block");
})
$(window).scroll(function(){
    var $top=$(window).scrollTop();
    if($top>892){
        var $width=$("#section>div:last-child>div:nth-child(2)>div:nth-child(2)").css("width")
        $("#section>div:last-child>div:nth-child(2)>div:first-child").addClass("position-fixed").css({"top":"0","width":$width})
    }else{
        $("#section>div:last-child>div:nth-child(2)>div:first-child").removeClass("position-fixed")
    }
})
$("#section>div:last-child>div:nth-child(2)>div:nth-child(5)>div:first-child>ul").on("click","li",function(){
    $(this).addClass("active").siblings().removeClass("active");
    var $div=$("#section>div:last-child>div:nth-child(2)>div:nth-child(5)>div:nth-child(2)")
    if($(this).index()==0 || $(this).index()==1){
       $div.children().eq(0).addClass("active").siblings().removeClass("active");
    }else if($(this).index()==2){
        $div.children().eq(1).addClass("active").siblings().removeClass("active");
    }else{
        $div.children().eq(2).addClass("active").siblings().removeClass("active");
    }
})
$("#section>div:last-child>div:nth-child(2)>div:nth-child(5)>div:nth-child(3)").on("click","div",function(){
    if($(this).html()=="首页"){
        getComment();
    }
})