
def Insert_data(cursor, object_list, table_data_dict, cols, cnx):
    for table in table_data_dict:
        insertion_query = f"""INSERT INTO {table.key}
            ({cols})
            VALUES({vals})"""
        vals = 0
        cursor.execute(insertion_query, vals)
