$("#section div.content-section>div:first-child>div>a>span").click(function(){
    $(this).toggleClass("active")
})
$("#section div.content-section>div:first-child").on("click","a",function(){
    var $a=$(this).addClass("u-checked").parent().siblings().children().removeClass("u-checked")
})