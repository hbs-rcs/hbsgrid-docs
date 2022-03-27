
# Database Server Overview

Relational databases have an important place in one's arsenal of
research IT tools. Databases include powerful tools for search and
analysis, and can handle large, complex data sets, enabling bigger
research questions and opportunities, and making research data
management as less complex task.

RCS hosts a database server running MariaDB v10.3, an open source fork
of MySQL, to help meet these growing needs. Our MariaDB server is a Red
Hat 6.5 Linux server with 2x 16 cores hyperthreading processors and a
total of 4.5TB. To obtain a database account, please fill out the [New
MariaDB Account Request
Form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUNVlWWUgwM1dCSjdWWllOVEVDQUtCUUVNMS4u).
RCS also can advise researchers in data storage planning, as well as the
building of and interacting with their database.

Below we provide additional information on how to [connect your database with common tools](overview.md#connecting-to-your-database),
how RCS handles [data backups](overview.md#data-backups),
and [additional MariaDB resources](overview.md#additional-mariadb-resources).

## Connecting to your Database {#connecting-to-your-database}

This section outlines how to connect to your database with the tools
most commonly used by HBS researchers:

-   [Configuration files](configuration-files-recommended-for-connecting.md)
    recommended for connecting
-   [MySQL client](mysql-client.md)
-   [NoMachine](nomachine.md)
-   [NaviCat](navicat.md)
-   [ODBC](odbc.md)
-   [Python](python.md)
-   [SAS](sas.md)
-   [Stata](stata.md)
-   [R](r.md)
-   [Terminal](terminal.md)
    (on the compute grid or from your local machine)

### Connecting with Other Programs {#connecting-with-other-programs}

Many applications support connecting to a database via ODBC. If you
would like to connect to your database with a program not listed, then
please check to see if it has ODBC support. If it does, then please
folow the instructions under the section "Stata" to setup an ODBC
connection.

## Data Backups {#data-backups}

RCS is working towards developing and implementing a feature-rich backup
system. We will notify our users once that system is ready. We have a
proof-of-concept system that will hopefully be ready by the end of the
year.

What you can expect:

-   Regular, automated backup of your data set to a schedule that won't
    interfere with your work
-   On-demand backup

### MariaDB Backups {#mariadb-backups}

RCS has developed a backup system for databases hosted on the RCS
MariaDB server. This system relies on assigning databases to one of
three backup periodicities: daily, weekly, or monthly. Daily backups are
intended for smaller databases undergoing frequent modifications, while
a monthly schedule is more appropriate for large databases or databases
with static content.

#### How do you assign backup periodicity?

We will work with you to determine what best suits your data and
workflow. Typically, a database will initially be assigned to a more
frequent schedule. As your database matures, your database will be
transitioned to a less frequent schedule.

Please note that you may request a backup at any time using a script on
the Grid. Requests are handled automatically and should be fulfilled
within 24 hours. To learn more about submitting requests, please
[contact
RCS](mailto:research@hbs.edu?subject=MariaDB%20backup%20request).

#### When will backups occur?

Databases are designated for daily backup, from Monday to Friday.
Databases which are designated for weekly or monthly backup will be
backed up over the weekend. Any backup request should be fulfilled
within 24 hours.

#### How do I check the backup periodicity of my database, or when the last backup occurred?

Please [contact
RCS](mailto:research@hbs.edu?subject=Questions%20about%20MariaDB%20backups)
about this.

## Additional MariaDB Resources {#additional-mariadb-resources}

-   [MariaDB Documentation](https://mariadb.com/kb/en/mariadb/documentation/)
-   [Getting Started with MariaDB](https://mariadb.com/products/get-started)
