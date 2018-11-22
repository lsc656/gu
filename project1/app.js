const express=require('express');
const bodyParser=require('body-parser');
const cors=require("cors");
const session=require("express-session");
//引入路由
const index=require("./routes/index.js");

var app=express();
app.listen(3000);

app.use(bodyParser.urlencoded({
	extended:false
}))
//托管静态文件
app.use(express.static('public'));
app.use(cors({
	origin:"http://127.0.0.1:5500"
}))
app.use(session({
	secret:"128位随机字符",
	resave:false,
	saveUninitialized:true
}))
//挂载路由
app.use("/index",index);
