SET NAMES UTF8;
DROP DATABASE IF EXISTS gu;
CREATE DATABASE gu CHARSET=UTF8;
USE gu;
/*用户表*/
CREATE TABLE gu_user(
	uid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(20),
	tel VARCHAR(20) UNIQUE,
	email VARCHAR(32),
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
/*商品详情评论列表*/
CREATE TABLE gu_comment(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20) COMMENT "用户名",
	ctime DATETIME COMMENT "评论时间",
	content VARCHAR(140) COMMENT "评论内容",
	pid INT COMMENT "对应商品ID"
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
(NULL,10,"FB3013镜框",258,DEFAULT,"images/index/2fItema1.jpg"),
(NULL,10,"FG80102镜框",458,DEFAULT,"images/index/2fItema2.jpg"),
(NULL,10,"FB3017镜框",258,DEFAULT,"images/index/2fItema3.jpg"),
(NULL,10,"FG6109镜框",358,DEFAULT,"images/index/2fItema4.jpg"),
(NULL,10,"FB0064镜框",258,DEFAULT,"images/index/2fItema5.jpg"),
(NULL,10,"FG80056镜框",458,DEFAULT,"images/index/2fItema6.jpg"),
(NULL,20,"亿超通用太阳镜YC9606",239,DEFAULT,"images/index/2fItemb1.jpg"),
(NULL,20,"亿超通用太阳镜YC9602",239,DEFAULT,"images/index/2fItemb2.jpg"),
(NULL,20,"亿超通用太阳镜YC21804",499,DEFAULT,"images/index/2fItemb3.jpg"),
(NULL,20,"亿超通用太阳镜YC9601",239,DEFAULT,"images/index/2fItemb4.jpg"),
(NULL,20,"亿超通用太阳镜YC9605",239,DEFAULT,"images/index/2fItemb5.jpg"),
(NULL,20,"亿超通用太阳镜YC21803",499,DEFAULT,"images/index/2fItemb6.jpg"),
(NULL,30,"亿超运动眼镜SP0856",168,DEFAULT,"images/index/2fItemc1.jpg"),
(NULL,30,"运动眼镜SP0862",168,DEFAULT,"images/index/2fItemc2.jpg"),
(NULL,30,"亿超眼镜SP0866",168,DEFAULT,"images/index/2fItemc3.jpg"),
(NULL,30,"运动骑车镜0091",168,DEFAULT,"images/index/2fItemc4.jpg"),
(NULL,30,"运动眼镜G103",138,DEFAULT,"images/index/2fItemc5.jpg"),
(NULL,30,"亿超近视游泳眼镜js2018",90,DEFAULT,"images/index/2fItemc6.jpg"),
(NULL,40,"亿超通用太阳镜YC9606",239,DEFAULT,"images/index/2fItemb1.jpg"),
(NULL,40,"亿超通用太阳镜YC9602",239,DEFAULT,"images/index/2fItemb2.jpg"),
(NULL,40,"亿超通用太阳镜YC21804",499,DEFAULT,"images/index/2fItemb3.jpg"),
(NULL,40,"亿超通用太阳镜YC9601",239,DEFAULT,"images/index/2fItemb4.jpg"),
(NULL,40,"亿超通用太阳镜YC9605",239,DEFAULT,"images/index/2fItemb5.jpg"),
(NULL,40,"亿超通用太阳镜YC21803",499,DEFAULT,"images/index/2fItemb6.jpg"),
(NULL,50,"亿超眼镜框FB6135",258,DEFAULT,"images/index/4fItema1.jpg"),
(NULL,50,"亿超眼镜框FB0045",258,DEFAULT,"images/index/4fItema2.jpg"),
(NULL,50,"亿超眼镜框FB5078",258,DEFAULT,"images/index/4fItema3.jpg"),
(NULL,50,"竹川木野眼镜框Z3633",458,DEFAULT,"images/index/4fItema4.jpg"),
(NULL,50,"竹川木野眼镜框Z3668",458,DEFAULT,"images/index/4fItema5.jpg"),
(NULL,50,"竹川木野眼镜框Z1630",258,DEFAULT,"images/index/4fItema6.jpg"),
(NULL,60,"亿超眼镜框FB0066",258,DEFAULT,"images/index/4fItemb1.jpg"),
(NULL,60,"亿超眼镜框FB0054",258,DEFAULT,"images/index/4fItemb2.jpg"),
(NULL,60,"亿超眼镜框FB0011",258,DEFAULT,"images/index/4fItemb3.jpg"),
(NULL,60,"亿超眼镜框FB0027",258,DEFAULT,"images/index/4fItemb4.jpg"),
(NULL,60,"亿超眼镜框FB0008",258,DEFAULT,"images/index/4fItemb5.jpg"),
(NULL,60,"亿超眼镜框FB0006",258,DEFAULT,"images/index/4fItemb6.jpg"),
(NULL,70,"亿超眼镜框FG6002",168,DEFAULT,"images/index/4fItemc1.jpg"),
(NULL,70,"亿超眼镜框FG80101",458,DEFAULT,"images/index/4fItemc2.jpg"),
(NULL,70,"亿超眼镜框FB6166",358,DEFAULT,"images/index/4fItemc3.jpg"),
(NULL,70,"亿超眼镜框FG80104",458,DEFAULT,"images/index/4fItemc4.jpg"),
(NULL,70,"亿超眼镜框FG80037",458,DEFAULT,"images/index/4fItemc5.jpg"),
(NULL,70,"亿超1106女士眼镜框",168,DEFAULT,"images/index/4fItemc6.jpg"),
(NULL,80,"博士伦水灵焕彩年抛1片隐形眼镜",98,DEFAULT,"images/index/5fItema1.jpg"),
(NULL,80,"强生美瞳艾姗珍珠黑美瞳日抛5片装",58,DEFAULT,"images/index/5fItema2.jpg"),
(NULL,80,"海昌星眸日抛20片装",140,DEFAULT,"images/index/5fItema3.jpg"),
(NULL,80,"海润丽美瞳黑色半年抛1片装彩色隐形眼镜",52,DEFAULT,"images/index/5fItema4.jpg"),
(NULL,80,"海昌润丽美瞳棕色半年抛1片装隐形眼镜",52,DEFAULT,"images/index/5fItema5.jpg"),
(NULL,80,"博伦清朗半年抛2片隐形眼镜",75,DEFAULT,"images/index/5fItema6.jpg"),
(NULL,90,"卫康新视多功能软性接触镜保养液125ML",12,DEFAULT,"images/index/5fItemb1.jpg"),
(NULL,90,"卫康清凉型隐形眼镜护理液500125ML护理液",29,DEFAULT,"images/index/5fItemb2.jpg"),
(NULL,90,"卫康清凉型护理液125ml",12,DEFAULT,"images/index/5fItemb3.jpg"),
(NULL,90,"博士伦润明除蛋白隐形眼镜护理液355ML护理液",35,DEFAULT,"images/index/5fItemb4.jpg"),
(NULL,90,"博士伦润明新概念润眼液8ml",20,DEFAULT,"images/index/5fItemb5.jpg"),
(NULL,100,"亿超全效蓝光防护系列/MR-8材质坚韧安全、全防紫外线、过滤有害蓝光、镜片无底色，清晰透亮。",NULL,DEFAULT,"images/index/6fItema1.jpg"),
(NULL,100,"专为预防青少年近视加深研制/眼轴拉伸是青少年近视加深的一大元凶。阳关少年系列镜片，采用双面复合环焦技术，周边成像与视网膜，减少眼轴变化。",NULL,DEFAULT,"images/index/6fItema2.jpg"),
(NULL,100,"智能感光，迅速变色，一镜两用/亿超变色镜片凭借“感光强，变色快”的原理和“膜层技术”，减少紫外线对眼睛的伤害视野更清晰。多效",NULL,DEFAULT,"images/index/6fItema3.jpg"),
(NULL,110,"亿超1.601MR8非球面超耐磨近视眼镜片",199,DEFAULT,"images/index/6fItemb1.jpg"),
(NULL,110,"亿超1.553防雾防蓝光非球面镜片",480,DEFAULT,"images/index/6fItemb2.jpg"),
(NULL,110,"亿超1.552阳光少年高清绿膜镜片",480,DEFAULT,"images/index/6fItemb3.jpg"),
(NULL,110,"亿超高定1.665超薄非球面双效防护树脂片",780,DEFAULT,"images/index/6fItemb4.jpg"),
(NULL,120,"依视路1.601特薄钻晶A3",756,DEFAULT,"images/index/6fItemc1.jpg"),
(NULL,120,"依视路1.591变灰色片",1666,DEFAULT,"images/index/6fItemc2.jpg"),
(NULL,120,"依视路超薄1.552双效防护",468,DEFAULT,"images/index/6fItemc3.jpg"),
(NULL,120,"依视路1.665钻晶A3",1526,DEFAULT,"images/index/6fItemc4.jpg"),
(NULL,130,"蔡司 1.600A系列 A60 球面莲花膜",686,DEFAULT,"images/index/6fItemd1.jpg"),
(NULL,130,"蔡司 1.600A系列 A60Plus 非球面莲花膜",896,DEFAULT,"images/index/6fItemd2.jpg"),
(NULL,130,"蔡司 1.555清锐 非球面 钻立方银膜",896,DEFAULT,"images/index/6fItemd3.jpg"),
(NULL,130,"蔡司 1.500成长乐 球面莲花膜",791,DEFAULT,"images/index/6fItemd4.jpg"),
(NULL,140,"MODELE木系列手制系列/镜框采用精湛工艺，使用榫卯结构紧固，集手工设计美学于一体。",NULL,DEFAULT,"images/index/7fItema1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItema1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItema2.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemb1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemb2.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemc1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemc2.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemd1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemd2.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fIteme1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fIteme2.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemf1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemf2.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemg1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemg2.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemh1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemh2.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemi1.jpg"),
(NULL,150,NULL,NULL,NULL,"images/index/8fItemi2.jpg");
/*商品详情评论列表添加数据*/
INSERT INTO gu_comment VALUES
(null,"aa",now(),"这款眼镜还不错，戴上去很引人注目，镜框颜色很红，刚开始不适应，但是梳妆打扮一下，戴上去很知性，很年轻，我挺喜欢的。镜腿是金色的我感觉比较好看，刚开始以为会重呢，咨询客服要不要换折射率高一点的镜片，她说我度数不高，标配镜片可以的，当时感觉没有推销买贵的，挺好的，总之很满意",1),
(null,"bb",now(),"这个眼镜还不错，款式比较喜欢，戴上去也舒服，包装挺用心的",1),
(null,"aa",now(),"眼镜框很潮，佐川藤井的眼镜框我都比较喜欢，感觉很酷很潮，也比较好搭衣服，主要是显年轻啊哈哈。镜框镜片都喜欢，下次再来购买。",1),
(null,"aa",now(),"大红色眼镜框真的很显眼啊，戴上去好看是好看，但是我总感觉有点显眼，老公说很好看，比之前的黑框眼镜好太多了。可能我一下子不习惯吧。几个邻居也说红色眼镜显年轻，挺不错的。这个款式挺潮的，我好像有点装嫩了啊哈哈哈哈哈哈。总体还挺满意的，中年人也应该多尝试一些新鲜东西。",1),
(null,"cc",now(),"物流挺快的，前天晚上就到了，只不过我最近比较忙，加班比较晚，每次回去小区物业都关门了，今天早上特地去取得，去过之后发现包装挺好的，拆开眼镜就戴上了，一路上也没发现不舒服呢，就是有点好清楚的感觉，可能之前的眼镜片磨花了，这个镜片好干净，很喜欢，下次再来",1),
(null,"aa",now(),"眼镜是我想要的款，今年大热流行的圆框，戴上立马就民国范了，这个眼镜脸大脸小都能戴，而且我个人认为算是比较轻的，眼镜度数和瞳距也很准，我就是按照我目前戴的眼镜度数来的，戴上这个一点感觉不出来差别，之前戴的就是佐川藤井，都两年多了。还有客服非常有耐心，还会和我打电话确定底数，也很细心。眼镜的质量也特别好，很喜欢，如果有下次肯定还会再来。",1),
(null,"ee",now(),"本来还担心快放假了，到货比较晚呢，没想到昨天早上才下订单配镜，今天中午眼镜就完好无损到手。而且发的顺丰快递，想不到的神速!另外这副佐川藤井的眼镜架货真价实、材质优良、制作精美、设计高端大气，与描述完全相符;戴上后贴切舒适、清澈明亮，非常满意!还有客服服务耐心、细致、热情、周到、负责，还送了很适用的附件、小工具和精美礼品!很贴心，很满意，会再次过来的，是很满意的一次网购配镜过程。",1),
(null,"dd",now(),"这款圆框眼镜虽然比较常见，但是眼镜框架和腿中间那里有点设计感，感觉比较不一样，这种添加金属的设计比较吸引我。我是去眼镜店验光了再来网上配镜的，后来才发现原来也可以上门验光，以前从来没有听说过，早知道就预约了，比较省事。不过眼镜最后收到了，度数很准确，而且眼镜也很好看，不出意外。这个大红色的镜框也非常衬托肤色，很喜欢。",1),
(null,"aa",now(),"好看，超好看，特意去配了镜片带了好几天才来评价",1),
(null,"aa",now(),"我没有近视，单纯就是买来装饰用的，佐川藤井的眼镜我觉得每一副都很适合装饰，非常的复古‘文艺。这副眼镜到手感觉眼镜很好看，我选择的是玳瑁色，这个颜色配上这个款式很适合瓜子脸的女生，跟专卖店卖的那种五百块钱的眼镜简直一样，甚至还有超过的势头。这副眼镜质量也很好，做工很细，包装也很漂亮，卖家很贴心还送了小礼物，眼镜戴着拍照也蛮不错，瞬间觉得自己变得淑女范了，棒棒哒，给卖家一个好评，希望亿超眼镜生意红红火火，店铺生意越来，只要东西好，不怕没人买，下次还会再来。",1),
(null,"aa",now(),"太喜欢了，非常开心的一次购物购物",1),
(null,"ga",now(),"不错！看起来质量很好，戴起来也很舒适，品牌的东西值得信赖！",1),
(null,"aa",now(),"眼镜很喜欢，不错",1),
(null,"ff",now(),"眼镜包装很好，下次约上门呵呵呵",1),
(null,"aa",now(),"第三副了，性价比很高，戴着舒服，度数很准，款式好看，很喜欢",1),
(null,"aa",now(),"红色的眼镜太有个性了，好喜欢",1),
(null,"qweqwa",now(),"红色没有我想象的艳丽，不夸张，很好看",1),
(null,"fewf",now(),"镜架很轻，很软，但是去配眼镜是，老板说东西挺好，说是什么材料的，质量挺好。佩戴也很舒服！好评！",1),
(null,"aa",now(),"红色特别抢眼，一开始还觉得买错了，因为实在是太夸张了，我真有点接受不了，不过后来放了一段时间再拿出来看，居然好看很多！好像真的会有这样的情况啊，一样东西放久了，过段时间拿出来在看就会觉得很好看。挺喜欢的款式，这个一直都是，就是在颜色上纠结了。不说废话了，眼镜框质量很好，很复古很中性。戴上去不会觉得很重，客服态度很好，眼镜很快就发货了，到我手上 不超过三天，速度很快，希望亿超生意兴隆，到时候给我多打点折，哈哈哈",1),
(null,"aa",now(),"老客户了，东西好才会一直来光顾的。戴上很舒服，眼镜做工精致，样式大方得体，很是喜欢，以后还会继续支持的",1),
(null,"a213",now(),"客服态度超级好，居然可以忍受我这种选择困难症户！哈哈哈眼镜收到超级喜欢哦，虽然朋友说还看不习惯，时间久了就行了！真的很不错",1),
(null,"21315",now(),"眼镜款式真的很好，由于红色眼镜不太适合我，沟通店家换了一个，商家很快给我换了，还赠送了小饰品。谢谢了
",1),
(null,"aa",now(),"颜色太艳了好像，可能我平时比较喜欢浅色，我妹妹帮我拍的，懒得换，感觉还行",1),
(null,"aa",now(),"包装很严实漂亮，发货速度也快。很轻，不压鼻子！办公室各种脸型，试戴都很搭配。几乎不挑脸型。",1),
(null,"fdgd",now(),"大红色挺喜欢，刚开始担心hold不住，不过还好，搭配好很有范",1),
(null,"aa",now(),"眼镜挺不错的，颜色非常抢眼，朋友说我变自信了哈哈哈",1);

/*****************用户******************/
INSERT INTO gu_user VALUES
(null,"abcdefg",15121213165,"w4e6q@qwu.com",md5(123456),"hausidhusad"),
(null,"123g",1511223165,"w123125@r.com",md5(123456),"hausidhusad"),
(null,"a1232g",187121213165,"iuo@sda.com",md5(123456),"hausidhusad");