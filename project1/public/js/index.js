/**
 * Created by web on 2018/11/19.
 */
$(".container>ul:first-child").on("mouseenter","li",function(){
    var i=$(this).index()+1;
    if(i>7){
        i=-1;
    }
    //this�������ұ߿�siblings���ұ߿�
    if(i!=-1){
        $(this).css({"border":"1px solid #AD3F4A","border-right":"1px solid #ccc"}).siblings().css({"border":"1px solid #ccc","border-right":"1px solid #AD3F4A"})
    }
    //����ul�б��Ҳ�div����
    //i=-1ʱ���Ƴ��Ҳ����ж���
    var remove=function(){
        $(".container>div:nth-child(2)").addClass("d-none").children().addClass("d-none").children().addClass("d-none")
        console.log( $(".container>ul>li"))
        $(".container>ul:first-child>li").css();
    }
    if(i!=-1){
        $(".container>ul:first-child").next().removeClass("d-none").children().removeClass("d-none")
        var a=".container>div:nth-child(2)>div>div:nth-child("+i+")";
        $(a).removeClass("d-none").siblings().addClass("d-none")
    }else{
        remove();
    }
    //����Ƴ��Ҳ�ʱ���Ƴ�����
    $(".container>div:nth-child(2)").mouseleave(function(){
        remove();

    })
        //.css({"border-right":"1px solid #AD3F4A"})
})
