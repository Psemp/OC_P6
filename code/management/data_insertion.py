
def Insert_data(cursor, target_table, values_dict, colunms_list, cnx):
    insertion_query = f"""INSERT INTO {target_table}
        ({colunms_list})
        VALUES({vals})"""
    vals = 0
    cursor.execute(insertion_query, vals)
