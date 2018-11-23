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
	cit_title VARCHAR(64),
	cit_add VARCHAR(64),
	cit_time VARCHAR(20),
	cit_sup VARCHAR(20),
	cit_href VARCHAR(128)
);
/*首页————所有展示商品*/
CREATE TABLE gu_index_productlist(
	ip_pid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	ip_class SMALLINT,
	ip_title VARCHAR(300),
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
(NULL,10,"FB3013镜框",258,DEFAULT,"../public/images/index/2fItema1.jpg"),
(NULL,10,"FG80102镜框",458,DEFAULT,"../public/images/index/2fItema2.jpg"),
(NULL,10,"FB3017镜框",258,DEFAULT,"../public/images/index/2fItema3.jpg"),
(NULL,10,"FG6109镜框",358,DEFAULT,"../public/images/index/2fItema4.jpg"),
(NULL,10,"FB0064镜框",258,DEFAULT,"../public/images/index/2fItema5.jpg"),
(NULL,10,"FG80056镜框",458,DEFAULT,"../public/images/index/2fItema6.jpg"),
(NULL,20,"亿超通用太阳镜YC9606",239,DEFAULT,"../public/images/index/2fItemb1.jpg"),
(NULL,20,"亿超通用太阳镜YC9602",239,DEFAULT,"../public/images/index/2fItemb2.jpg"),
(NULL,20,"亿超通用太阳镜YC21804",499,DEFAULT,"../public/images/index/2fItemb3.jpg"),
(NULL,20,"亿超通用太阳镜YC9601",239,DEFAULT,"../public/images/index/2fItemb4.jpg"),
(NULL,20,"亿超通用太阳镜YC9605",239,DEFAULT,"../public/images/index/2fItemb5.jpg"),
(NULL,20,"亿超通用太阳镜YC21803",499,DEFAULT,"../public/images/index/2fItemb6.jpg"),
(NULL,30,"亿超运动眼镜SP0856",168,DEFAULT,"../public/images/index/2fItemc1.jpg"),
(NULL,30,"运动眼镜SP0862",168,DEFAULT,"../public/images/index/2fItemc2.jpg"),
(NULL,30,"亿超眼镜SP0866",168,DEFAULT,"../public/images/index/2fItemc3.jpg"),
(NULL,30,"运动骑车镜0091",168,DEFAULT,"../public/images/index/2fItemc4.jpg"),
(NULL,30,"运动眼镜G103",138,DEFAULT,"../public/images/index/2fItemc5.jpg"),
(NULL,30,"亿超近视游泳眼镜js2018",90,DEFAULT,"../public/images/index/2fItemc6.jpg"),
(NULL,40,"亿超通用太阳镜YC9606",239,DEFAULT,"../public/images/index/2fItemb1.jpg"),
(NULL,40,"亿超通用太阳镜YC9602",239,DEFAULT,"../public/images/index/2fItemb2.jpg"),
(NULL,40,"亿超通用太阳镜YC21804",499,DEFAULT,"../public/images/index/2fItemb3.jpg"),
(NULL,40,"亿超通用太阳镜YC9601",239,DEFAULT,"../public/images/index/2fItemb4.jpg"),
(NULL,40,"亿超通用太阳镜YC9605",239,DEFAULT,"../public/images/index/2fItemb5.jpg"),
(NULL,40,"亿超通用太阳镜YC21803",499,DEFAULT,"../public/images/index/2fItemb6.jpg"),
(NULL,50,"亿超眼镜框FB6135",258,DEFAULT,"../public/images/index/4fItema1.jpg"),
(NULL,50,"亿超眼镜框FB0045",258,DEFAULT,"../public/images/index/4fItema2.jpg"),
(NULL,50,"亿超眼镜框FB5078",258,DEFAULT,"../public/images/index/4fItema3.jpg"),
(NULL,50,"竹川木野眼镜框Z3633",458,DEFAULT,"../public/images/index/4fItema4.jpg"),
(NULL,50,"竹川木野眼镜框Z3668",458,DEFAULT,"../public/images/index/4fItema5.jpg"),
(NULL,50,"竹川木野眼镜框Z1630",258,DEFAULT,"../public/images/index/4fItema6.jpg"),
(NULL,60,"亿超眼镜框FB0066",258,DEFAULT,"../public/images/index/4fItemb1.jpg"),
(NULL,60,"亿超眼镜框FB0054",258,DEFAULT,"../public/images/index/4fItemb2.jpg"),
(NULL,60,"亿超眼镜框FB0011",258,DEFAULT,"../public/images/index/4fItemb3.jpg"),
(NULL,60,"亿超眼镜框FB0027",258,DEFAULT,"../public/images/index/4fItemb4.jpg"),
(NULL,60,"亿超眼镜框FB0008",258,DEFAULT,"../public/images/index/4fItemb5.jpg"),
(NULL,60,"亿超眼镜框FB0006",258,DEFAULT,"../public/images/index/4fItemb6.jpg"),
(NULL,70,"亿超眼镜框FG6002",168,DEFAULT,"../public/images/index/4fItemc1.jpg"),
(NULL,70,"亿超眼镜框FG80101",458,DEFAULT,"../public/images/index/4fItemc2.jpg"),
(NULL,70,"亿超眼镜框FB6166",358,DEFAULT,"../public/images/index/4fItemc3.jpg"),
(NULL,70,"亿超眼镜框FG80104",458,DEFAULT,"../public/images/index/4fItemc4.jpg"),
(NULL,70,"亿超眼镜框FG80037",458,DEFAULT,"../public/images/index/4fItemc5.jpg"),
(NULL,70,"亿超1106女士眼镜框",168,DEFAULT,"../public/images/index/4fItemc6.jpg"),
(NULL,80,"博士伦水灵焕彩年抛1片隐形眼镜",98,DEFAULT,"../public/images/index/5fItema1.jpg"),
(NULL,80,"强生美瞳艾姗珍珠黑美瞳日抛5片装",58,DEFAULT,"../public/images/index/5fItema2.jpg"),
(NULL,80,"海昌星眸日抛20片装",140,DEFAULT,"../public/images/index/5fItema3.jpg"),
(NULL,80,"海润丽美瞳黑色半年抛1片装彩色隐形眼镜",52,DEFAULT,"../public/images/index/5fItema4.jpg"),
(NULL,80,"海昌润丽美瞳棕色半年抛1片装隐形眼镜",52,DEFAULT,"../public/images/index/5fItema5.jpg"),
(NULL,80,"博伦清朗半年抛2片隐形眼镜",75,DEFAULT,"../public/images/index/5fItema6.jpg"),
(NULL,90,"卫康新视多功能软性接触镜保养液125ML",12,DEFAULT,"../public/images/index/5fItemb1.jpg"),
(NULL,90,"卫康清凉型隐形眼镜护理液500125ML护理液",29,DEFAULT,"../public/images/index/5fItemb2.jpg"),
(NULL,90,"卫康清凉型护理液125ml",12,DEFAULT,"../public/images/index/5fItemb3.jpg"),
(NULL,90,"博士伦润明除蛋白隐形眼镜护理液355ML护理液",35,DEFAULT,"../public/images/index/5fItemb4.jpg"),
(NULL,90,"博士伦润明新概念润眼液8ml",20,DEFAULT,"../public/images/index/5fItemb5.jpg"),
(NULL,100,"亿超全效蓝光防护系列/MR-8材质坚韧安全、全防紫外线、过滤有害蓝光、镜片无底色，清晰透亮。",NULL,DEFAULT,"../public/images/index/6fItema1.jpg"),
(NULL,100,"专为预防青少年近视加深研制/眼轴拉伸是青少年近视加深的一大元凶。阳关少年系列镜片，采用双面复合环焦技术，周边成像与视网膜，减少眼轴变化。",NULL,DEFAULT,"../public/images/index/6fItema2.jpg"),
(NULL,100,"智能感光，迅速变色，一镜两用/亿超变色镜片凭借“感光强，变色快”的原理和“膜层技术”，减少紫外线对眼睛的伤害视野更清晰。多效",NULL,DEFAULT,"../public/images/index/6fItema3.jpg"),
(NULL,110,"亿超1.601MR8非球面超耐磨近视眼镜片",199,DEFAULT,"../public/images/index/6fItemb1.jpg"),
(NULL,110,"亿超1.553防雾防蓝光非球面镜片",480,DEFAULT,"../public/images/index/6fItemb2.jpg"),
(NULL,110,"亿超1.552阳光少年高清绿膜镜片",480,DEFAULT,"../public/images/index/6fItemb3.jpg"),
(NULL,110,"亿超高定1.665超薄非球面双效防护树脂片",780,DEFAULT,"../public/images/index/6fItemb4.jpg"),
(NULL,120,"依视路1.601特薄钻晶A3",756,DEFAULT,"../public/images/index/6fItemc1.jpg"),
(NULL,120,"依视路1.591变灰色片",1666,DEFAULT,"../public/images/index/6fItemc2.jpg"),
(NULL,120,"依视路超薄1.552双效防护",468,DEFAULT,"../public/images/index/6fItemc3.jpg"),
(NULL,120,"依视路1.665钻晶A3",1526,DEFAULT,"../public/images/index/6fItemc4.jpg"),
(NULL,130,"蔡司 1.600A系列 A60 球面莲花膜",686,DEFAULT,"../public/images/index/6fItemd1.jpg"),
(NULL,130,"蔡司 1.600A系列 A60Plus 非球面莲花膜",896,DEFAULT,"../public/images/index/6fItemd2.jpg"),
(NULL,130,"蔡司 1.555清锐 非球面 钻立方银膜",896,DEFAULT,"../public/images/index/6fItemd3.jpg"),
(NULL,130,"蔡司 1.500成长乐 球面莲花膜",791,DEFAULT,"../public/images/index/6fItemd4.jpg"),
(NULL,140,"MODELE木系列手制系列/镜框采用精湛工艺，使用榫卯结构紧固，集手工设计美学于一体。",NULL,DEFAULT,"../public/images/index/7fItema1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItema1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItema2.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemb1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemb2.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemc1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemc2.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemd1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemd2.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fIteme1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fIteme2.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemf1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemf2.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemg1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemg2.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemh1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemh2.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemi1.jpg"),
(NULL,150,NULL,NULL,NULL,"../public/images/index/8fItemi2.jpg");



