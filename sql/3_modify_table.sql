COPY customers
FROM 'C:\Users\Aryan Jain\OneDrive\Desktop\Project\Data\olist_customers_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY orders
FROM 'C:\Users\Aryan Jain\OneDrive\Desktop\Project\Data\olist_orders_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY order_items
FROM 'C:\Users\Aryan Jain\OneDrive\Desktop\Project\Data\olist_order_items_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY order_payments
FROM 'C:\Users\Aryan Jain\OneDrive\Desktop\Project\Data\olist_order_payments_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY order_reviews
FROM 'C:\Users\Aryan Jain\OneDrive\Desktop\Project\Data\olist_order_reviews_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY products
FROM 'C:\Users\Aryan Jain\OneDrive\Desktop\Project\Data\olist_products_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY sellers
FROM 'C:\Users\Aryan Jain\OneDrive\Desktop\Project\Data\olist_sellers_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');