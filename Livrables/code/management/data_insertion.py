
def Insert_data(cursor, target_table, values_list, colunms_list, cnx):

    def List_to_str(w_list, apostrophe):
        valid_str = ""
        for word in w_list:
            if apostrophe is True:
                valid_str = valid_str + f"'{word}'" + ', '
            else:
                valid_str = valid_str + word + ', '

        valid_str = valid_str[:-2]
        return valid_str

    values_str = List_to_str(values_list, True)
    columns_str = List_to_str(colunms_list, False)
    insertion_query = f"""INSERT INTO oc_p6_test.{target_table}
        ({columns_str})
        VALUES({values_str});"""
    cursor.execute(insertion_query)

    cnx.commit()
