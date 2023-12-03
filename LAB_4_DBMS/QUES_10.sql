DELIMITER $$
use ecommerce $$
CREATE PROCEDURE `supplier_rating`()
BEGIN
	select report.supp_id,report.Average ,
	case
		when report.Average = 5 then 'Excellent service'
		when report.Average > 4 then 'Good service'
		when report.Average > 2 then 'Average service'
		else 'poor service'
	end as Type_of_Service from
	(
	select test2.supp_id,avg(rat_ratstars) as Average from
	(
		select sp.supp_id,t1.ord_id,t1.rat_ratstars from supplier_pricing as sp
		inner join
		(
			select o.pricing_id,rat.ord_id,rat.rat_ratstars from orders as o
			inner join
			rating as rat on o.ord_id = rat.ord_id
			) as t1 on sp.pricing_id = t1.pricing_id
		) as test2 group by test2.supp_id) as report;
END$$
