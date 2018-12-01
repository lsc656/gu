/**
 * Created by web on 2018/12/1.
 */
/**
 * Created by web on 2018/11/20.
 */
$(function(){
    $.ajax({
        url:"footer.html",
        type:"get",
        success:function(res){
            $(res).replaceAll($("#footer"))
        }
    })
})
