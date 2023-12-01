select 
--from raw_orders
o.orderid, 
o.orderdate, 
o.SHIPDATE, 
o.shipmode, 
o.ORDERSELLINGPRICE,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRICE - o.ORDERCOSTPRICE as orderprofit, 
-- from raw_customer
c.CUSTOMERNAME,
c.segment,
c.country,
-- from raw_product
p.category,
p.productname,
p.SUBCATEGORY
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid