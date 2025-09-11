- Window function

  - LEAD()

    - Pega o valor da linha posterior

  - LAG()
    - Pega o valo da linha anterior

- Particionar pelo seller_id
  - Ordernar data_venda ASC
    - menor data para maior data

| seller_id | data_venda | valor_venda | antrior | posterior
| 0011awd22 | 2017-02-19 | 400 ------- | null ----- | 100
| 0011awd22 | 2017-02-23 | 100 ------- | 400 ------ | 200
| 0011awd22 | 2017-03-02 | 200 ------- | 100 ------ | 300
| 0011awd22 | 2017-03-03 | 300 ------- | 200 ------ | null
