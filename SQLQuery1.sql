drop table if exists goldusers;
CREATE TABLE goldusers(userid integer,gold_signup_date date); 
INSERT INTO goldusers(userid,gold_signup_date) 
VALUES (1,'09-22-2017'),
       (3,'04-21-2017'),
       (5,'02-04-2018'),
       (6,'11-10-2018'),
       (8,'12-12-2018'),
       (10,'07-01-2019');
drop table if exists users;
CREATE TABLE users(userid integer,signup_date date); 
INSERT INTO users(userid,signup_date) 
VALUES (2,'09-02-2014'),
       (4,'01-15-2015'),
       (7,'04-11-2014'),
       (9,'05-12-2015'),
       (11,'02-18-2016');
drop table if exists orders;
CREATE TABLE orders(userid integer,ordered_date date,item_id integer); 
INSERT INTO orders(userid,ordered_date,item_id) 
VALUES (1,'04-19-2017',2),
       (3,'12-18-2019',12),
       (2,'07-20-2020',3),
       (1,'10-23-2019',6),
       (4,'03-19-2018',9),
       (3,'12-20-2016',2),
       (11,'11-09-2016',1),
       (1,'05-20-2016',1),
       (6,'09-24-2017',3),
       (7,'03-11-2017',5),
       (1,'03-11-2016',8),
       (5,'11-10-2016',3),
       (7,'12-07-2017',12),
       (3,'12-15-2016',3),
       (9,'11-08-2017',15),
       (11,'09-10-2018',14);
drop table if exists item;
CREATE TABLE item(item_id integer,item_name text,price integer); 
INSERT INTO item(item_id,item_name,price) 
VALUES(1,'Aam Ras Pastry',129),
      (2,'Almonds Address Ice Cream',149),
      (3,'Bavarian Mud Ice Cream',129),
      (4,'Berry Cake Wonder Ice Cream',119),
      (5,'Big Babool Ice Cream',129),
      (6,'BK Chicken Burger',149),
      (7,'BK Veggie Burger',99),
      (8,'Black O Currant Milkshake',199),
      (9,'Butterscotch Pastry',89),
      (10,'Caramel Brownie Milkshake',219),
      (11,'Caramel Oreo Milkshake',219),
      (12,'Chicken Dominator Pizza',369),
      (13,'Chicken Whopper',199),
      (14,'Chickoo Caramel Milkshake',199),
      (15,'Makhani Do Pyaza Pizza',199);


--Dispaly all the created tables .
select * from goldusers_signup;
select * from users;
select * from item;
select * from orders;

--List out all the item names along with their price.
select item_name,price from item;

--What is the most ordered item ?
select top 1 item_id as most_ordered_item from orders group by item_id order by count(item_id) desc;

--Find the most expensive item from items ?
select max(price) as expensive_item from item;

--Find the least expensive item from items ?
select min(price) as least_expensive_item from item;

--Find out the users who signed up in the year 2015 .
select * from users where signup_date between '01-JAN-15' and '31-DEC-15';

--What is the least ordered item ?
select top 1 item_id as least_ordered_item from orders group by item_id order by count(item_id);

--Find the items whose cost ranges from 100 t0 500 ?
select item_id,item_name,price from item where price>=100 and price<=500;

--What is the total revenue in the year 2016 ?
select sum(a.price) as total_revenue from item a inner join orders b on a.item_id=b.item_id and b.ordered_date between'01-JAN-16' and '31-DEC-16';

--List the ice creams along with their prices from the items table .
select item_name,price from item where item_name like '%Cream';

--List all the user id's from users and goldusers tables .
SELECT DISTINCT userid FROM users
UNION
SELECT DISTINCT userid FROM goldusers;

--What is the average cost of the items ?
select avg(a.price) as avg_price from item a inner join orders b on a.item_id=b.item_id;
