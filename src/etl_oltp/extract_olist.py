import shutil

import kaggle

api = kaggle.KaggleApi()

api.authenticate()


api.dataset_download_file(
    dataset="olistbr/brazilian-ecommerce", file_name="olist_customers_dataset.csv"
)

api.dataset_download_file(
    dataset="olistbr/brazilian-ecommerce", file_name="olist_geolocation_dataset.csv"
)

api.dataset_download_file(
    dataset="olistbr/brazilian-ecommerce", file_name="olist_order_items_dataset.csv"
)

api.dataset_download_file(
    dataset="olistbr/brazilian-ecommerce", file_name="olist_order_payments_dataset.csv"
)

api.dataset_download_file(
    dataset="olistbr/brazilian-ecommerce", file_name="olist_orders_dataset.csv"
)

api.dataset_download_file(
    dataset="olistbr/brazilian-ecommerce", file_name="olist_products_dataset.csv"
)

api.dataset_download_file(
    dataset="olistbr/brazilian-ecommerce", file_name="olist_sellers_dataset.csv"
)


shutil.move("olist_customers_dataset.csv", "data/olist_customers_dataset.csv")
shutil.move("olist_geolocation_dataset.csv", "data/olist_geolocation_dataset.csv")
shutil.move("olist_order_items_dataset.csv", "data/olist_order_items_dataset.csv")
shutil.move("olist_order_payments_dataset.csv", "data/olist_order_payments_dataset.csv")
shutil.move("olist_orders_dataset.csv", "data/olist_orders_dataset.csv")
shutil.move("olist_products_dataset.csv", "data/olist_products_dataset.csv")
shutil.move("olist_sellers_dataset.csv", "data/olist_sellers_dataset.csv")
