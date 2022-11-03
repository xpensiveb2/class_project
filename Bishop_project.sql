select *
from "brewery_data";

select *
from "web_events";

select *
from "orders";

select *
from "sales_reps";

select *
from "accounts";

select *
from "region";

######ANSWER NO1#########

select *
from
(select "poc", to_char("date" , 'day'), "date" , "sty_qty"
from
(select distinct a.primary_poc as "poc", o.occurred_at as "date", sum("standard_qty") as "sty_qty"
from "orders" o
join "accounts" a
on o.account_id = a.id
group by "poc", "date") as table_one
 order by "sty_qty" asc) as table_two;
 
 ##########ANSWER NO2#######
 
 select "name", to_char(occurred_at, 'day'), max(total) as "highest_sale"
 from "accounts" a
 join "orders" o
 on o.account_id = a.id
 where trim (to_char(occurred_at, 'day'))= 'saturday' and "name" = 'Walmart'
 group by "name", "occurred_at"
 order by "highest_sale";
 
 ######ANSWER NO3##########
 select *
 from
 (select distinct ("name"), "week_day", to_char("week_day", 'month') "months", to_char("week_day", 'day') "day", sum("total_sales") as "sales_total"
 from
 (select s.name, o.occurred_at "week_day", o.total "total_sales"
 from "sales_reps" s
 join "orders" o
 on s.region_id = o.id) as "table_one"
 group by "name", "week_day"
 order by "sales_total" desc) "table_two";
 
