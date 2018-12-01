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
            var f2a=[];
            var f2b=[];
            var f2c=[];
            var f4a=[];
            var f4b=[];
            var f4c=[];
            var f5a=[];
            var f5b=[];
            var f6a=[];
            var f6b=[];
            var f6c=[];
            var f6d=[];
            var f8a=[];
            var f2index=0;
            var f4index=0;
            var f5index=0;
            var f6index=0;
            for(var ep of details){
                if(ep.ip_class=="10"){
                    f2a.push(ep);
                }else if(ep.ip_class=="20"){
                    f2b.push(ep)
                }else if(ep.ip_class=="30"){
                    f2c.push(ep)
                }else if(ep.ip_class=="50"){
                    f4a.push(ep)
                }else if(ep.ip_class=="60"){
                    f4b.push(ep)
                }else if(ep.ip_class=="70"){
                    f4c.push(ep)
                }else if(ep.ip_class=="80"){
                    f5a.push(ep)
                }else if(ep.ip_class=="90"){
                    f5b.push(ep)
                }else if(ep.ip_class=="100"){
                    f6a.push(ep)
                }else if(ep.ip_class=="110"){
                    f6b.push(ep)
                }else if(ep.ip_class=="120"){
                    f6c.push(ep)
                }else if(ep.ip_class=="130"){
                    f6d.push(ep)
                }else if(ep.ip_class=="150"){
                    f8a.push(ep)
                }
            }
            var floor1=new Vue({
                el: "#floor",
                data: {
                    cities,
                    f2index,
                    f4index,
                    f5index,
                    f6index,
                    f2a,
                    f2b,
                    f2c,
                    f4a,
                    f4b,
                    f4c,
                    f5a,
                    f5b,
                    f6a,
                    f6b,
                    f6c,
                    f6d,
                    f8a,
                },
                methods:{
                    qcity(){
                        var $btn=$("#floor>div:first-child>div:nth-child(2)>div>button");
                        if($btn.html()=="点击查看全部实体店"){
                            $("#floor>div:first-child>div:nth-child(2)>div>div>div>div:gt(3)").show();
                            $btn.html("点击隐藏部分实体店")
                        }else{
                            $("#floor>div:first-child>div:nth-child(2)>div>div>div>div:gt(3)").hide();
                            $btn.html("点击查看全部实体店")
                        }
                    },
                    menter(e){
                        var $comment=$(e.target);
                        $comment.children(":nth-child(2)").css("top","165px")
                    },
                    mleave(e){
                        var $comment=$(e.target);
                        $comment.children(":nth-child(2)").removeAttr("style");
                    },
                    change2f(e){
                        $(e.target).addClass("active").siblings().removeClass("active")
                        if($(e.target).index()=="0"){
                            this.f2index=0;
                        }else if($(e.target).index()=="1"){
                            this.f2index=1;
                        }else if($(e.target).index()=="2"){
                            this.f2index=2;
                        }
                    },
                    change4f(e){
                        $(e.target).addClass("active").siblings().removeClass("active")
                        if($(e.target).index()=="0"){
                            this.f4index=0;
                        }else if($(e.target).index()=="1"){
                            this.f4index=1;
                        }else if($(e.target).index()=="2"){
                            this.f4index=2;
                        }
                    },
                    change5f(e){
                        $(e.target).addClass("active").siblings().removeClass("active")
                        if($(e.target).index()=="0"){
                            this.f5index=0;
                        }else if($(e.target).index()=="1"){
                            this.f5index=1;
                        }
                    },
                    change6f(e){
                        $(e.target).addClass("active").siblings().removeClass("active")
                        if($(e.target).index()=="0"){
                            this.f6index=0;
                        }else if($(e.target).index()=="1"){
                            this.f6index=1;
                        }else if($(e.target).index()=="2"){
                            this.f6index=2;
                        }
                    },
                    getImg(e){
                        var src= e.target.src.split("");
                        src.splice(-5,1,"2");
                        src=src.join("");
                        e.target.src=src;
                    },
                    clearImg(e){
                        var src= e.target.src.split("");
                        src.splice(-5,1,"1");
                        src=src.join("");
                        e.target.src=src;
                    },
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
            var m="url('../images/index/ca-"+ dept++ +".jpg')"
            return m
        });
},2000);


