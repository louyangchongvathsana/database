create schema production;
go
create schema sales;
go
create table production.catogory(
catogory_id int identity(1,1) primary key,
catogory_name nvarchar (300) not null,
);
create table production.brands(
brand_id int identity(1,1) primary key,
brand_name nvarchar (300) not null,
);
create table production.product(
product_id int identity(1,1) primary key,
product_name nvarchar (300) not null,
brand_id int not null,
catogory_id int not null,
model_year smallint not null,
list_price decimal(10,2)not null,
foreign key (catogory_id) references production.catogory (catogory_id) on delete cascade on update cascade,
foreign key (brand_id) references production.Brands (brand_id) on delete cascade on update cascade

);
create table sales.customer(
customer_id int identity (1,1) primary key,
first_name nvarchar (300) not null,
last_name nvarchar (300) not null,
phone varchar (30) ,
email varchar (300) not null,
street nvarchar (300),
city nvarchar (50),
State nvarchar (30),
zip_code varchar (10),
);
create table sales.stores(
store_id int identity(1,1) primary key,
store_name nvarchar (300),
phone varchar (300),
email varchar (300) not null,
street nvarchar (300),
city nvarchar (50),
State nvarchar (30),
zip_code varchar (10),
);
create table sales.staffs(
staff_id int identity (1,1) primary key,
first_name nvarchar (300) not null,
last_name nvarchar (300) not null,
phone varchar (30) ,
email varchar (300) not null,
active int not null,
store_id int not null,
Manager_id int,
foreign key (store_id) references sales.stores (store_id) on delete cascade on update cascade,
FOREIGN KEY (Manager_id) REFERENCES Sales.Staffs (Staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
);
create table sales.orders(
order_id int identity (1,1) primary key,
customer_id int,
order_status tinyint not null,
order_date date not null,
required_date date not null,
shipped_date date,
store_id int not null,
staff_id int not null,
foreign key (customer_id) references sales.customer (customer_id) on delete cascade on update cascade,
foreign key (store_id) references sales.stores (store_id) on delete cascade on update cascade,
FOREIGN KEY (Staff_id) REFERENCES Sales.Staffs (Staff_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
);
create table sales.items(
order_id int,
item_id int,
product_id int not null,
quantity int not null,
list_price decimal (10,2) not null,
discount decimal (4,2) NOT NULL DEFAULT 0,
primary key (order_id, item_id),
foreign key (order_id) references sales.orders (order_id) on delete cascade on update cascade,
foreign key (product_id) references production.product (product_id) on delete cascade on update cascade
);
create table production.stocks(
store_id int ,
product_id int ,
quantity int ,
foreign key (store_id) references sales.stores (store_id) on delete cascade on update cascade,
foreign key (product_id) references production.product (product_id) on delete cascade on update cascade
);


select * from production.brands
select * from production.stocks
select * from production.catogory
select * from production.product
select * from sales.customer
select * from sales.orders
select * from sales.items
select * from sales.staffs
select * from sales.stores

insert into production.catogory
values (N'ຢາງລໍ້')
insert into production.catogory
values (N'ລໍ້')
insert into production.brands
values (N'TOYOTA')

insert into sales.customer
values (N'de','la','02059988220','AA@mail.com','13','xaysettha','single','4444442220')
insert into sales.customer
values (N'vang','da','02059988221','BB@mail.com','13','xaysettha','single','4444442221')
insert into sales.customer
values (N'khone','thor','02059988222','CCC@mail.com','13','xaysettha','single','4444442222')
insert into sales.customer
values (N'meng','lee','02059988223','DDD@mail.com','13','xaysettha','single','4444442223')
insert into sales.customer
values (N'thip','da','02059988224','EEE@mail.com','13','xaysettha','single','4444442224')
insert into sales.customer
values (N'Aan','da','02059988225','FFF@mail.com','13','xaysettha','single','4444442225')
insert into sales.customer
values (N'nu','lee','02059988226','GGG@mail.com','13','xaysettha','single','4444442226')
insert into sales.customer
values (N'kong','meng','02059988227','HHH@mail.com','13','xaysettha','single','4444442227')
insert into sales.customer
values (N'le','laa','02059988228','III@mail.com','13','xaysettha','single','4444442228')
insert into sales.customer
values (N'lee','thor','02059988229','KKK@mail.com','13','xaysettha','single','4444442229')

insert into sales.stores
values (N'olla','020 93647351','SSS@gmail.com','13','xaysettha','single','22333')
insert into sales.stores
values (N'dekham','020 93647352','ABC@gmail.com','13','xaysettha','single','3344')
insert into sales.stores
values (N'khone','020 93647353','LLL@gmail.com','13','xaysettha','single','3345')
insert into sales.stores
values (N'alex','020 93647354','KKK@gmail.com','13','xaysettha','single','1125')
insert into sales.stores
values (N'anu','020 93647355','PPP@gmail.com','13','xaysettha','single','9987')

insert into sales.staffs
values (N'de','lee','02029988330','AAA@Gmail.com','1','1','1')
insert into sales.staffs
values (N'da','la','02029988331','BBB@Gmail.com',' 2','2','2')
insert into sales.staffs
values (N'sy','da','02029988332','CCC@Gmail.com',' 3','3','1')
insert into sales.staffs
values (N'mang','lee','02029988333','DDD@Gmail.com',' 4','4','2')
insert into sales.staffs
values (N'khone','sy','02029988334','EEE@Gmail.com',' 5','2','1')
insert into sales.staffs
values (N'lee','noy','02029988335','FFF@Gmail.com',' 4','3','2')
insert into sales.staffs
values (N'boun','ma','02029988336','GGG@Gmail.com',' 3','4','1')
insert into sales.staffs
values (N'van','yang','02029988337','HHH@Gmail.com',' 2','3','2')
insert into sales.staffs
values (N'tou','lee','02029988338','III@Gmail.com',' 1','2','1')
insert into sales.staffs
values (N'sey','lee','02029988339','JJJ@Gmail.com',' 2','1','2')

insert into sales.orders
values (N'1','24','2022-10-05','2022-10-05','2022-10-05','3','2')
insert into sales.orders
values (N'2','24','2022-10-05','2022-10-05','2022-10-05','2','1')
insert into sales.orders
values (N'3','24','2022-10-05','2022-10-05','2022-10-05','5','2')
insert into sales.orders
values (N'4','24','2022-10-05','2022-10-05','2022-10-05','4','3')
insert into sales.orders
values (N'5','24','2022-10-05','2022-10-05','2022-10-05','3','2')
insert into sales.orders
values (N'6','24','2022-10-05','2022-10-05','2022-10-05','2','1')
insert into sales.orders
values (N'7','24','2022-10-05','2022-10-05','2022-10-05','5','2')
insert into sales.orders
values (N'8','24','2022-10-05','2022-10-05','2022-10-05','1','5')
insert into sales.orders
values (N'9','24','2022-10-05','2022-10-05','2022-10-05','3','1')
insert into sales.orders
values (N'8','24','2022-10-05','2022-10-05','2022-10-05','2','2')
insert into sales.orders
values (N'7','24','2022-10-05','2022-10-05','2022-10-05','3','8')
insert into sales.orders
values (N'6','24','2022-10-05','2022-10-05','2022-10-05','3','7')
insert into sales.orders
values (N'5','24','2022-10-05','2022-10-05','2022-10-05','1','9')
insert into sales.orders
values (N'4','24','2022-10-05','2022-10-05','2022-10-05','3','2')
insert into sales.orders
values (N'3','24','2022-10-06','2022-10-06','2022-10-06','5','5')
insert into sales.orders
values (N'2','24','2022-10-06','2022-10-06','2022-10-06','2','6')
insert into sales.orders
values (N'1','24','2022-10-06','2022-10-06','2022-10-06','3','2')
insert into sales.orders
values (N'2','24','2022-10-06','2022-10-06','2022-10-06','1','6')
insert into sales.orders
values (N'3','24','2022-10-06','2022-10-06','2022-10-06','2','4')
insert into sales.orders
values (N'4','24','2022-10-06','2022-10-06','2022-10-06','3','7')

insert into sales.items
values (N'31','1','1','2000','30000','0.00')
insert into sales.items
values (N'12','1','1','3000','20000','0.00')
insert into sales.items
values (N'13','1','1','2000','10000','0.00')
insert into sales.items
values (N'14','1','1','5000','40000','0.00')
insert into sales.items
values (N'15','1','1','6000','50000','0.00')
insert into sales.items
values (N'16','1','1','7000','60000','0.00')
insert into sales.items
values (N'17','1','1','3000','30000','0.00')
insert into sales.items
values (N'18','1','1','2000','20000','0.00')
insert into sales.items
values (N'19','1','1','4000','50000','0.00')
insert into sales.items
values (N'20','1','1','2000','20000','0.00')
insert into sales.items
values (N'21','1','1','3000','30000','0.00')
insert into sales.items
values (N'22','1','1','2000','10000','0.00')
insert into sales.items
values (N'23','1','1','5000','60000','0.00')
insert into sales.items
values (N'24','1','1','6000','80000','0.00')
insert into sales.items
values (N'25','1','1','2000','20000','0.00')
insert into sales.items
values (N'26','1','1','1000','40000','0.00')
insert into sales.items
values (N'27','1','1','5000','70000','0.00')
insert into sales.items
values (N'28','1','1','6000','80000','0.00')
insert into sales.items
values (N'29','1','1','2000','20000','0.00')

insert into production.stocks
values ('1','1','2000')
insert into production.stocks
values ('2','1','2000')
insert into production.stocks
values ('3','1','2000')
insert into production.stocks
values ('4','1','2000')
insert into production.stocks
values ('5','1','2000')
insert into production.stocks
values ('5','1','2000')
insert into production.stocks
values ('4','1','2000')
insert into production.stocks
values ('3','1','2000')
insert into production.stocks
values ('2','1','2000')
insert into production.stocks
values ('1','1','2000')
insert into production.stocks
values ('2','1','2000')
insert into production.stocks
values ('2','1','2000')
insert into production.stocks
values ('3','1','2000')
insert into production.stocks
values ('4','1','2000')
insert into production.stocks
values ('5','1','2000')
insert into production.stocks
values ('2','1','2000')
insert into production.stocks
values ('3','1','2000')
insert into production.stocks
values ('4','1','2000')
insert into production.stocks
values ('3','1','2000')
insert into production.stocks
values ('2','1','2000')


insert into production.product (product_name,brand_id,catogory_id,model_year,list_price)
values (N'yang lor nar',1,2,2022,78.33)

select catogory_id'ລຳດັບ', catogory_name'ປະເພດສີນຄ້າ' from production.catogory
select brand_id'ລຳດັບ',brand_name'ຢີຫໍ່'from production.brands 
select product_id'ລະຫັດຜະລິດຕະພັນ',product_name'ຊື່ຜະລິດຕະພັນ'from production.product
select store_id'ລະຫັດຮ້ານ',product_id'ລະຫັດຜະລິດຕະພັນ',quantity'ປະລິມານ' from production.stocks
select customer_id'ລະຫັດລູກຄ້າ',first_name'ຊື່',last_name'ນາມສະກຸ່ນ',phone'ເບີໂທລະສັບ',email'ອີເມວ',street'ຖະໜົນ',city'ເມືອງ',State'ລັດ',zip_code'ລະຫັດໄປສະນີ' from sales.customer
select order_id'ລະຫັດບີນ',item_id'ລະຫັດລາຍການ',product_id'ລະຫັດຜະລິດຕະພັນ',quantity'ປະລິມາາ',list_price'ລາຄາ',discount'ສ່ວນຫຼຸດ' from sales.items
select order_id'ລະຫັດບີນ',customer_id'ລະຫັດລູກຄ້າ',order_status'ສະຖານະການສັ່ງ',order_date'ວັນທີ່ສັ່ງ',shipped_date'ວັນທີ່ຈັດສົ່ງ',store_id'ລະຫັດຮ້ານ',staff_id'ລະຫັດພະນັກງານ' from sales.orders
select staff_id'ລະຫັດພະນັກງານ',first_name'ຊື່',last_name'ນາມສະກຸ່ນ',phone'ເບີໂທ',email'ອີເມວ',active'ເຄື່ອນໄຫວ',manager_id'ລະຫັດຜູ້ຈັດການ' from sales.staffs
select store_id'ລະຫັດຮ້ານ',store_name'ຊື່ຮ້ານ',phone'ເບີໂທລະສັບ',email'ອີເມວ' from sales.stores

select product_name,brand_name,catogory_name,model_year,list_price from production.product,production.brands,production.catogory
where production.brands.brand_id = 1 and production.catogory.catogory_id=1

select customer_id,product_name,brand_name,catogory_name,order_status,order_date,required_date,shipped_date,store_name,staff_id from sales.orders,production.product,production.brands,production.catogory,sales.stores
where production.brands.brand_id = 1 and production.catogory.catogory_id=1


