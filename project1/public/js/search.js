$("#section div.content-section>div:first-child>div>a>span").click(function(){
    $(this).toggleClass("active")
})
$("#section div.content-section>div:first-child").on("click","a",function(){
    var $a=$(this).addClass("u-checked").parent().siblings().children().removeClass("u-checked")
})
$("#section div.content-section>div:nth-child(2)>div.content-section-item>div:first-child>ul>li").on("click","img",function(){
    $ots=$(this).addClass("active").parent().prev().addClass("active").parent().siblings().children("span").removeClass("active").siblings().children().removeClass("active")
})
$(".content-section-item").on("mouseenter",function(){
    $(this).toggleClass("active").children("div:nth-child(2)").toggleClass("invisible");
})
$(".content-section-item").on("mouseleave",function(){
    $(this).toggleClass("active").children("div:nth-child(2)").toggleClass("invisible");
})
$("#section div.content-section>div:nth-child(2)>div.content-section-item>div:first-child>ul>li>div>img").on("click",function(){
    $(this).parent().parent().parent().siblings().children("img").attr("src",$(this).attr("src"))
})
$("#section div.left-bar").on("click","p.ititle",function(){
    var $div=$(this).next().toggleClass("active");
    if($div.hasClass("active")){
        $(this).parent().siblings().children("div").removeClass("active")
    }
})
$("#section>div:nth-child(2)>div:nth-child(2)>div:nth-child(2)>div:nth-child(2)").on("click","div.content-section-item",function(){
    location.href="http://127.0.0.1:3000/details.html"
})
