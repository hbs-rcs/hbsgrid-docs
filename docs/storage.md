# Research Data Storage

## Data Storage on the HBSGrid

HBS provides storage for active research projects. Research storage is 
typically used in conjunction with the computer cluster (HBSGrid) and accessed 
via *NoMachine* remote desktop as documented in the [Userguide](index.md).

There are three sets of storage locations available
for research work, depending on the particular usage patterns, size
consideration, and number of people involved in the work. These are the
[home folders](storage.md#home-folders), [scratch folders](storage.md#scratch-storage),
and [project spaces.](storage.md#project-spaces)

| Folder Type | Size | Expandable? | Shareable? | Backed up? | Other Considerations|
| --- | --- | --- | --- | --- | --- |
| [Home](storage.md#home-folders) | 150GB <br>(100GB for guests)* | No | No | Yes | This is a personal folder with size limitations that cannot be shared with others.|
| [Scratch](storage.md#scratch-storage) | Varies | Yes | Yes | No | Files older than 60 days are deleted and files are **not backed up**. This is SSD storage that is faster than other storage options.|
| [Project](storage.md#project-spaces) | Default is 50GB | Yes | Yes | Yes | These folders are meant for collaboration and/or projects that may increase in size over time. |      

*Default sizes for home folder have grown over time. If you received your HBSGrid account prior to 2024, you may have a smaller home directory  

### Home folders {#home-folders}

By default, when your account is created (whether this account is
used for just storage or storage + computing), a home folder is created. Home folders are 150GB (or 100GB for guests) and cannot be expanded (note: default sizes for home folder have grown over time. If you received your HBSGrid account prior to 2024, you may have a smaller home directory).

If you are logging in to the HBSGrid to do work via the NoMachine GUI or
terminal, you are automatically placed in and are using this home
folder. This is located at:

`/export/home/<group>/<username>`

For example faculty member John Harvard's home folder would be at:

`/export/home/faculty/jharvard`

When space in your home folder fills up, **you will not be able to do any more work**, which may
lead to programs acting strangely or crashing altogether, disk error
notices, or input/output errors. Keep an eye on your space usage and 
periodically remove any old files that are no longer needed. 

Home folders are backed up every night. If you should need to recover
any files due to accidental deletion or corruption, please
[contact RCS](mailto:research@hbs.edu).

!!! warning 
#### Reaching your home folder limit can prevent *NoMachine* sessions from starting, and this is one of the most common reasons for difficulties connecting to the HBS Grid desktop via NoMachine. {#home-folder-quota}
        
You can fix this problem yourself in a few ways:
        
1.  **By Terminal**: Open a terminal (in the Windows search toolbar, type "Cmd" or "Windows PowerShell"; in the Mac search toolbar, type "Terminal") and run
       ```sh
       ssh <username>@hbsgrid.hbs.edu
    ```
    (replace `<username>` with your actual HBS Grid username). Once connected you can use terminal commands like `ls` to list files in the directory, `rm` (remove) plus the name of the file to remove files you don't need,
    or `mv` (move) plus the name of your file and a path to a new location to move files. Removing and moving files can help get your home directory back under your storage quota. You can also run `gio trash --empty` to empty the trash, which may give you enough breathing room to permit NoMachine login.
            
2. **By GUI**: Use a [GUI SFTP client like FileZilla or CyberDuck](https://hbs-rcs.github.io/hbsgrid-docs/syncfiles/#transfer-data-fromto-local-storage) to log into your storage and clean up your home directory by moving/deleting files and emptying your trash folder.  

### Scratch storage {#scratch-storage}

Whether you are doing batch or interactive work, at times you may need a
temporary location to stash files that you will not keep, or your
software may require a 'working', or temporary, directory. In most
cases, you should not use your home folder, as there are quota limits,
and the temporary needs may exceed the amount available.

The storage location at `/export/scratch` is designed specifically for this purpose. See the next section for setting up and using a temporary folder on this volume.

_Nota bene_:

-   This volume is a shared, community area. Be mindful of your usage (how much you use and for how long).
-   This filesystem is not backed up! Ensure you copy anything important back to your home or project folder.
-   Files older than 60 days will be deleted nightly via disk cleanup scripts. Do not interfere with these scripts.

Please see our [RCS Policies page](https://www.hbs.edu/research-computing-services/about-us/terms-of-service/policies.aspx#scratch)
for more information about our scratch usage policies. 

#### Using `/export/scratch` effectively {#using-scratch}

As this volume is a shared area visible by everyone, it is important that you follow best practices for its use:

-   Do not store any files in the top-level.

-   Use the Create Scratch Folder script to create your temporary folder. This will open a terminal / 
    text window that will guide you through the process of naming your folder and setting the correct permissions.
    For folder naming, we recommend prefixing the folder with either your account name or the project name. To start:
    
    -   In the NoMachine GUI, select from the menubar Applications > Other > Create Scratch Directory.

    -   In terminal, execute the command `/usr/local/app/scripts/create_scratch_folder.sh`

-   Clean up files when you no longer need them, so that others can use the additional space immediately. Please note that this includes [undeleted trash files on scratch](storage.md#undeleted-files-scratch). Although your trash may appear empty, 'trashed' files may still exist in a hidden folder and take up space. 

If you should need to keep files on the scratch volume for longer than 60 days, please contact RCS.  

#### Undeleted Trash files on Scratch {#undeleted-files-scratch}
Although your Trash may appear empty,  'trashed' files may still exist in a hidden folder on scratch. To check whether this is the case, run `ls -al /export/scratch` and see whether a .Trash folder with your username is listed.
 
We recommend that you review and 'delete permanently' the files in your NoMachine/Gnome Trash. If you are still uncertain or your Trash folder is empty, you can delete your "trash" folder on `/export/scratch` with one of the following three terminal commands:
 
- `rm -ri /export/scratch/.Trash-$(id -u $USER)`    # to be prompted for every file
- `rm -rI /export/scratch/.Trash-$(id -u $USER)`    # to be prompted, but less intrusive
- `rm -rf /export/scratch/.Trash-$(id -u $USER`)    # NO PROMPT

### Project spaces {#project-spaces}

Project spaces (folders) are the primary, recommended location for
storing and doing collaborative work on research storage, including HBS
and guest user accounts. This is in contrast to home folders, which are
accessible only by the account holder. 

The default size is 50GB, with increases granted upon request and with
space available. Keep an eye on the space usage, as project spaces that
reach capacity will throw errors in programs and when transferring
files, and data loss may result.

Project spaces are backed up every evening. If you should need to recover any files due to accidental deletion or
corruption, please [contact RCS](mailto:research@hbs.edu).

#### Requesting a project space {#requesting-a-project-space}

Project spaces can be set up with faculty sponsorship and/or approval by
filling out the [New Project Space Request
Form](https://secure.hbs.edu/accountManagement/secure/research/projectspace/new).

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
Form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUOEJQSUFSUkpUVUFRUEFHQzZGOVVMODNNRy4u).

#### Archiving a project space {#archiving-a-project-space}

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
Please note that RCS provides limited support for databases.

### Connecting to your Database {#connecting-to-your-database}

Please contact us at <research@hbs.edu> for connection parameters including
*USER*, *HOSTNAME*, and *CA Certificates*. Note that some clients 
(including *DBeaver*) require you to set the *SSL CA Certificate*.
**Connections from outside the HBS Grid always require an RCS-proviced SSL CA Certificate**.

#### Configuration {#configuration-database}

Most *MySQL* clients will read connection information from a
configuration file found in `~/.my.cnf`. This file is used to store
connection details to the MariaDB server, such as account details and
connection parameters. If you don't have this file (on the Grid) you
may [request](mailto:research@hbs.edu) a template or create your own
with the following details:

!!! important inline end
    
    A configuration file with all connection details enables database
    access by anyone with access to the file. Ensure that this file is
    not shared or accessible by anyone but you.

```
[client]
host=HOSTNAME
port=3306
ssl-ca=PATH_TO_SSL_CERT
database=jharvard
user=jharvard
password=PASSWORD
```

Please note that you will substitute *jharvard* and *PASSWORD* with
your MariaDB username and password. For the other parameters such as
*HOSTNAME*, please contact us at <research@hbs.edu>.

Once your **.my.cnf** is ready, move it your home directory and 
**adjust file privileges to ensure no one else can read the file**. On the Grid or
on a Linux or Mac local machine, you may prevent others from reading the
file by opening a *Terminal* and running this command:

`chmod 700 ~/.my.cnf`

**************************

You can connect to your database using any compatible client. If you 
already have one you like, feel free to use that. Otherwise we recommend
one of the clients listed below. 

| :warning: WARNING                                                                        |
|:-----------------------------------------------------------------------------------------|
| If you are connecting to MariaDB on the cluster, please be advised that there is a known bug in the current environment. If you'd like to connect to the database using software on the cluster (e.g., R, Python), please select the `rcs/rcs_2022.11` software environment version in the interactive launcher or in Terminal. If you'd like to use DBeaver, launch a Terminal session, load the the previous environment (`ml load rcs/rcs_2022.11`), and then once loaded launch DBeaver by typing `dbeaver` in the Terminal.|

=== "Python"  

    Use [connector-python](https://dev.mysql.com/doc/connector-python/en/) to connect following the 
    [official documentation](https://dev.mysql.com/doc/connector-python/en/connector-python-example-connecting.html).
    It is recommended to [use connection settings from `~/.my.cnf`](https://dev.mysql.com/doc/connector-python/en/connector-python-option-files.html) as described above.

=== "R"  

    Use [RMariaDB](https://rmariadb.r-dbi.org/) or [dbplyr](https://dbplyr.tidyverse.org/), both use connection settings from `~/.my.cnf` as described above.

=== "Desktop and DBeaver"  

    Use [DBeaver](https://dbeaver.io/) to connect following the [official documentation](https://dbeaver.com/docs/wiki/Create-Connection/). 
    Make sure to set the *CA Certificate* path in the *SSL* connection settings tab. The *DBeaver* client may prompt you to download a driver to connect to your database. This is usually safe, and drivers will be stored in your home directory,     under `~/.local/share/DBeaverData/drivers`

=== "Terminal"  

    The [mycli](https://www.mycli.net/) client uses connection settings from `~/.my.cnf` as described above.


**************************

### Importing Data {#importing-database}
The following is a basic overview of the import process. Complete documentation for the `LOAD DATA` command can be found at [https://mariadb.com/kb/en/library/load-data-infile/](https://mariadb.com/kb/en/library/load-data-infile/).

1. Move your data to an import folder
2. Create the database table that will hold the imported data
3. Import the data
4. Validate the import
5. Remove your data from the import folder
   
To create the database table (step 2), you will need to know the name of all columns, each column’s data type (integer, numeric with decimals, string of characters, etc), and each column’s maximum width. For example, if one of the columns in your data is US phone numbers of the format 6174953292, then you may opt to use int(10) as the column data type (i.e., integer with up to 10 digits). However, if you suspect some entries have dashes such as 617-495-3292, then you will need to use char(12) which stores the data as a string of characters, up to 12 characters in length.

#### Import Example

We will use the following to illustrate importing:  
MariaDB username = jharvard  
MariaDB database = jharvard_database  
MariaDB database table = table_import  
Import filename = SampleData.txt  

Data:  

| COLUMN_1 | COLUMN_2 | COLUMN_3 |
| --- | --- | --- |
| 25 | Harvard | Way |
| 86| Brattle | St | 

##### 1. Move your data to the appropriate import folder  
Prepare an import folder and ensure it has the appropriate permissions:   
`mkdir /export/mdb_external/import/jharvard`  
`chmod 700 /export/mdb_external/import/jharvard`   

Move your data to this import folder:  
`mv SampleData.txt /export/mdb_external/import/jharvard`  

##### 2. Create the database table that will hold the imported data  
Log into MariaDB:  
`mysql -h HOSTNAME -u jharvard -p`  

Create a database table that will hold imported data, specifying the maximum size of each column. For example, below we specify that all columns are char with a maximum length of 20. You can modify your table at a later time, e.g., switching from  char(20) to char(30):  
`use jharvard_database; create table table_import (Column_1 char(20), Column_2 char(20), Column_3 char(20));`  
 
##### 3. Import the data:  
`load data local infile ‘/export/mdb_external/import/jharvard/SampleData.txt’ into table table_import fields terminated by ‘|’ lines terminated by ‘\n’ ignore 1 lines;`

The command above has 4 sections:  
(1) `load data local infile ‘/export/mdb_external/import/jharvard/SampleData.txt’`  
specify file to import  
(2) `into table table_import`  
specify table that will hold the imported data  
(3) `fields terminated by ‘|’ lines terminated by ‘\n’`  
specify delimiters (the character which splits data or text into separate fields). More information about delimiters can be found here: [https://mariadb.com/kb/en/delimiters/](https://mariadb.com/kb/en/delimiters/).    
(4) `ignore 1 lines`  
include this only if your file includes column header information  

Official documentation for this command may be found at [https://mariadb.com/kb/en/mariadb/load-data-infile/](https://mariadb.com/kb/en/mariadb/load-data-infile/).  

##### 4. Validate the import  
Do a preliminary check on the first 10 rows of our data:  
`select * from table_import limit 10;`  

Log out of MariaDB:  
`exit;`  

##### 5. Remove your data from the import folder  
`rm -rf /export/mdb_external/import/jharvard`  

### Exporting Data {#exporting-database}
The following is a basic overview of the export process followed by an example. Complete documentation for the `SELECT … INTO FILE` command to be run within MariaDB may be found at [https://mariadb.com/kb/en/library/select-into-outfile/](https://mariadb.com/kb/en/library/select-into-outfile/).

1. Prepare export folder such that it is accessible to everyone
2. Export data
3. Change access rules to export folder
4. Copy your data out of the export folder
5. Remove export folder
   
Please note that you will be copying your data to a new file, not moving it. This ensures you are the owner of the file, as opposed to the MariaDB server. Additionally note that your exported data will **NOT** include column headers/names!

#### Export Example  

We will use the following to illustrate importing:  
MariaDB username = jharvard  
MariaDB database = jharvard_database  
MariaDB database table = table_import  
Import filename = SampleData.txt  

Data:

| COLUMN_1 | COLUMN_2 | COLUMN_3 |
| --- | --- | --- |
| 25 | Harvard | Way |
| 86| Brattle | St | 
 
##### 1. Prepare export folder such that it is accessible to everyone
Prepare an export folder and ensure it has the appropriate permissions:  
`mkdir /export/mdb_external/export/jharvard`  
`chmod 777 /export/mdb_external/export/jharvard`  

##### 2. Export data
Log into MariaDB:  
`mysql -h HOSTNAME -u jharvard -p`  

Within MariaDB, export the data:  
`select * from table_import into outfile ‘/export/mdb_external/export/jharvard/my_export.dat’ fields terminated by ‘|’ lines terminated by ‘\n’;`  

Please note our command has 3 sections:  
(1) `select * from table_import`  
specify what data you want export  
(2) `into outfile ‘/export/mdb_external/export/jharvard/my_export.dat’`  
specify the export file  
(3) `fields terminated by ‘|’lines terminated by ‘\n’`  
specify delimiters (the character which splits data or text into separate fields). More information about delimiters can be found here: [https://mariadb.com/kb/en/delimiters/](https://mariadb.com/kb/en/delimiters/).      

Official documentation for this command may be found at [https://mariadb.com/kb/en/mariadb/select-into-outfile](https://mariadb.com/kb/en/mariadb/select-into-outfile).  

Log out of MariaDB:  
`exit;`  

##### 3. Change access rules to export folder  
`chmod 700 /export/mdb_external/export/jharvard`  

##### 4. Copy your data out of the export folder  
*Copy* (`cp`), *don't move*, the data to ensure you have ownership as opposed to the MariaDB server: 

Option 1: Copy data to your home dir:  
`cp /export/mdb_external/export/jharvard/my_export.dat ~/`  

Option 2: Copy data to your project space:  
`project_space cp /export/mdb_external/export/jharvard/my_export.dat /export/projects/project_space`  

##### 5. Remove export folder  
`rm -rf /export/mdb_external/import/jharvard`  

### Additional MariaDB Resources {#additional-mariadb-resources}

-   [MariaDB Documentation](https://mariadb.com/kb/en/mariadb/documentation/)
-   [Getting Started with MariaDB](https://mariadb.com/products/get-started)
