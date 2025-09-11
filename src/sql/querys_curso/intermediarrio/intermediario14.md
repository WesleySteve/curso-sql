window function

- row_number
  - numerar linhas

o rank nesse caso deve ser particionado por seller_id

---

- Particionamento do nosso seller_id
  - Ordenar da maior qtde_vendas para a menor
    - order by qtde_vendas desc
  - Ordernar maior valor_venda para o menor
    - order by valor_venda desc

---

| seller_id | product_id | qtde_vendas | valor_venda | rank_produtos |
| 00wdw1511 | 52aave85q2 | 3 | ------- | 10000 ------ | 1
| 00wdw1531 | 52uve8wq2 | 97 | ------- | 50000 ------ | 1
| 00wdw1531 | 52aaie85q2 | 16 | ------ | 30000 ------ | 2
| 00wdw1531 | 52aaie85y2 | 3 | ------- | 2500 ------- | 3
| 00wdw1531 | 52aaie85y2 | 2 | ------- | 2000 ------- | 5
| 00wdw1531 | 52aaie85u2 | 1 | ------ | 500 --------- | 6
| 00wdw1531 | 52aaie85u2 | 3 | ------- | 2200 ------- | 4
| 00wdtg511 | 52aave85p2 | 3 | ------- | 10000 ------ | 1
