/**
 * Created by web on 2018/11/22.
 */
const express=require("express");
const pool=require("../pool")
var router=express.Router();
router.get("/",(req,res)=>{
    var sql=select * from gu_index_productlist;

});



module.exports=router;