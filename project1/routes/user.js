/**
 * Created by web on 2018/11/22.
 */
const express=require("express");
const pool=require("../pool")
var router=express.Router();
router.get("/comment",(req,res)=>{
	var pno=parseInt(req.query.pno);
	if(!pno){
		pno=1;
	}
	var pid=req.query.pid;
	var start=(pno-1)*10;
	var sql="SELECT cid,cname,ctime,content FROM gu_comment WHERE pid=? LIMIT ?,10";
	pool.query(sql,[pid,start],(err,result)=>{
		if(err) throw err;
		res.send({code:1,data:result})
	})
});
module.exports=router;