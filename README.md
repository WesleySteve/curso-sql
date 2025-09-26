# Curso de SQL

- Objetivo deste projeto é de por em pratica consultas **SQL**,
  junto a construção de um **DW**,
  e comparar **CONSULTAS** realizadas direto em um **BANCO OLTP** VS **DW**

## Pré-requisitos

- Git
- UV
- Python >= 3.13

## Libs utilizadas

- "ipykernel>=6.30.1",
- "kaggle>=1.7.4.5",
- "pandas>=2.3.2",
- "sqlalchemy>=2.0.43"

## Como usar o projeto

- Clone o repositorio

$ git clone https://github.com/WesleySteve/curso-sql.git

## Explicação

- O script 'extract_olist.py' , realiza o download dos arquivos necessarios.
  Mas por algum motivo que ainda não descobri os arquivos baixados utilizando tal
  recurso, ficam como se fossem arquivos corrompidos, assim não conseguindo ler
  e gerar o banco de dados relacional inicial.
  Para assim dar sequencia na execuçãos dos demais scripts

- O script 'extract_olist.py' escrito em: 'src/etl_oltp/extract.py' ,
  tem como objetivo realizar o download dos arquivos '.csv' disponibilizados
  no site do 'Kaggle' pela OLIST, para que seja construido o
  banco de dados relacional. Baseado no diagrama apresentado no site.
- O script 'oltp.py' escrito em: 'src/db/oltp.py' ,
  tem como objetivo ler os arquivos baixados no script anterior e gerar o
  banco de dados relacional (oltp)
- O script 'dw.py' escrito em: 'src/db/dw.py' ,
  tem como objetivo gerar o banco de dados analitico (data werehouse). Este diagrama,
  será desenhado posteriormente. Com este banco analitico a disposição é melhor
  para realizar as consultas necessarias do dia-a-dia não atrapalhando o
  funcionamento do banco de dados principal (operacional do dia-a-dia).
- Os scripts desenvolvidos em: 'src/sql/querys_curso' ,
  são scripts de estudo baseado no conteudo do curso. Os mesmos utilizam da base
  relacional, onde não se faria estas querys normalmente.
- Os scripts desenvolvidos em: 'src/sql/querys_comparativo_curso' ,
  estes sim são scripts executados em um ambiente apropriado que não atrapalha
  as operações do dia-a-dia de uma empresa, por não estar diretamente realizando
  as consultas no banco de dados principal e sim em um banco analitico preparado
  para tais consultas.

## Arvore de diretorios

- curso-sql
  - banco
    - oltp.png
  - data
    - churn_completo_olist.txt
    - e demais arquivos adicionados no .gitignore
  - src
    - db
      - dw.py
      - oltp.py
    - dw
      - g_dim_customers.sql
      - g_dim_geolocation.sql
      - g_dim_payments.sql
      - g_dim_products.sql
      - g_dim_sellers.sql
      - g_fato_orders
    - etl_oltp
      - extract_oltp.py
    - sql
      - querys_comparativo_curso
        - avancado
          - avancados.sql
        - basico
          - exercicios
            - querys_exercicios.sql
          - basicos.sql
        - intermediario
          - exercicios
            - querys_exercicios.sql
          - intermediarios.sql
      - querys_curso
        - avancado
          - avancados.sql
        - basico
          - exercicios
            - querys_exercicios.sql
          - basicos.sql
        - intermediario
          - exercicios
            - querys_exercicios.sql
          - intermediarios.sql
    - .gitignore
    - .python-version
    - pyproject.toml
    - README.md
    - uv.lock
