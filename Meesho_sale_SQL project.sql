
CREATE TABLE public.meesho_sales (
    state VARCHAR(100),
    city VARCHAR(100),
    quantity INTEGER,
    mrp NUMERIC(10,2),
    discount_percent NUMERIC(5,2),
    selling_price NUMERIC(10,2),
    sales NUMERIC(12,2),
    cost NUMERIC(12,2),
    profit NUMERIC(12,2),
    profit_margin NUMERIC(5,2),
    payment_mode VARCHAR(50),
    order_status VARCHAR(50),
    customer_type VARCHAR(50),
    customer_rating INTEGER,
    seller_rating NUMERIC(3,1),
    delivery_days INTEGER,
    return_reason VARCHAR(100)
);



DROP TABLE IF EXISTS public.meesho_sales;

CREATE TABLE public.meesho_sales (
    order_id VARCHAR(30),
    order_date TIMESTAMP,
    customer_id VARCHAR(30),
    seller_id VARCHAR(30),
    product_id VARCHAR(30),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100),
    quantity INTEGER,
    mrp NUMERIC(10,2),
    discount_percent NUMERIC(5,2),
    selling_price NUMERIC(10,2),
    sales NUMERIC(12,2),
    cost NUMERIC(12,2),
    profit NUMERIC(12,2),
    profit_margin NUMERIC(5,2),
    payment_mode VARCHAR(50),
    order_status VARCHAR(50),
    customer_type VARCHAR(50),
    customer_rating INTEGER,
    seller_rating NUMERIC(3,1),
    delivery_days INTEGER,
    return_reason VARCHAR(100)
);


SELECT COUNT(*) AS total_rows
FROM public.meesho_sales;

--1. Total Sale, Total Profit & Total Order
SELECT
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(customer_rating), 2) AS avg_customer_rating
FROM public.meesho_sales;

--2. Top 10 Sales by State
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM public.meesho_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

--3. Order Status Analysis
SELECT
    order_status,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales
FROM public.meesho_sales
GROUP BY order_status
ORDER BY total_orders DESC;

--4. Top 10 Profitable Category
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM public.meesho_sales
GROUP BY category
ORDER BY total_profit DESC
LIMIT 10;



TRUNCATE TABLE public.meesho_sales;






