/**
 * Created by web on 2018/11/22.
 */
const express=require("express");
const pool=require("../pool")
var router=express.Router();
router.get("/",(req,res)=>{
		var output={
			details:{},
			cities:{}
		}
    var sql="select * from gu_index_productlist";
		pool.query(sql,[],(err,result)=>{
			if(err) console.log(err);
			output.details=result;
			var sql="select * from gu_index_cities"
			pool.query(sql,[],(err,result)=>{
				if(err) console.log(err);
				output.cities=result;
				res.send(output)
			})
		})
});
module.exports=router;