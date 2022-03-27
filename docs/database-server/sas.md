
# SAS

## SAS on your Local Windows Machine {#sas-on-your-local-windows-machine}

SAS uses ODBC to connect to MariaDB. Please refer to our [ODBC section](odbc.md)
on how to set up your ODBC driver and configure your Data Source.

Once your connection settings are validated you may launch SAS and
assign your MariaDB database in the libname statement. In the example
below `myMariaDB points to a personal database while
`projectMariaDB` points to a project database. In the first `libname`
statement `datasrc= 'RCS_MariaDB'` refers to the personal database that
was already set up in ODBC Data Source; and `datasrc= 'MariaDB2'` in the
second libname statement refers to the project database that was also
established in ODBC Data Source.

` libname myMariaDB odbc user= 'username' password= 'password' datasrc= 'RCS_MariaDB';`
` libname projectMariaDB odbc user= 'username' password= 'password' datasrc= 'MariaDB2';`

Once your libname statements are successfully run you can continue on
with your SAS codes.
