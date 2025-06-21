# Análise SQL de Vendas no E-commerce Brasileiro da Olist

## 1. Quais são as 10 categorias mais vendidos em volume (quantidade)?

```sql
SELECT 
    p.product_category_name AS categoria_produto,
    COUNT(*) AS numero_vendas
FROM order_items oi
JOIN products p
    ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY numero_vendas DESC
LIMIT 10;
```
O resultado da Query está apresentado abaixo:

| categoria_produto         | numero_vendas |
|---------------------------|---------------|
| cama_mesa_banho           | 11.115        |
| beleza_saude              | 9.670         |
| esporte_lazer             | 8.641         |
| moveis_decoracao          | 8.334         |
| informatica_acessorios    | 7.827         |
| utilidades_domesticas     | 6.964         |
| relogios_presentes        | 5.991         |
| telefonia                 | 4.545         |
| ferramentas_jardim        | 4.347         |
| automotivo                | 4.235         |



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
