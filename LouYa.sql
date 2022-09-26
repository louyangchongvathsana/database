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
first_name varchar (300) not null,
last_name varchar (300) not null,
phone varchar (30) ,
email varchar (300) not null,
street varchar (300),
city varchar (50),
State varchar (30),
zip_code varchar (10),
);
create table sales.stores(
store_id int identity(1,1) primary key,
store_name varchar (300),
phone varchar (300),
email varchar (300) not null,
street varchar (300),
city varchar (50),
State varchar (30),
zip_code varchar (10),
);
create table sales.staffs(
staff_id int identity (1,1) primary key,
first_name varchar (300) not null,
last_name varchar (300) not null,
phone varchar (30) ,
email varchar (300) not null,
active int not null,
store_id int not null,
manager_id int,
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
discount decimal (4,2) not null,
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
select * from sales.items
select * from sales.orders
select * from sales.staffs
select * from sales.stores

insert into production.catogory
values (N'ຢາງລົດ')

select catogory_id'ລຳດັບ', catogory_name'ປະເພດສີນຄ້າ' from production.catogory
select brand_id'ລຳດັບ',brand_name'ຢີຫໍ່'from production.brands 
select product_id'ລະຫັດຜະລິດຕະພັນ',product_name'ຊື່ຜະລິດຕະພັນ'from production.product
select store_id'ລະຫັດຮ້ານ',product_id'ລະຫັດຜະລິດຕະພັນ',quantity'ປະລິມານ' from production.stocks
select customer_id'ລະຫັດລູກຄ້າ',first_name'ຊື່',last_name'ນາມສະກຸ່ນ',phone'ເບີໂທລະສັບ',email'ອີເມວ',street'ຖະໜົນ',city'ເມືອງ',State'ລັດ',zip_code'ລະຫັດໄປສະນີ' from sales.customer
select order_id'ລະຫັດບີນ',item_id'ລະຫັດລາຍການ',product_id'ລະຫັດຜະລິດຕະພັນ',quantity'ປະລິມາາ',list_price'ລາຄາ',discount'ສ່ວນຫຼຸດ' from sales.items
select order_id'ລະຫັດບີນ',customer_id'ລະຫັດລູກຄ້າ',order_status'ສະຖານະການສັ່ງ',order_date'ວັນທີ່ສັ່ງ',shipped_date'ວັນທີ່ຈັດສົ່ງ',store_id'ລະຫັດຮ້ານ',staff_id'ລະຫັດພະນັກງານ' from sales.orders
select staff_id'ລະຫັດພະນັກງານ',first_name'ຊື່',last_name'ນາມສະກຸ່ນ',phone'ເບີໂທ',email'ອີເມວ',active'ເຄື່ອນໄຫວ',manager_id'ລະຫັດຜູ້ຈັດການ' from sales.staffs
select store_id'ລະຫັດຮ້ານ',store_name'ຊື່ຮ້ານ',phone'ເບີໂທລະສັບ',email'ອີເມວ' from sales.stores