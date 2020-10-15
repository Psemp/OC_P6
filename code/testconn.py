import psycopg2

cnx = psycopg2.connect(
    database="OC_P6_Test",
    user="postgres",
    password="destroy-whenever-nature-medieval",
    host="localhost",
    port="5432",
)

pcursor = cnx.cursor()

pcursor.execute("""SELECT *
FROM pg_catalog.pg_tables
    WHERE schemaname = 'oc_p6_test';""")

plist = []
plist = pcursor.fetchall()

for line in plist:
    print(line)
