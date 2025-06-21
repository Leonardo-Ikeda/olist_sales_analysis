# Análise SQL de Vendas no E-commerce Brasileiro da Olist

## 1. Quais são as 5 categorias com maior faturamento total?

```sql
SELECT 
	product_category AS categoria_produto,
	SUM(price) AS faturamento_total
FROM order_items oi
JOIN products p
	ON p.product_id = oi.product_id
GROUP BY product_category
ORDER BY faturamento_total DESC
LIMIT 5
;
```
O resultado da Query está apresentado abaixo:

| categoria_produto         | faturamento_total (R$) |
|---------------------------|------------------------|
| beleza_saude              | 1.258.681,34           |
| relogios_presentes        | 1.205.005,68           |
| cama_mesa_banho           | 1.036.988,68           |
| esporte_lazer             |   988.048,97           |
| informatica_acessorios    |   911.954,32           |

## 2. Qual é o faturamento total por estado brasileiro (UF)?

```sql
SELECT 
	c.customer_state AS estado,
	SUM(oi.price) AS faturamento
FROM customers c
JOIN orders o 
	ON o.customer_id = c.customer_id
JOIN order_items oi
	ON oi.order_id = o.order_id
GROUP BY c.customer_state
ORDER BY faturamento DESC
LIMIT 10
;
```
O resultado da Query está apresentado abaixo:

| estado | faturamento (R$) |
|--------|------------------|
| SP     | 5.202.955,05     |
| RJ     | 1.824.092,67     |
| MG     | 1.585.308,03     |
| RS     |   750.304,02     |
| PR     |   683.083,76     |
| SC     |   520.553,34     |
| BA     |   511.349,99     |
| DF     |   302.603,94     |
| GO     |   294.591,95     |
| ES     |   275.037,31     |

## 3. Qual estado brasileiro tem mais clientes?

```sql
SELECT 
	c.customer_state AS estado,
	COUNT(DISTINCT o.customer_id) AS numero_clientes
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY numero_clientes DESC
LIMIT 1
;
```

Resultado:

| estado | numero_clientes |
|--------|-----------------|
| SP     | 41.746          |

## 4. Qual é a média de valor gasto por cliente em cada estado?

```sql
SELECT 
	c.customer_state AS estado,
	ROUND(AVG(freight_value + price),2) AS valor_medio_gasto
FROM orders o
JOIN customers c
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON oi.order_id = o.order_id
GROUP BY c.customer_state
ORDER BY valor_medio_gasto DESC
LIMIT 10
;
```
Resultado:

| estado | valor_medio_gasto/cliente (R$) |
|--------|--------------------------------|
| PB     | 234,20                         |
| AL     | 216,73                  	  |
| AC     | 213,80                  	  |
| RO     | 207,04                  	  |
| PA     | 201,53                  	  |
| PI     | 199,51                  	  |
| AP     | 198,33                  	  |
| TO     | 194,78                  	  |
| RR     | 193,55                  	  |
| RN     | 192,62                  	  |




Q11. Qual é a média de valor gasto por cliente em cada estado?
→ Group by estado, usar avg(total gasto por cliente).

🕒 3. Tempo & Comportamento
Q12. Qual é o tempo médio de entrega (diferença entre order_delivered_customer_date e order_purchase_timestamp)?
→ Usa orders, calcular DATEDIFF.

Q13. Quantos pedidos foram entregues com atraso (depois da data estimada)?
→ Filtrar onde order_delivered_customer_date > order_estimated_delivery_date.

Q14. Em quais meses acontecem mais vendas?
→ Extrair mês de order_purchase_timestamp, contar.

Q15. Qual é o valor médio por pedido em cada mês?
→ Group by mês, avg(price).

🔄 4. Recorrência e Fidelização
Q16. Quantos clientes fizeram mais de um pedido?
→ Group by customer_id, count(orders), filtrar > 1.

Q17. Qual é o tempo médio entre pedidos de clientes recorrentes?
→ Usar window function LAG() para calcular diferença entre compras.

Q18. Quais produtos são mais comprados por clientes recorrentes?
→ Join com clientes que compraram mais de uma vez.
