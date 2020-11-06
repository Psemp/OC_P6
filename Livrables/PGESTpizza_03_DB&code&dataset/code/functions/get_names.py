
def GetTableNames(cursor):

    cursor.execute("""SELECT *
    FROM pg_catalog.pg_tables
        WHERE schemaname = 'oc_p6_test';""")

    result = []
    result = cursor.fetchall()

    table_list = []

    for line in result:
        table_list.append(line[1])

    return table_list


def GetColumnNames(cursor, target_table):

    cursor.execute(f"""SELECT column_name
        FROM information_schema.columns
        WHERE table_name = '{target_table}'""")

    result = []
    result = cursor.fetchall()

    columns = []

    for line in result:
        columns.append(line[0])

    return columns
