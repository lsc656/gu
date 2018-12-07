/**
 * Created by web on 2018/12/6.
 */

var $img=$("#section div.enlarged-image")/*右侧放大图的父元素*/

//初始隐藏m-point 和 右侧放大图
$(function(){
    $img.hide();
    $("#section>div:first-child>div:nth-child(2)>div:first-child>div:first-child div.m-point").hide();
})

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
})


$pmask.on("mouseenter","div.mask",function(){
    $(this).prev().show();
    $img.show();
}).on("mouseleave","div.mask",function(){
    $(this).prev().hide();
    $img.hide();
})
