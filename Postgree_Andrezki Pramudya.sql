======TASK 1========
CREATE TABLE promo_code
(
    promo_id INT,
    promo_name VARCHAR (50),
    price_deduction INT,
    "Description" VARCHAR (50),
    "Duration" integer
);

========Task 2==========
CREATE TABLE q3_q4_review
(
    item_id INT,
    item_name VARCHAR (100),
    purchase_date date,
    total_price bigint,
    promo_id INT,
    promo_name VARCHAR (50),
    price_deduction INT,
    sales_after_promo VARCHAR (100),
    quantity VARCHAR (100),
    price VARCHAR (100)
);

========TASK 3=============
SELECT sales_table.purchase_date, marketplace_table.item_id,marketplace_table.item_name,
marketplace_table.price,sales_table.quantity,promo_code.promo_id,promo_code.promo_name,
promo_code.price_deduction,(sales_table.quantity*marketplace_table.price) AS total_price,
((quantity*price)-promo_code.price_deduction) AS sales_after_promo FROM ((sales_table
INNER JOIN marketplace_table ON sales_table.item_id=marketplace_table.item_id)
INNER JOIN promo_code ON sales_table.promo_id=promo_code.promo_id)
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;

INSERT INTO q3_q4_review(item_name,purchase_date,total_price,promo_id,promo_name,price_deduction,sales_after_promo,quantity,price)
SELECT sales_table.purchase_date, marketplace_table.item_id,marketplace_table.item_name,
marketplace_table.price,sales_table.quantity,promo_code.promo_id,promo_code.promo_name,
promo_code.price_deduction,(sales_table.quantity*marketplace_table.price) AS total_price,
((quantity*price)-promo_code.price_deduction) AS sales_after_promo FROM ((sales_table
INNER JOIN marketplace_table ON sales_table.item_id=marketplace_table.item_id)
INNER JOIN promo_code ON sales_table.promo_id=promo_code.promo_id)
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;

========TASK 4=============
CREATE shipping_summary
(
    shipping_id INT,
    shipping_date date,
    seller_name VARCHAR (255),
    city VARCHAR(255),
    zipcode bigint,
    buyer_name VARCHAR (255),
    address VARCHAR (255),
    kode_resi INT
);

SELECT shipping_table.shipping_Id,shipping_table.shipping_date,seller_table.seller_name,
buyer_table.city,buyer_table.address,buyer_table.zipcode, 
CONCAT (shipping_id,purchase_date,shipping_date,shipping_table.buyer_id,shipping_table.seller_id) 
AS kode_resi from((shipping_table
INNER JOIN seller_table ON shipping_table.seller_id=seller_table.seller_Id)
INNER JOIN buyer_Table ON shipping_table.buyer_id=buyer_table.buyer_id)
WHERE shipping_date BETWEEN '2022-12-01' AND '2022-12-31'
ORDER BY shipping_date ASC;
