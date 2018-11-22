const mysql=require('mysql');
var pool=mysql.createPool({
	host:'localhost',
	user:'root',
	port:3306,
	password:'',
	database:'gu',
	connectionLimit:20
})
module.exports=pool;