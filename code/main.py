import psycopg2
import json
from functions.get_names import GetColumnNames, GetTableNames
from management.data_insertion import Insert_data

from models import *

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

for entry in dataset:
    # print(entry)

    for key in classdict:
        # print('test done')
        if entry == key:
            for element in dataset[key]:
                # print(element)
                instancedict[key].append((classdict[key](element)))
                # print('insertion done')
                # print(type(classdict[key](element)))

for classname in instancedict:
    for t_name in table_data_dict:
        if t_name == classname:
            # print(table_data_dict[t_name], 'for table :', t_name)  # col list
            idx = 0
            column_list = table_data_dict[t_name]
            values_dict = {}
            # print(t_name, column_list)

            for objects in instancedict[classname]:

                values_list = []

                for column in table_data_dict[t_name]:

                    attr = getattr(instancedict[classname][idx], column)
                    # print(attr)
                    values_list.append(attr)
                    if idx == len(instancedict[classname]):
                        idx = idx - 1
                        print('oor')
                print(t_name)
                print(values_list)
                print(column_list, '\n')
                Insert_data(pcursor, t_name, values_list, column_list, cnx)
                idx = idx + 1
# print('\n')
