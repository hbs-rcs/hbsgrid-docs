
# Terminal

You can connect to MariaDB from Terminal. You would need to first log
into the grid. For detailed instructions on grid login please refer to
[grid access via Terminal](../compute-cluster/logging-in.md#Terminal).

Once your terminal session is running, you can connect to the MariaDB
server using a command similar to the following:

`mysql -h hostname -u username -p`

Each of these options does the following:

-u username: use your MariaDB account user name sent to you by a RCS
staff here.

-p: nothing needed. This indicates that once prompted you need to supply
your MariaDB password sent to you by a RCS staff.

-h hostname: substitute the hostname of the MariaDB server given to you
by the RCS staff

Once the above mysql command is entered you will be prompted to enter
your MariaDB password. When you see the **MariaDB \[(none)\]\>** prompt
you have successfully logged into MariaDB.

![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/mariadb_login.png){style="max-width:650px;"}
