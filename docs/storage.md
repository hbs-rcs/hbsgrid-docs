# 💾 Research Data Storage and Databases

!!! info inline end "Mount Grid storage locally"
    Research storage is also accessible [on Windows as a network drive](https://support.microsoft.com/en-gb/windows/map-a-network-drive-in-windows-29ce55d1-34e3-a7e2-4801-131475f9557d) at `\\research.hbs.edu` and [via SMB on OSX/Linux](https://support.apple.com/lt-lt/guide/mac-help/mchlp1140/mac#mchlp1265542) 
    at `smb://research.hbs.edu` and via SSH at `hbsgrid.hbs.edu`.

HBS provides storage for active research projects. Research storage is 
usually used in conjunction with HBS Grid compute and we recommend accessing 
it via *NoMachine* remote desktop as documented in the [Userguide](syncfiles.md). 

There are three different sets of storage locations that are available
for research work, depending on the particular usage patterns, size
consideration, and number of people involved in the work. These are the
[home folders](storage.md#home-folders), [scratch folders](storage.md#scratch-storage),
and [project spaces.](storage.md#project-spaces)

## Home folders {#home-folders}

By default, when your grid account is created (whether this account is
used for just storage or storage + compute), a home folder is created as
well.

If you are logging in to the HBSGrid to do work via the NoMachine GUI or
terminal, you are automatically placed in and are using this home
folder. This is located at:

`/export/home/<group>/<username>`

For example faculty member John Harvard's home folder would be at:

`/export/home/faculty/jharvard`

Home folders vary in size by the program or role that you have. When
your space fills up, you will not be able to do any more work, which may
lead to programs acting strangely or crashing altogether, disk error
notices, or Input/Output errors. Keep an eye on your space usage and 
periodically remove any old files that are no longer needed.

Home folders are backed up every night. If you should need to recover
any files due to accidental deletion or corruption, please
[contact RCS](mailto:research@hbs.edu).

In addition to home folders, project spaces are another location of disk
storage space, and are described in the next section.

## Scratch storage {#scratch-storage}

Whether you are doing batch or interactive work, at times you may need a
temporary location to stash files that you will not keep, or your
software may require a 'working', or temporary, directory. In most
cases, you should not use your home folder, as there are quota limits,
and the temporary needs may exceed the amount available.

The storage location at `/export/scratch` is designed specifically for this purpose.
Note:

-   This is a shared area, so use Unix file permissions to change the
    accessibility if needed.
-   Files older than 60 days will be deleted at monthly maintenance
    periods.
-   The /export/scratch filesystem is not backed up, so please copy back
    to your home or project folder any files or folders you wish to keep
    long-term.

Please see our [RCS Policies page](https://www.hbs.edu/research-computing-services/about-us/terms-of-service/policies.aspx#scratch)
for more information about our scratch usage policies.

## Project spaces {#project-spaces}

Project spaces (folders) are the primary, recommended location for
storing and doing collaborative work on research storage, including HBS
and guest user accounts. This is in contrast to home folders, which are
accessible only by the account holder. Both home folders and project
spaces are backed up every evening. 

The default size is 50GB, with increases granted upon request and with
space available. Keep an eye on the space usage, as project spaces that
reach capacity will throw errors in programs and when transferring
files, and data loss may result.

If you should need to recover any files due to accidental deletion or
corruption, please [contact RCS](mailto:research@hbs.edu).


### Requesting a project space {#requesting-a-project-space}

Project spaces can be set up with faculty sponsorship and/or approval by
filling out the [New Project Space Request
Form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhURFhFT09aVVJEQ0tQM1JRMjJOOTg0SFpZQi4u). 

If you are working with level 3 data or higher, we will ask you to
submit documentation from the IRB or a Data Usage Agreement (DUA; a
[sample can be found
here](https://www.hbs.edu/research-computing-services/Shared%20Documents/Training/sample_l3_data_usage_agreement.pdf))
so that we can ensure that the project space's security levels are
appropriately set up. If you are unsure what level your data falls
under, [please review this page on data
security](https://security.harvard.edu/dct).

If a project space already exists and you would like to make changes to
the space users or size, fill out the [Project Space Change Request
Form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUOEJQSUFSUkpUVUFRUEFHQzZGOVVMODNNRy4u). Once
approved by the appropriate faculty member, the request will be put in
to the ESS group at HBS IT.

### Archiving a project space {#archiving-a-project-space}

Project space usage is reviewed and confirmed on a yearly basis.
Inactive project spaces will be backed up and archived only after
contacting the primary faculty sponsor. Archives are retained for the
period of time specified by HU or HBS data retention policies, whichever
is longest. If you would like to unarchive a project space, [contact
RCS](https://www.hbs.edu/research-computing-services/contact-us/Pages/default.aspx){target="_blank"}.

For information about how to archive your data to an external drive, see
our [technical note on archiving your research
files](https://www.hbs.edu/research-computing-services/help/technical-how-tos-and-technical-notes/archiving-your-research-files.aspx){target="_blank"}.


## SQL Databases

RCS hosts a database server running MariaDB (an open source fork
of MySQL) to help meet growing data storage needs.
To obtain a database account, please fill out the [New
MariaDB Account Request
Form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUNVlWWUgwM1dCSjdWWllOVEVDQUtCUUVNMS4u).
RCS also can advise researchers in data storage planning, as well as the
building of and interacting with their database.

### Connecting to your Database {#connecting-to-your-database}

Please contact us at <research@hbs.edu> for connection parameters including
*USER*, *HOSTNAME*, and *CA Certificates*. Note that some clients 
(including *DBeaver*) require you to set the *SSL CA Certificate*.

!!! info inline end "DBeaver driver installation"
    The *DBeaver* client may prompt you to download a driver to connect to your database.
    This is usually safe, and drivers will be stored in your home directory, under
    `~/.local/share/DBeaverData/drivers`

You can connect to your database using any compatible client. If you 
already have one you like go ahead and use that. Otherwise we recommend
one of the following:

- **Python**: [connector-python](https://dev.mysql.com/doc/connector-python/en/)
- **R**: [RMariaDB](https://rmariadb.r-dbi.org/) or [dbplyr](https://dbplyr.tidyverse.org/)
- **Desktop**: [DBeaver](https://dbeaver.io/)
- **Terminal**: [mycli](https://www.mycli.net/)

Some *MySQL* clients will read connection information from a
configuration file found in `~/.my.cnf`. This file is used to store
connection details to the MariaDB server, such as account details and
connection parameters. If you don't have this file (on the Grid) you
may [request](mailto:research@hbs.edu) a template or create your own
with the following details:

    [mysql]
          host=HOSTNAME
          port=3306
          ssl-ca=PATH_TO_SSL_CERT
          database=jharvard
          user=jharvard
          password=PASSWORD

Please note that you will substitute *jharvard* and *PASSWORD* with
your MariaDB username and password. For the other parameters such as
*HOSTNAME*, please contact us at <research@hbs.edu>.

Once your **.my.cnf** is ready, move it your home directory and adjust
file privileges to ensure no one else can read the file. On the Grid or
on a linux or Mac local machine, you may prevent others from reading the
file by opening a *Terminal* on the HBS Grid and running this command:

`chmod 700 ~/.my.cnf`

### Additional MariaDB Resources {#additional-mariadb-resources}

-   [MariaDB Documentation](https://mariadb.com/kb/en/mariadb/documentation/)
-   [Getting Started with MariaDB](https://mariadb.com/products/get-started)
