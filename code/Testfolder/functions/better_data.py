
def Better_insert_data(cursor, ObjectList, target_table, cols, val_names, cnx):

    attr_names= ""
    key_list = ObjectList[0].__dict__.keys()
    for key in key_list:
        print(key, type(key))
        attr_names = attr_names+key+", "

    for element in ObjectList:
        data_insertion = f"""INSERT INTO {target_table}
        ({attr_names})
        VALUES({vals})"""
