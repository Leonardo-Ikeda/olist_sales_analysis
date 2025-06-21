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




🛍️ 1. Produtos & Categorias
Q5. Quais são os 10 produtos mais vendidos em volume (quantidade)?
→ Group by product_id, count() em order_items.*

Q6. Quais são as 5 categorias com maior faturamento total?
→ Join order_items → products, somar price, group by product_category_name.

Q7. Qual é o preço médio dos produtos por categoria?
→ Group by categoria, avg(price).

Q8. Quais produtos geraram mais receita?
→ Somar price por product_id.

🧑‍🤝‍🧑 2. Clientes & Regiões
Q9. Qual estado brasileiro tem mais clientes?
→ Group by customer_state, count() em customers.*

Q10. Qual estado gerou mais receita?
→ Join customers → orders → order_items, group by customer_state, somar price.

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
