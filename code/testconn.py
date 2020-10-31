import psycopg2
from functions.get_names import GetColumnNames, GetTableNames

cnx = psycopg2.connect(
    database="OC_P6_Test",
    user="postgres",
    password="destroy-whenever-nature-medieval",
    host="localhost",
    port="5432",
)

pcursor = cnx.cursor()


def GetTableNamesOld(cursor):

    cursor.execute("""SELECT *
    FROM pg_catalog.pg_tables
        WHERE schemaname = 'oc_p6_test';""")

    plist = []
    plist = cursor.fetchall()

    for line in plist:
        print(line[1])


tablelist = GetTableNames(pcursor)

# TEST
print(tablelist)
# /TEST

table_data_dict = {}

for table in tablelist:
    table_data_dict[table] = GetColumnNames(pcursor, table)

print(table_data_dict)
