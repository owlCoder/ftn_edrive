-- 1
-- Prikazati proizvode (products.product_name, products.standard_cost,
-- products.list_price) sortirane po prodajnoj ceni rastuće i nabavnoj ceni opadajuće.
SELECT
    PRODUCT_NAME,
    STANDARD_COST,
    LIST_PRICE
FROM
    PRODUCTS
ORDER BY
    LIST_PRICE ASC,
    STANDARD_COST DESC;

-- 2
-- Prikazati proizvode (products.product_name, products.description) i razlike
-- između prodajne i nabavne cene za proizvode čiji nazivi počinju sa 'Intel'.
SELECT
    PRODUCT_NAME,
    DESCRIPTION,
    LIST_PRICE - STANDARD_COST AS RAZLIKA
FROM
    PRODUCTS
WHERE
    PRODUCT_NAME LIKE 'Intel%';

-- 3
-- Iz tabele order_items obrisati kolonu unit_price.
ALTER TABLE ORDER_ITEMS DROP COLUMN UNIT_PRICE;

-- 4
-- U tabeli locations izmeniti kolonu city tako da vrednosti u njoj budu u obliku
-- <city> (<state>) za lokacije koje u polju state nemaju null vrednosti
UPDATE LOCATIONS
SET
    CITY = CITY || ' (' || STATE || ')'
WHERE
    STATE IS NOT NULL;

-- 5
-- Prikazati imena i prezimena radnika (employees.first_name,
-- employees.last_name) koji su povezani sa narudžbinama čiji je status 'Canceled'.
SELECT
    FIRST_NAME,
    LAST_NAME
FROM
    EMPLOYEES E,
    ORDERS    O
WHERE
    E.EMPLOYEE_ID = O.SALESMAN_ID
    AND O.STATUS = 'Canceled';

-- 6
-- Prikazati podatke o radnicima (employees.first_name, employees.last_name,
-- employees.job_title) koji nisu nikome nadređeni.
SELECT
    DISTINCT EMPLOYEE_ID, 
    FIRST_NAME,
    LAST_NAME,
    JOB_TITLE
FROM
    EMPLOYEES
WHERE
    EMPLOYEE_ID NOT IN 
    (
        SELECT MANAGER_ID FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL
    )
    GROUP BY EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE
    ORDER BY EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_TITLE;

-- 7
-- Prikazati podatke o skladištima (location.address,
-- warehouses.warehouse_name) za skladišta koja nisu u Sjedinjenim Američkim
-- Državama.
SELECT
    L.ADDRESS,
    NVL(W.WAREHOUSE_NAME, '/')
FROM
    LOCATIONS  L,
    WAREHOUSES W
WHERE
    L.LOCATION_ID = W.LOCATION_ID(+)
    AND L.COUNTRY_ID NOT LIKE 'US';

-- 8
-- Prikazati podatke o porudžbinama (orders.order_id, orders.order_date) kao i
-- ukupnu zaradu od porudžbine (suma razlika prodajnih i nabavnih cena prozvoda
-- pomnoženih količinom proizvoda u stavci porudžbine) za porudžbine koje imaju
-- manje od 4 stavke.
WITH ZARADA_OD_PROIZVODA AS (
    SELECT
        (LIST_PRICE - STANDARD_COST) AS NETO_RAZLIKA
    FROM
        PRODUCTS,
        ORDER_ITEMS
    WHERE
        ORDER_ITEMS.PRODUCT_ID = PRODUCTS.PRODUCT_ID
)
SELECT
    O_ID,
    O_DATE,
    SUM(ZARADA)
FROM
    (
        SELECT
            ORDERS.ORDER_ID                             AS O_ID,
            ORDER_DATE                                  AS O_DATE,
            ZARADA_OD_PROIZVODA.NETO_RAZLIKA * QUANTITY AS ZARADA
        FROM
            ORDERS,
            ORDER_ITEMS,
            ZARADA_OD_PROIZVODA
        WHERE
            ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
        GROUP BY
            ORDER_ITEMS.ITEM_ID,
            ORDER_DATE,
            ORDERS.ORDER_ID,
            ZARADA_OD_PROIZVODA.NETO_RAZLIKA * QUANTITY
        HAVING
            SUM(ORDER_ITEMS.ITEM_ID) <= 4
    )
GROUP BY
    O_ID,
    O_DATE
ORDER BY
    O_ID;

-- 9
-- Kreirati pogled sales_impact koji za svakog radnika (employees.employee_id,
-- employees.first_name, employees.last_name) sa titulom 'Sales Representative'
-- prikazuje ukupnu vrednost prihoda od robe koju je prodao (suma razlika prodajnih i
-- nabavnih cena proizvoda pomnožena količinama datih proizvoda na stavkama računa
-- izdatih od strane tog radnika). Ako radnik nije izvršio ni jednu prodaju, za ukupnu
-- vrednost njegovih prodaja postaviti nulu.
CREATE OR REPLACE VIEW SALES_IMPACT AS (
    SELECT
        EMPLOYEE_ID,
        FIRST_NAME,
        LAST_NAME,
        NVL(SUM((LIST_PRICE - STANDARD_COST) * QUANTITY),
        0 ) AS PROFIT
    FROM
        EMPLOYEES,
        ORDERS,
        ORDER_ITEMS,
        PRODUCTS
    WHERE
        EMPLOYEE_ID = SALESMAN_ID
        AND ORDERS.ORDER_ID = ORDER_ITEMS.ORDER_ID
        AND ORDER_ITEMS.PRODUCT_ID = PRODUCTS.PRODUCT_ID
        AND JOB_TITLE = 'Sales Representative'
    GROUP BY
        EMPLOYEE_ID,
        FIRST_NAME,
        LAST_NAME
);