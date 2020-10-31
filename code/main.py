import psycopg2
import json
from functions.get_names import GetColumnNames, GetTableNames
from management.data_insertion import Insert_data

from models import *

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
classdict = {'account': Account, 'address': Address, 'customer': Customer,
             'ingredients': Ingredients, 'order': Order,
             'order_history': Order_history, 'pizza': Pizza,
             'quantity_stocks': Quantity_stocks, 'recipe': Recipe,
             'restaurant': Restaurant, 'staff': Staff}

instancedict = {'account': [], 'address': [], 'customer': [], 'ingredients': [],
                'order': [], 'order_history': [], 'pizza': [],
                'quantity_stocks': [], 'recipe': [],
                'restaurant': [], 'staff': []}

# TEST
# print(tablelist)
# /TEST

table_data_dict = {}

for table in tablelist:
    table_data_dict[table] = GetColumnNames(pcursor, table)

# for t in table_data_dict:
#     print(t)
#     print(table_data_dict[t])

for entry in dataset:
    # print(entry)

    for key in classdict:
        # print('test done')
        if entry == key:
            for element in dataset[key]:
                print(element)
                instancedict[key].append((classdict[key](element)))
                print('insertion done')

print(instancedict['account'][0].phone)
