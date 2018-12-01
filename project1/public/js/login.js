/**
 * Created by web on 2018/12/1.
 */
function testVal(val,reg){
    if(reg.test(val)){
        $("#section table button").removeAttr("disabled");
    }else{
        $("#section table button").attr("disabled","disabled");
    }
}
$("#email").on("keyup",function(){
    var val=$(this).val()
    var reg=/^\S{8,20}$/
    testVal(val,reg)
})
$("#upwd").on("keyup",function(){
    var val=$(this).val();
    var reg=/^\S{6,12}$/
    testVal(val,reg);
})