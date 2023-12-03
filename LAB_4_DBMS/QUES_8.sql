select p.PRO_ID,p.PRO_NAME from product as p
inner join
(
select o.*,sp.pro_id from orders as o
inner join
supplier_pricing as sp on sp.pricing_id = o.pricing_id and ord_date>"2021-10-05"
) as q
on p.pro_id = q.pro_id;