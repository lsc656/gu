/**
 * Created by web on 2018/11/22.
 */
const express=require("express");
const pool=require("../pool")
var router=express.Router();
router.post("/login",(req,res)=>{
	var uname=req.body.uname;
	var upwd=req.body.upwd;
	if(!uname || !upwd){
		return
	}
	var sql="SELECT uid,uname,tel,email,address FROM gu_user WHERE uname=? AND upwd=md5(?)";
	pool.query(sql,[uname,upwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			req.session.uname=result[0].uname;
			req.session.isLogin=true;
			res.send({code:1,data:result})
		}else{
			res.send({code:0,data:"用户名或密码错误"});
		}
	})
})
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
		res.send({code:1,data:result});
	})
});
router.post("/reg",(req,res)=>{
	var uname=req.body.uname;
	var upwd=req.body.upwd;
	if(!uname || !upwd){
		return
	}
	var sql=`INSERT INTO gu_user (uname,upwd) VALUES (?,md5(?))`;
	pool.query(sql,[uname,upwd],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send({code:1,data:"注册成功"})
		}else{
			res.send({code:0,data:"注册失败"})
		}
	})
})
module.exports=router;