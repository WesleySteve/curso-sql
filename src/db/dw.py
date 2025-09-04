# %%
import os

import pandas as pd
from sqlalchemy import create_engine

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(".")))
DATA_DIR = os.path.join(BASE_DIR, "data")


str_conexao_oltp = "sqlite:///{path}"

str_conexao_oltp = str_conexao_oltp.format(
    path=os.path.join(DATA_DIR, "olist_oltp" + ".db")
)

conn_oltp = create_engine(str_conexao_oltp)


str_conexao_dw = "sqlite:///{path}"

str_conexao_dw = str_conexao_dw.format(path=os.path.join(DATA_DIR, "olist_dw" + ".db"))

conn_dw = create_engine(str_conexao_dw)


# %%
fato_orders = """
SELECT
  t1.order_id,
  t1.customer_id,
  t1.order_status,
  t1.order_purchase_timestamp,
  t1.order_approved_at,
  t1.order_delivered_carrier_date,
  t1.order_delivered_customer_date,
  t1.order_estimated_delivery_date,
  t2.order_item_id,
  t2.product_id,
  t2.seller_id,
  t2.shipping_limit_date,
  t2.price,
  t2.freight_value
FROM
  olist_orders t1
  LEFT JOIN olist_order_items t2 ON t1.order_id = t2.order_id
"""


# %%
if conn_oltp:
    nome_tabela = "fato_orders"

    df_fato_orders = pd.read_sql(sql=fato_orders, con=conn_oltp)
    if df_fato_orders.shape > (0, 0):
        if conn_dw:
            df_fato_orders.to_sql(
                nome_tabela, con=conn_dw, if_exists="replace", index=False
            )

print("DW gerado com sucesso, como a tabela fato_orders")

# %%
dim_products = """
SELECT
  t1.product_id,
  t1.product_category_name,
  t1.product_name_lenght,
  t1.product_description_lenght,
  t1.product_photos_qty,
  t1.product_weight_g,
  t1.product_length_cm,
  t1.product_height_cm,
  t1.product_width_cm
FROM
  olist_products AS t1
"""

# %%
if conn_oltp:
    tabela_dim_products = "dim_products"

    df_dim_products = pd.read_sql(sql=dim_products, con=conn_oltp)
    if df_dim_products.shape > (0, 0):
        if conn_dw:
            df_dim_products.to_sql(
                tabela_dim_products, con=conn_dw, if_exists="replace", index=False
            )

# %%
dim_sellers = """
SELECT 
t1.seller_id,
t1.seller_zip_code_prefix, 
t1.seller_city, 
t1.seller_state
FROM olist_sellers AS t1
"""

# %%
if conn_oltp:
    tabela_dim_sellers = "dim_sellers"

    df_dim_sellers = pd.read_sql(sql=dim_sellers, con=conn_oltp)
    if df_dim_sellers.shape > (0, 0):
        if conn_dw:
            df_dim_sellers.to_sql(
                tabela_dim_sellers, con=conn_dw, if_exists="replace", index=False
            )

# %%
dim_customers = """
SELECT 
t1.customer_id,
t1.customer_unique_id,
t1.customer_zip_code_prefix, 
t1.customer_city, 
t1.customer_state
FROM olist_customers AS t1
"""

# %%
if conn_oltp:
    tabela_dim_customers = "dim_customers"

    df_dim_customers = pd.read_sql(sql=dim_customers, con=conn_oltp)
    if df_dim_customers.shape > (0, 0):
        if conn_dw:
            df_dim_customers.to_sql(
                tabela_dim_customers, con=conn_dw, if_exists="replace", index=False
            )

# %%
dim_geolocation = """
SELECT
t1.geolocation_zip_code_prefix,
t1.geolocation_lat,
t1.geolocation_lng,
t1.geolocation_city,
t1.geolocation_state
FROM olist_geolocation AS t1
"""

# %%
if conn_oltp:
    tabela_dim_geolocation = "dim_geolocation"

    df_dim_geolocation = pd.read_sql(sql=dim_geolocation, con=conn_oltp)
    if df_dim_geolocation.shape > (0, 0):
        if conn_dw:
            df_dim_geolocation.to_sql(
                tabela_dim_geolocation, con=conn_dw, if_exists="replace", index=False
            )

# %%
dim_payments = """
SELECT
  t1.order_id,
  t1.payment_sequential,
  t1.payment_type,
  t1.payment_installments,
  t1.payment_value
FROM
  olist_order_payments AS t1
"""

# %%
if conn_oltp:
    tabela_dim_payments = "dim_payments"

    df_dim_payments = pd.read_sql(sql=dim_payments, con=conn_oltp)
    if df_dim_payments.shape > (0, 0):
        if conn_dw:
            df_dim_payments.to_sql(
                tabela_dim_payments, con=conn_dw, if_exists="replace", index=False
            )
