--Retail Case Study
-- Data Understanding


1 select (select count(*) from trans) as TransCount,
  (select count(*) from prod) as productCount,(select count(*) from Customer) as CustomerCount;

2. select Count(*) from trans where qty <0; 

3. Alter table Customer 
ALTER COLUMN DOB SET DATEFORMAT dmy;
Alter table trans
ALTER COLUMN tran_date SET DATEFORMAT dmy;

4.SELECT DATEDIFF(day, MIN(tran_date), MAX(tran_date)) as daydiff, 
	DATEDIFF(month, MIN(tran_date), MAX(tran_date))as MonthDiff,
	DATEDIFF(year, MIN(tran_date), MAX(tran_date)) AS yearDiff;

5. SELECT prod_cat from prod where prod_subcat = "DIY";



--Data Analysis


1.Select Store_type, count(Store_type) as ValueOccur from trans group by Store_type order by ValueOccur desc limit 1;
2.Select Sum(Case when Gender="F" then 1 else 0 end) as FemaleCount,
    Sum(Case when Gender="M" then 1 else 0 end) as MaleCount from customer;

3. Select concat("there are ", count(city_code),"number of customers from", city_code,"city code.") 
	from customer group by city_code order by Count(city_code) desc limit 1;

4.Select count(prod_subcat) as subCategoryCount from prod where prod_cat="Books";

5.Select prod_subcat_code,Max(qty) from trans group by prod_subcat_code;

6. select prod_cat,sum(total_amt) from(
select * from trans t inner join prod p 
	on t.prod_cat_code = p.prod_cat_code where p.prod_cat = "Electronics"
	 or p.prod_cat = "Books") as temp group by prod_cat;

7.  select count(cust_id) from (select * from trans where qty > 0 group by cust_id having count(transaction_id) > 10 )temp; 

8. select sum(total_amt) from(
select * from trans t inner join prod p 
on t.prod_cat_code = p.prod_cat_code where p.prod_cat = "Electronics" or p.prod_cat = "Clothing" ) 
as temp where Store_type= "Flagship store";

9. Select prod_subcat,sum(total_amt) as TotalRevenue from(
	select* from customer c inner join trans t on c.customer_Id = t.cust_id
	inner join prod p on t.prod_cat_code = p.prod_cat_code 
	where c.gender="M" and p.prod_cat = "Electronics") temp group by prod_subcat;






