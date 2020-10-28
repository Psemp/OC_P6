
def Better_insert_data(cursor, ObjectList, target_table, cols, val_names, cnx):
    for element in ObjectList:
        data_insertion = f"""INSERT INTO {target_table}
        ({cols})
        VALUES({vals})"""

