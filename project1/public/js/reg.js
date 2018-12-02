/**
 * Created by web on 2018/12/1.
 */
var inputuname=false;
var inputupwd=false;
$(function(){
    $("table button").attr("disabled","disabled")
})
$("#uname").on("keyup",function(){
    if(!$(this).val()){
        $("#uname").next().html('请输入邮箱/手机号码！').css("color","#DA1E3A");
        inputuname=false;
    }else{
        $("#uname").next().html("");
        inputuname=true;
    }
})
$("#section table>tbody>tr:not(:first-child)>td").on("blur","input",function(){
    if($("#upwd").val()!=$("#cpwd").val()){
        $("#cpwd").next().css("color","#DA1E3A");
        inputupwd=false;
    }else{
        $("#cpwd").next().removeAttr("style").html("密码一致").css("color","green");
        inputupwd=true;
    }

})
$("#section table>tbody>tr>td>input").on("blur",function(){
    if(inputuname&&inputupwd){
        $("table button").removeAttr("disabled");
    }else{
        $("table button").attr("disabled","disabled");
    }
})
$("table button").on("click",function(){

})
