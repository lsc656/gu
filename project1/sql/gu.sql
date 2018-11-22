SET NAMES UTF8;
DROP DATABASE IF EXISTS gu;
CREATE DATABASE gu CHARSET=UTF8;
USE gu;
/*用户表*/
CREATE TABLE gu_user(
	uid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	tel CHAR(11) UNIQUE,
	email VARCHAR(32) UNIQUE,
	upwd VARCHAR(32) NOT NULL,
	address VARCHAR(100)
);
/*商品组*/
CREATE TABLE product_group(
	gid TINYINT PRIMARY KEY AUTO_INCREMENT,
	gclass VARCHAR(16) UNIQUE,
	gnumber SMALLINT UNIQUE
);
/*商品列表A*/
CREATE TABLE product_spectacle_frame(
	fid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	fbrand VARCHAR(16),
	fcolor VARCHAR(5),
	fhot VARCHAR(10),
	fstyle VARCHAR(10),
	fsuit VARCHAR(10),
	fmaterial VARCHAR(10),
	fpic VARCHAR(120),
	fkeys VARCHAR(20),
	gnumber SMALLINT,
	FOREIGN KEY (gnumber) REFERENCES product_group (gnumber)
);
/*商品列表B*/
CREATE TABLE product_spectacle_lenses(
	lid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	lbrand VARCHAR(16),
	lsuit VARCHAR(10),
	ltype VARCHAR(10),
	lkeys VARCHAR(20),
	lmaterial VARCHAR(10),
	gnumber SMALLINT,
	FOREIGN KEY (gnumber) REFERENCES product_group (gnumber)
);
/*首页*/
/*首页————地区*/
CREATE TABLE gu_index_cities(
	cit_cid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	cit_area SMALLINT,
	cit_title SMALLINT,
	cit_add VARCHAR(56),
	cit_time VARCHAR(20),
	cit_sup VARCHAR(20),
	cit_href VARCHAR(128)
);
/*首页————所有展示商品*/
CREATE TABLE gu_index_productlist(
	ip_pid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	ip_class SMALLINT,
	ip_title SMALLINT,
	ip_price DECIMAL(6,2),
	ip_comment VARCHAR(300) DEFAULT "暂无评论！",
	ip_src VARCHAR(128)
);


/*******************添加数据*******************/
/*商品组添加数据*/
INSERT INTO product_group VALUES
(NULL,"眼镜框",10),
(NULL,"眼镜片",20),
(NULL,"隐形眼镜",30),
(NULL,"眼镜清洗",40),
(NULL,"伴侣盒",50),
(NULL,"太阳镜",60),
(NULL,"游泳产品",70),
(NULL,"老花镜",80),
(NULL,"防辐射眼镜",90),
(NULL,"配件",100),
(NULL,"湿巾",110),
(NULL,"钻石切边",120);
/*商品A添加数据*/
/*商品B添加数据*/
/*用户列表添加数据*/
/*首页————地区添加数据*/
INSERT INTO gu_index_cities VALUES
(NULL,1,"杭州文晖路店","文晖路268号","10:00-20:00","400-675-2788","href"),
(NULL,1,"杭州新塘路店","新塘路220号(地铁4号线景芳五区站旁边)","10:00-20:00","400-675-2788","href"),
(NULL,1,"杭州紫金港店","紫荆花北路紫金创意大厦405(浙大紫金港校区东门向北150米)","10:00-20:00","400-675-2788","href"),
(NULL,1,"杭州高技街店","高技街63-1号(益乐路口财经学院后门旁)","10:00-20:00","0571-88963466","href"),
(NULL,1,"杭州近江店","富春路185号(地铁1号线或4号线近江站A出口，往前100米马路对面)","9:00-21:00","400-675-2788","href"),
(NULL,1,"杭州滨江店","滨盛路4398号彩虹城步行街12号商铺","9:00-21:00","400-675-2788","href"),
(NULL,1,"杭州西溪永乐城店","杭州市余杭区仓前街道景兴路666号西溪永乐城商业街306号","10:00-22:00","400-675-2788","href"),
(NULL,2,"宁波天一广场店","华楼巷19号天一豪景A座6楼615室(天一广场8号出口天一女人街楼上)","10:00-20:00","400-675-2788","href"),
(NULL,3,"上海徐家汇店","漕溪北路41号汇嘉大厦23楼2305(地铁徐家汇店7号或者9号口近美罗城)","10:00-20:00","400-675-2788","href"),
(NULL,4,"广州天河石碑桥店","天河路242号丰兴广场B座2210室太古汇正对面天水会所楼上(石牌桥BRT/地铁B出口20米)","10:00-20:00","400-675-2788","href"),
(NULL,5,"北京五道口店","成府路28号邦泰优盛大厦五道口购物中心3层05号","10:00-22:00","400-675-2788","href"),
(NULL,6,"重庆江北店","重庆市江北区北城三路74号附11号3-5","9:00-21:00","400-675-2788","href"),
(NULL,7,"曲靖宣威店","云南省曲靖市宣威市振兴中路381号","9:00-21:00","400-675-2788","href"),
(NULL,8,"河南焦作店","河南省焦作市解放区美中城","10:00-22:00","400-675-2788","href"),
(NULL,9,"龙岗润泽中心店","坂田街道坂雪岗大道与雪岗北路交叉口西南150米泽润中心A509-5","9:30-20:30","400-675-2788","href");

/*首页————所有展示商品添加数据*/
INSERT INTO gu_index_productlist VALUES
(NULL,10,"FB3013镜框",258,DEFAULT,"../images/index/2fItema1.jpg"),
(NULL,10,"FG80102镜框",458,DEFAULT,"../images/index/2fItema2.jpg"),
(NULL,10,"FB3017镜框",258,DEFAULT,"../images/index/2fItema3.jpg"),
(NULL,10,"FG6109镜框",358,DEFAULT,"../images/index/2fItema4.jpg"),
(NULL,10,"FB0064镜框",258,DEFAULT,"../images/index/2fItema5.jpg"),
(NULL,10,"FG80056镜框",458,DEFAULT,"../images/index/2fItema6.jpg"),
(NULL,20,"亿超通用太阳镜YC9606",239,DEFAULT,"../images/index/2fItemb1.jpg"),
(NULL,20,"亿超通用太阳镜YC9602",239,DEFAULT,"../images/index/2fItemb2.jpg"),
(NULL,20,"亿超通用太阳镜YC21804",499,DEFAULT,"../images/index/2fItemb3.jpg"),
(NULL,20,"亿超通用太阳镜YC9601",239,DEFAULT,"../images/index/2fItemb4.jpg"),
(NULL,20,"亿超通用太阳镜YC9605",239,DEFAULT,"../images/index/2fItemb5.jpg"),
(NULL,20,"亿超通用太阳镜YC21803",499,DEFAULT,"../images/index/2fItemb6.jpg"),
(NULL,30,"亿超运动眼镜SP0856",168,DEFAULT,"../images/index/2fItemc1.jpg"),
(NULL,30,"运动眼镜SP0862",168,DEFAULT,"../images/index/2fItemc2.jpg"),
(NULL,30,"亿超眼镜SP0866",168,DEFAULT,"../images/index/2fItemc3.jpg"),
(NULL,30,"运动骑车镜0091",168,DEFAULT,"../images/index/2fItemc4.jpg"),
(NULL,30,"运动眼镜G103",138,DEFAULT,"../images/index/2fItemc5.jpg"),
(NULL,30,"亿超近视游泳眼镜js2018",90,DEFAULT,"../images/index/2fItemc6.jpg")