
# NoMachine

We are running MariaDB version 5.5.52. MariaDB is an open source fork of
MySQL. You may access the server by using the **mysql** client. The
database server's host address and port number will be sent to you by
us.

## Using the mysql client while on the Grid {#using-the-mysql-client-while-on-the-grid}

To start your MariaDB session, log onto the HBSGrid
(**researchgrid.hbs.edu**) with your HBS intranet username and
password.You may log in either with a terminal session (e.g. using
Terminal on Mac or Putty on Windows) or via NoMachine. If you have
logged in with NoMachine, then you will need to start a terminal session
within NoMachine. To do so right-click on the desktop and select **Open
in Terminal**.

![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/website_db_pic_1.png)

Within your terminal session, the syntax for running the **mysql**
client is:

`mysql -h HOSTNAME -u USERNAME -p`

Once you enter the above, you will next be prompted to enter your
MariaDB password, as shown below:

![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/connectexample_website.png)

Once logged in, you should open your working database with the **use**
command. As an example, the user **pjonak** can open their personal
database via

`use jharvard;`

![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/mariadb_password_2.png)

## Changing Your Password {#changing-your-password}

For details please refer to the 'USER ACCOUNT AND LOG IN DETAILS'
section.
