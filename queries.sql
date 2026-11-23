-- Задание 1: список логинов курьеров с количеством их заказов в статусе «В доставке» (inDelivery = true)
SELECT c.login, COUNT(o.id) AS delivery_count
FROM "Couriers" AS c
INNER JOIN "Orders" AS o ON c.id = o."courierId"
WHERE o."inDelivery" = true
GROUP BY c.login;

-- Задание 2: все трекеры заказов и их статусы
SELECT track,
       CASE
           WHEN finished = true THEN 2
           WHEN cancelled = true THEN -1
           WHEN "inDelivery" = true THEN 1
           ELSE 0
       END AS status
FROM "Orders";