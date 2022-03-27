# Stata

Stata uses a generic connection protocol called ODBC to connect to
databases. The instructions below are meant to provide guidance on
configuring your environment as well as configuring Stata. Once you are
able to connect to your database, you should review available
ODBC-specific Stata commands. The ODBC manual for Stata may be found at
https://www.stata.com/manuals/dodbc.pdf. To help get you started, here
are a few basic commands:


I. Load all data from a database table called **sampletable**, and
specify the Data Source Name (**dsn**) as **MariaDB**

`odbc load, exec("select * from sampletable") clear dsn ("MariaDB")`

The entire table "sampletable" is loaded into STATA and you can Browse
it in STATA\'s Data Editor:

![](https://hbs.edu/research-computing-services/Shared%20Documents/Grid/windows_stata_odbc3.png){style="max-width:650px;"}

If you would like to load data from a table within another database,
then replace **MyTable** with DATABASE.TABLE (please note the period
between database name and table name) such as **ProjectDB.ProjectTable**

II. You can also see the structure of the database table using

`odbc load, exec("DESCRIBE sampletable") clear dsn ("MariaDB")`

This time the data dictionary of the table "sampletable" is loaded
into STATA and you may view it with the STATA Data Editor:

![](https:/hbs.edu/research-computing-services/Shared%20Documents/Grid/windows_stata_odbc2.png){style="max-width:650px;"}

## Stata on the Grid, interactive session {#stata-on-the-grid-interactive-session}

These instructions will guide you to connecting to a database while in
an interactive Stata session. RCS already provides an appropriate ODBC
driver on the Grid. However, you need to ensure you have an
**.odbc.ini** configuration file in your Grid home directory. If you do
not have this file, then you must first create it. To do so, please
review the instructions found under the **Configuration Files** section
[Configuration Files](configuration-files-recommended-for-connecting.md)

Once you have your local **.odbc.ini** file and have launched Stata
within NoMachine, you should ensure the Stata ODBC manager parameter is
set to unixODBC and that you can query available Data Source Names.
Please enter the following Stata commands as shown in the screenshot
below:

`set odbcmgr unixodbcodbc list`

![](https://hbs.edu/research-computing-services/Shared%20Documents/Grid/db-connecting-stata-query-dsn.png){style="max-width:650px;"}

## Troubleshooting {#troubleshooting}

If you get an error, then you may have previously tried to run an ODBC
command in the current Stata session. The ODBC manager must be set
correctly (i.e. to unixODBC) before any ODBC commands may be run.
Otherwise, changes to the ODBC manager parameter will not take effect.
To remedy this problem, please restart your Stata session and set the
ODBC manager to unixODBC before trying any other commands. If you still
get an erorr, then please [contact Research Computing
Services](mailto:research@hbs.edu).

If you do not get any results after running **odbc list** and did not
receive an error, then your **.odbc.ini** file is not correctly set.
Please review the instructions found under the **Configuration Files**
section
(configuration-files-recommended-for-connecting.md).
You may [contact Research Computing Services](mailto:research@hbs.edu)
for assistance.

## Next Steps {#next-steps}

The next step is to test if your Data Source Name is correctly
configured. Please select a Data Source Name (e.g. **MyDataSourceName**)
and run the following command:

`odbc query "MyDataSourceName"`

![](https://hbs.edu/research-computing-services/Shared%20Documents/Grid//research-computing-services/Shared%20Documents/Grid/db-connecting-stata-query-dsn-tables.png){style="max-width:650px;"}

## Troubleshooting {#troubleshooting-1}

If you receive an error, then please verify

-   your username and password are correct within your local
    **.odbc.ini**
-   the SSL path is correct within your local **.odbc.ini**
-   the driver group within your local **.odbc.ini** matches an
    appropriate driver group within the system **odbcinst.ini**

## Data Source Name is correctly configured {#data-source-name-is-correctly-configured}

If your **odbc query** command retrieved the correct list of tables
without error, then your connection is all set!

## Stata on your Local Windows {#stata-on-your-local-windows}

Windows users will need to first download the latest ODBC driver and
configure ODBC data sources. Please follow our detailed instructions on
our [ODBC Page](odbc.md).

Once you have your ODBC set up you may launch Stata and run the command
**odbc list** to confirm Stata can see the new Data Source you just
configured. To test that Stata may connect to the MariaDB server, run
the **odbc query** command:

![](https://hbs.edu/research-computing-services/Shared%20Documents/Grid/windows_stata_odbc.png){style="max-width:650px;"}

The **odbc query** command will query for available tables within your
database. If you did not provide a database name, then the result with
be **null**. If your **odbc query** command retrieved the correct list
of tables without error, then your connection is all set!

## Stata on your Local Mac {#stata-on-your-local-mac}

If you do not have ODBC set up on your Mac please follow the detailed
instructions on our [ODBC page](odbc.md).
Once your ODBC is set up you may launch Stata and run the command **odbc
list** as shown above to confirm Stata can see the new Data Source you
just configured. Similarly you may then run **odbc query** to retrieve
the list of tables in your database.
