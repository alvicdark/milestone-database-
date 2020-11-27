CREATE DATABASE milestone;
use milestone;
CREATE TABLE users(userid int AUTO_INCREMENT PRIMARY KEY not null,created_on timestamp,username varchar(255) not null UNIQUE,email varchar(255),password varchar(255) not null,user_type varchar(255));
CREATE TABLE categories(category_id int AUTO_INCREMENT PRIMARY KEY not null,category varchar(255) not null UNIQUE,order_column int);
CREATE TABLE products(productid int AUTO_INCREMENT PRIMARY KEY,name varchar(255),description varchar(255),image BLOB,price int,category_id int not null,FOREIGN KEY (category_id) REFERENCES categories(category_id),featured bit not null);
CREATE table promotions(id int AUTO_INCREMENT PRIMARY KEY,name varchar(255)not null,description varchar(255) not null,start_date date not null,end_date date not null,created_on timestamp,saleprice int,discount_amount int,zipcode varchar(255),promotion_type varchar(500));
create table carts(cart_id int AUTO_INCREMENT PRIMARY key,status varchar(255)not null,created_on timestamp,user_id int not null,FOREIGN KEY (user_id) REFERENCES users(userid),zip_code varchar(255) not null);
create table cartproducts( cartproducts_id int AUTO_INCREMENT PRIMARY key not null,cart_id int not null, FOREIGN key (cart_id) REFERENCES carts(cart_id),productid int not null,FOREIGN key (productid) REFERENCES products(productid),quantity int);
create table cart_promotions(cart_promotions_id int AUTO_INCREMENT PRIMARY key,promotion_id int not null,FOREIGN key (promotion_id) REFERENCES promotions(id),productid int not null,FOREIGN key (productid) REFERENCES products(productid));