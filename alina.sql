create database beauty_salon_db; /*Создание базы данных салона красоты Медведевой Алины*/
use beauty_salon_db;

create table staffssss /*Сотрудники*/ 
(
idstaff int not null primary key auto_increment,
`name` varchar(100) not null,
post  char(100) not null,
`rank` char(100) not null,     
factor_of_utility float not null default 1,
work_schedule timestamp not null,
id_service int not null     
   
);

create table beauty_salonssss /*Салон красоты*/
(
idbeauty_salon int not null,
title char(100) not null,
`name` char(200) not null,
work_schedule timestamp not null,
location char(200) not null,
phone varchar(16) not null,
id_staff int not null      

);

create table monthly_expenses /*Ежемесячные расходы*/
(
idmonthly_expenses int not null primary key auto_increment,
titTTle char(100) not null,    /*rename*/
expenses float not null

);

create table customers /*Клиенты*/
(
idcustomers int not null primary key auto_increment,
email char(100) not null,
phone varchar(16) not null

);

create table services /*Услуги*/
(
idservices int not null primary key auto_increment,
title char(100) not null,
`description` text not null,
cost float not null

);

create table discount_promotions /*Скидочные акции*/
(
iddiscount_promotions int not null,
title char(100) not null,
`condition` text not null,
time_of_action timestamp not null

);

create table customers_to_staff /*Запись клиентов*/
(
idcustomers_to_staff int not null primary key auto_increment,
id_staff int not null,
id_customer int not null,
id_service int not null,
total_cost float not null,
appointment_time datetime not null,
id_discount_promotions int, 

foreign key (id_staff) references staffssss (idstaff),
foreign key (id_customer) references customers (idcustomers),
foreign key (id_service) references services (idservices)
);

/*/////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*/////////////////////////////////////////////// ИЗМЕНЕНИЕ ///////////////////////////////////////////////*/
/*/////////////////////////////////////////////////////////////////////////////////////////////////////////*/
alter table staffssss
drop column `rank`,
add column salary float not null,
add foreign key (id_service) references services (idservices);

alter table beauty_salonssss
drop column `name`,
add column email char(100) not null,
add foreign key (id_staff) references staffssss (idstaff),
change column idbeauty_salon idbeauty_salon int not null primary key auto_increment;

alter table customers
add column `name` varchar(100) not null;

alter table discount_promotions
change column iddiscount_promotions iddiscount_promotions int not null primary key auto_increment;

alter table customers_to_staff 
add foreign key (id_discount_promotions) references discount_promotions (iddiscount_promotions);

rename table staffssss to staff;
rename table beauty_salonssss to beauty_salon;

alter table monthly_expenses
rename column titTTle to title;

alter table beauty_salon
drop foreign key beauty_salon_ibfk_1,
drop column id_staff,
drop column work_schedule,
add column work_schedule_from time not null,
add column work_schedule_to time not null;

alter table staff
drop foreign key staff_ibfk_1,
drop column id_service,
drop column work_schedule,
add column number_of_working_days int not null,
add column date_of_admission datetime not null,
add column date_of_dismissal datetime,
add column work_schedule_to time not null,
add column work_schedule_from time not null;

alter table monthly_expenses
add column `description` text;

alter table customers_to_staff
drop column total_cost;

alter table customers
add column date_of_joining date not null;

alter table discount_promotions
drop column time_of_action,
add column discount_amount float not null,
add column time_of_action_from datetime,
add column time_of_action_to datetime;

create table staff_to_beauty_salon
(
  idbeauty_salon int not null,
  idstaff int not null,
  
  primary key (idbeauty_salon, idstaff),
  foreign key (idbeauty_salon) references beauty_salon(idbeauty_salon),
  foreign key  (idstaff) references staff (idstaff)
);

create table beauty_salon_to_expenses
(
  idmonthly_expense int not null,
  idbeauty_salon int not null,
  
  primary key (idmonthly_expense, idbeauty_salon),
  foreign key (idmonthly_expense) references monthly_expenses(idmonthly_expenses),
  foreign key (idbeauty_salon) references beauty_salon(idbeauty_salon)
);

create table staff_to_services
(
  id_staff int not null,
  id_service int not null,
  
  primary key (id_staff, id_service),
  foreign key (id_staff) references staff(idstaff),
  foreign key  (id_service) references services (idservices)
);
/*/////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*/////////////////////////////////////////////// ДОБАВЛЕНИЕ ДАННЫХ ///////////////////////////////////////*/
/*/////////////////////////////////////////////////////////////////////////////////////////////////////////*/
insert into beauty_salon (title, location, phone, email, work_schedule_from, work_schedule_to) values
('Curl Bar Beauty Salon','41 Jarvis Street, Toronto,ON M5E 0A1, Canada','4167772875','Info@curlbar.Ca','10:00:00', '18:00:00');

insert into staff (`name`, post, factor_of_utility, salary, number_of_working_days, date_of_admission, work_schedule_to, work_schedule_from) values
('Alissa Marks','Hair Stylist', 1.13, 1543, 24, '2021-11-16 14:42:31', '09:00:00', '18:30:00');

insert into services (title, `description`, cost) values
('Hair Cutting & Styling','Hair Cutting & Styling has evolved over the years, gone are the days of getting your hair “wetted down” and having a quick trim! Lots of us now look to the latest hair trends in magazines, on celebrities and on the big screen leaving us all wanting to stay ahead of the game. However, just like the latest fashions might not be suitable for all shapes and sizes, the same can be said for the latest fashions when it comes to haircuts and hairstyles. Achieving the best haircuts and hairstyle comes with knowing your client’s needs, personality and lifestyle. Every client starts their journey towards the perfect haircut with a relaxed and informal chat. After the client has talked through their desired haircut and hairstyle and had the benefit of our professional advice, their hairstyle is transformed and vision accomplished. We understand how a great hairstyle can change the way you look and feel, so we discuss every stage with you to achieve the best style possible.', 94);

insert into customers (email, phone, `name`, date_of_joining) values
('anstar@gmail.com', '16478481480', 'Anika Sutton', '2023-01-16');

insert into discount_promotions (title, `condition`, time_of_action_from, time_of_action_to, discount_amount) values
('Birthday discount', 'One of the benefits of joining the "Curl Bar Beauty Salon" includes getting a treat on your birthday.', null, null, 25);

insert into monthly_expenses (title, expenses, `description`) values
('Rent of premises', 600, null);

insert into customers_to_staff (id_staff, id_customer, id_service, appointment_time, id_discount_promotions) values
(1, 1, 1, '2023-03-21 11:30:00', 1);

insert into staff_to_services (id_staff, id_service) values
(1,1);

insert into staff_to_beauty_salon (idbeauty_salon, idstaff) values
(1,1);

insert into beauty_salon_to_expenses (idmonthly_expense, idbeauty_salon) values
(1,1);
/*/////////////////////////////////////////////////////////////////////////////////////////////////////////*/
/*/////////////////////////////////////////////// УДАЛЕНИЕ БАЗЫ ДАННЫХ ////////////////////////////////////*/
/*/////////////////////////////////////////////////////////////////////////////////////////////////////////*/

/*drop database beauty_salon_db;*/
/*drop table ;*/