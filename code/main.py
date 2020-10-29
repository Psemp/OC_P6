import psycopg2
import json
from functions.get_names import GetColumnNames, GetTableNames

#Classes import
from models.account import Account
from models.address import Address
from models.customer import Customer
from models.ingredients import Ingredients
from models.order import Order
from models.order_history import Order_history
from models.pizza import Pizza
from models.quantity_stocks import Quantity_stocks
from models.recipe import Recipe
from models.restaurant import Restaurant
from models.staff import Staff 
#/Classes import

cnx = psycopg2.connect(
    database="OC_P6_Test",
    user="postgres",
    password="destroy-whenever-nature-medieval",
    host="localhost",
    port="5432",
)

with open('resources/dataset.json') as f:
    dataset = json.load(f)

pcursor = cnx.cursor()
tablelist = GetTableNames(pcursor)

# TEST
# print(tablelist)
# /TEST

table_data_dict = {}

for table in tablelist:
    table_data_dict[table] = GetColumnNames(pcursor,table)

# for key in table_data_dict:
#     print(key)
#     print(table_data_dict[key])

account_list = []

for entry in dataset:
    i = 0
    print(entry)
    while entry not Classlist[i]:
        i = i + 1
