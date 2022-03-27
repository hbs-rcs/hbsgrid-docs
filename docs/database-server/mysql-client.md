
# MySQL Client

Use the shell program mysql to connect remotely to the MariaDB server.
Or use the free MySQL Workbench GUI. Steps involved are:

**Command-line:** Install the mysql client for your system. Follow the
instructions for installing the MySQL server and utilities, but do not
turn on or run the MySQL server or server deamon.

-   ***Mac:***
    -   download at https://dev.mysql.com/downloads/mysql/, and select
        Mac OS X.
    -   download at
        https://dev.mysql.com/doc/refman/5.7/en/osx-installation-pkg.html
-   ***Windows:***
    -   download at https://dev.mysql.com/downloads/mysql/, and select
        Microsoft Windows.
    -   instructions at
        https://dev.mysql.com/doc/refman/5.7/en/mysql-installer.html

**GUI:** This installs only a front-end GUI for use. Download at
https://dev.mysql.com/downloads/workbench/ and follow the usual
installation steps to install the GUI application.

**Both methods:** ensure that the certificate (\'cert\') files given to
you by the RCS staff have been downloaded and are placed in an
accessible location. For the following examples, we\'ll place the cert
file in a folder called \'mariadb_certs\' in our home folder.

***Terminal:***

Open or start your terminal session. To connect to the MariaDB server,
use a command similar to :

` mysql -u username -p -h mariadbhost --ssl-ca=/path/to/file/ca-cert.pem `

Each of these options does the following:

-u username: use your MariaDB account name here

-p: nothing needed. This indicates that you need to supply a password

-h mariadbhost: substitute the hostname of the MariaDB server given to
you by the RCS staff

--ssl-cert: indicates you wish to supply a cert file for encrypting the
communication via SSL. Include the appropriate path format for your
machine.

Two examples are (but don\'t use these as they will not work):

***Mac:*** mysql -u jharvard -p -h mariadb.hbs.edu
--ssl-ca=/Users/jharvard/mariadb_certs/ca-cert.pem

***Windows:*** mysql -u jharvard -p -h mariadb.hbs.edu
--ssl-ca=C:\Users\jharvard\mariadb_certs\ca-cert.pem
