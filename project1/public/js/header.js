/**
 * Created by web on 2018/11/20.
 */
$(function(){
    $.ajax({
        url:"header.html",
        type:"get",
        success:function(res){
            $(res).replaceAll($("#header"))
        }
    })
})
