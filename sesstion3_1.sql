 
create database quanlydonhang1;
use quanlydonhang1;

create table category(
id int primary key auto_increment,
name varchar(50) not null unique,
ststus tinyint(1) default(1)
);

insert into category(name)values('ao');
insert into category(name)values('quan');
insert into category(name)values('nhan');
insert into category(name)values('dong ho');
insert into category(name)values('quankaki');


create table product(
id int primary key auto_increment,
name varchar(200) not null,
category_id int not null,
foreign key(category_id) references category(id),
price float check(price>0),
sale_price float,
constraint check(sale_price < price)
);

insert into product(name,category_id,price,sale_price)values('san pham 1',1,'20000','18000');
insert into product(name,category_id,price,sale_price)values('san pham 2',3,'22000','19000');
insert into product(name,category_id,price,sale_price)values('san pham 3',4,'15000','10000');
insert into product(name,category_id,price,sale_price)values('san pham 4',3,'22000','17000');
insert into product(name,category_id,price,sale_price)values('san pham 5',5,'20000','15000');


create table customer(
id int primary key auto_increment,
name varchar(100) not null unique ,
email varchar(100) not null unique,
birthday date,
gender tinyint(1)
);

insert into customer(name,email ,birthday,gender)values('nguyen van a','nguyena@gmail.com','2001-05-10',1);
insert into customer(name,email ,birthday,gender)values('nguyen van b','nguyenb@gmail.com','2002-01-29',0);
insert into customer(name,email ,birthday,gender)values('nguyen van c','nguyenc@gmail.com','2003-03-22',0);
insert into customer(name,email ,birthday,gender)values('nguyen van d','nguyend@gmail.com','2004-05-22',0);
insert into customer(name,email ,birthday,gender)values('nguyen van e','nguyene@gmail.com','2005-02-12',1);


create table orders(
id int primary key auto_increment,
customer_id int not null,
foreign key(customer_id)references customer(id),
created date default(current_date),
status bit default(1)
);
alter table orders add column status bit(1) default(1);

insert into orders (customer_id)values(1);
insert into orders (customer_id)values(2);
insert into orders (customer_id)values(3);
insert into orders (customer_id)values(4);
insert into orders (customer_id)values(5);
alter table orders add column( 
node text);


create table order_detail(
orders_id int not null,
foreign key(orders_id)references orders(id),
product_id int not null,
foreign key(product_id)references product(id),
quantity int,
price float
);

insert into order_detail(orders_id,product_id,quantity,price)values(2,3,11,20000);
insert into order_detail(orders_id,product_id,quantity,price)values(2,4,17,30000);
insert into order_detail(orders_id,product_id,quantity,price)values(1,3,16,40000);
insert into order_detail(orders_id,product_id,quantity,price)values(3,3,15,50000);
insert into order_detail(orders_id,product_id,quantity,price)values(4,3,13,60000);



use quanlydonhang1;


select o.id,c.name as 'ten nguoi dat',o.created as 'ngay dat',o.status as 'trang thai'
from orders o 
join customer c
on o.customer_id=c.id;


select o.orders_id, p.name as 'ten san pham', o.quantity,o.price,(o.price*o.quantity)as total_price
from order_detail o
join product p
on  o.product_id=p.id where orders_id=2;






select * from category where ststus=1;

select * from product;

select * from product where sale_price;

select id,name,price,(1-sale_price/price)*100 as percent_price from product;


update product
set price=200000 where id=1;

delete from product where id=1;
