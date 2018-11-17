const express=require('express');
const bodyParser=require('body-parser');
//引入路由

var app=express();
app.listen(3000);

app.use(bodyParser.urlencoded({
	extended:false
}))
//托管静态文件
app.use(express.static('public'));

//挂载路由

