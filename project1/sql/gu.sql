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
(NULL,"钻石切边",120)
/*商品A添加数据*/
/*商品B添加数据*/
/*用户列表添加数据*/