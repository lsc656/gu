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
/*1.1��һ����������*/
$("#section>ul:first-child").on("mouseenter","li",function(){
    var i=$(this).index()+1;
    if(i>7){
        i=-1;
    }
    //this�������ұ߿�siblings���ұ߿�
    if(i!=-1){
        $(this).css({"border":"1px solid #AD3F4A","border-right":"0"}).siblings().removeAttr("style").css("border-right","2px solid #BE313F");
    }
    //����ul�б��Ҳ�div����
    //i=-1ʱ���Ƴ��Ҳ����ж���
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
    //����Ƴ��Ҳ�ʱ���Ƴ�����
    $("#section>div:nth-child(2)").mouseleave(function(){
        remove();
    })
})
/*1.2��һ�б����л�*/
//�ҵ�#section,ÿ��N���滻�䱳��
//css("background-image","url("../../images/index/ca-1.jpg")")
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
/*1.3button��ť*/
//button��ť���ʱ��ʾ���У����ֱ�Ϊ�鿴���֣��ٴε��ʱ��ʾ4��

