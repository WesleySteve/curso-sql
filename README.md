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
