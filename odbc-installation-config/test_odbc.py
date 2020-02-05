import pyodbc
server = 'tcp:SL000396.rsint.net'
database = 'SQSA_19_3_ml'
username = 'sa'
password = 'pw'
cnxn = pyodbc.connect('DRIVER={/opt/microsoft/msodbcsql17/lib64/libmsodbcsql-17.5.so.1.1};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()
cursor.execute("SELECT @@version;")
row = cursor.fetchone()
while row:
    print row
    row = cursor.fetchone()