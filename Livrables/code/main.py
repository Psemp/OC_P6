import psycopg2
import json
from functions.get_names import GetColumnNames, GetTableNames
from management.data_insertion import Insert_data
from management.sql_executor import DatabaseCreation

from models import Account, Address, Restaurant, Customer
from models import Staff, Ingredients, Pizza, Order
from models import Order_history, Quantity_stocks, Recipe

usr_pwd = input("Please enter password : ")

cnx = psycopg2.connect(
    database="OC_P6_Test",
    user="postgres",
    password=usr_pwd,
    host="localhost",
    port="5432",
)

with open('resources/dataset.json') as f:
    dataset = json.load(f)

pcursor = cnx.cursor()

DatabaseCreation(pcursor)

tablelist = GetTableNames(pcursor)
classdict = {'account': Account, 'address': Address, 'restaurant': Restaurant,
             'customer': Customer, 'staff': Staff,
             'ingredients': Ingredients, 'pizza': Pizza,
             'order': Order, 'order_history': Order_history,
             'quantity_stocks': Quantity_stocks, 'recipe': Recipe}

instancedict = {'account': [], 'address': [], 'restaurant': [],
                'customer': [], 'staff': [], 'ingredients': [],
                'pizza': [], 'order': [], 'order_history': [],
                'quantity_stocks': [], 'recipe': []}

table_data_dict = {}

for table in tablelist:
    table_data_dict[table] = GetColumnNames(pcursor, table)

for entry in dataset:
    for key in classdict:
        if entry == key:
            for element in dataset[key]:

                instancedict[key].append((classdict[key](element)))

for classname in instancedict:
    for t_name in table_data_dict:
        if t_name == classname:

            idx = 0
            column_list = table_data_dict[t_name]
            values_dict = {}

            for objects in instancedict[classname]:

                values_list = []

                for column in table_data_dict[t_name]:

                    attr = getattr(instancedict[classname][idx], column)
                    values_list.append(attr)

                    if idx == len(instancedict[classname]):
                        idx = idx - 1
                        print('oor')
                Insert_data(pcursor, t_name, values_list, column_list, cnx)
                idx = idx + 1
