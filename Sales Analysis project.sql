-- checking datatypes
describe customers;

-- chnaging data type for customer_id
alter table customers modify customer_id varchar(20) not null;

-- making customer_id the primary key
alter table customers add primary key (customer_id); 
-- checking data types
describe customers;

select * from customers;
-- changing data type
alter table customers modify signup_date date;

select * from orders;
-- checking data type
describe orders;
--changing data type for customer id in the orers table
alter table orders modify customer_id varchar(20) not null;
-- changing data type of the order id in the orders table
alter table orders modify order_id varchar(20) not null;
--making the order_id a primary keu
alter table orders add primary key (order_id); 
--making the customer_id a foreign key
alter table orders
add constraint lg_customers
foreign key (customer_id)
references customers(customer_id);
alter table orders modify order_date date;
describe orders;


select * from customers;


-- Question 1: how many customers does the bussiness have in each city?
select city, 
count(customer_id) as total_customer
from customers
group by city
order by total_customer DESC 
Limit 5;

-- Question 2: which payment method does the customers use frequently?
select payment_method,
count(order_id) as mostusedpayment_method
from orders
group by payment_method
order by mostusedpayment_method desc;

-- Question 3: which customer segment (new, Regular or Prmium) generate the highest revenue?
select 
c.customer_segment,
sum(o.order_total) as total_revenue
from customers c
join orders o
   on c.customer_id = o.customer_id
   where o.order_status = "delivered"
   group by c.customer_segment
   order by total_revenue desc;

-- Question 4: which product categories generate the highest revenue?
select 
category,
sum(order_total) as total_revenue
from orders
where order_status = "delivered"
group by category
order by total_revenue desc;

-- Question 5: Which registered customers have never placed an order?
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Qestion 6: Who are the top 5 customers making purchases, and what products have they bought?
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.product_name,
    o.order_total,
    o.order_date
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC
Limit 5;

-- Question 7: How has monthly revenue changed over time, and what is the month-on-month revenue growth? (common table expression)
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        SUM(order_total) AS total_revenue
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),
revenue_comparison AS (
    SELECT
        sales_month,
        total_revenue,
        LAG(total_revenue) OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT
    sales_month,
    total_revenue,
    previous_month_revenue,
    total_revenue - previous_month_revenue AS revenue_change,
    ROUND(
        (total_revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0) * 100,
        2
    ) AS growth_percentage
FROM revenue_comparison
ORDER BY sales_month;

