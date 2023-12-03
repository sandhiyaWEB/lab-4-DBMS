CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE IF NOT EXISTS supplier(
	SUPP_ID int primary key,
    SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL
    );

CREATE TABLE IF NOT EXISTS customer(
	CUS_ID int primary key,
    CUS_NAME varchar(20) NOT NULL,
    CUS_PHONE varchar(10) NOT NULL,
    CUS_CITY varchar(30) NOT NULL,
    CUS_GENDER char
    );
    
CREATE TABLE IF NOT EXISTS category(
	CAT_ID int primary key,
    CAT_NAME varchar(20) NOT NULL
    );

CREATE TABLE IF NOT EXISTS product(
	PRO_ID int primary key,
    PRO_NAME varchar(20) NOT NULL DEFAULT "Dummy",
    PRO_DESC varchar(60),
    CAT_ID int,
    foreign key (CAT_ID) references category(CAT_ID)
    );

CREATE TABLE IF NOT EXISTS supplier_pricing(
	PRICING_ID int primary key,
    PRO_ID int,
    SUPP_ID int,
    SUPP_PRICE int DEFAULT 0,
    foreign key (PRO_ID) references product(PRO_ID),
    foreign key (SUPP_ID) references supplier(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS orders(
	ORD_ID int primary key,
    ORD_AMOUNT int NOT NULL,
    ORD_DATE date NOT NULL,
    CUS_ID int,
    PRICING_ID int,
    foreign key (CUS_ID) references customer(CUS_ID),
    foreign key (PRICING_ID) references supplier_pricing(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating(
	RAT_ID int primary key,
    ORD_ID int,
    RAT_RATSTARS int not null,
    foreign key (ORD_ID) references orders(ORD_ID));