# %%
import os

import pandas as pd
from sqlalchemy import create_engine

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(".")))
DATA_DIR = os.path.join(BASE_DIR, "data")


str_conexao = "sqlite:///{path}"

str_conexao = str_conexao.format(path=os.path.join(DATA_DIR, "olist_oltp" + ".db"))

conn = create_engine(str_conexao)

# %%
if conn:
    for arq in os.listdir(DATA_DIR):
        if arq.endswith(".csv"):
            if arq.startswith("product_"):
                n = arq.split("_dataset")
                nome_tabela = n[0]

            n = arq.split("_dataset")
            nome_tabela = n[0]

            df = pd.read_csv(os.path.join(DATA_DIR, arq), encoding="utf-8")
            df.to_sql(nome_tabela, con=conn, if_exists="replace", index=False)

print("Banco de dados gerado com sucesso")
