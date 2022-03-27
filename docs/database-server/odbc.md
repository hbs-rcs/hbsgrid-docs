
# ODBC

ODBC is an API for interacting with databases from any vendor and in any
location. ODBC is widely supported by operating systems (e.g., Windows),
database systems (e.g., MariaDB), and commonly-used tools such as Stata.
This compatibility across environments may come at the expense of
performance. Most users will not notice this drawback. However for
high-performance needs, please contact RCS at <research@hbs.edu> to
discuss alternatives.

ODBC set up is different on Windows versus on the Grid or Mac. Please
refer to the appropriate sections for detailed instructions:

??? note "Setup Instructions for Grid Users"
    
    The HBSGrid already has an ODBC administration tool and appropriate
    ODBC drivers. However, each user needs to configure each of their
    ODBC connections within one **.odbc.ini** file in their home
    directory. The **.odbc.ini** file is described in detail in the
    **[ODBC Configuration
    Files](https://grid.rcs.hbs.org/db-connecting-odbc-nonwindows-config-files){url="https://grid.rcs.hbs.org/db-connecting-odbc-nonwindows-config-files"
    target="_blank"}** section. To check if you already have this file,
    please run the following command

    `ls -a ~/ | grep *odbc.ini ;

    If no results are returned, then you will need to create one or
    request a template from RCS. If you do have an odbc.ini file, then
    you will need to confirm whether you have an existing connection
    with correct parameters or you will need to add a new connection.
    For more details, please see the **.odbc.ini** section of [ODBC Configuration
    Files](https://grid.rcs.hbs.org/db-connecting-odbc-nonwindows-config-files).

    Once your **.odbc.ini** file is ready for testing, please take a
    moment to confirm which **dsn** you will be using for your ODBC
    connection. The **dsn** is the connection group, as described in the
    **.odbc.ini** section referenced above. With the **dsn** in hand,
    run the following command on the Grid, replacing DSN with your
    **dsn**.

    `isql DSN`

    You will hopefully get a "Connected!" message indicating the
    connection was successful. If you did connect, then enter **quit;**
    to exit the isql console. If you did not connect, then please
    confirm you are using the correct **dsn** and that the parameters
    are correctly set. Please [contact RCS](mailto:research@hbs.edu) for
    assistance.


??? note "Setup Instructions for Windows Users"
    
    While MariaDB has developed an ODBC driver, the most-recently-tested
    version does not support SSL connections and therefore will not
    work. Subsequently, we recommend Windows users download and install
    the latest MySQL connector at
    https://dev.mysql.com/downloads/connector/odbc/

    You will be asked to select your OS version for the proper
    installer. If you are unsure of which system type is on your
    machine, then please run the following command ithin the Command
    Prompt:

    `wmic os get osarchitecture`
    ![](https://hbs.edu/research-computing-services/PublishingImages/windows_odbc1.png)

    Once you have the system type, please select the appropriate OS
    Version on the MySQL Connector page for the proper installer. In the
    example below we are selecting the MSI Installer for Windows (x86,
    64-bit):

    ![](https://hbs.edu/research-computing-services/PublishingImages/windows_odbc2.png){style="max-width:500px;"}

    For convenience, please select the MSI installer. You might then be
    taken to the "Begin Your Download" page. You do not need to sign
    up for any account. You can simply scroll down to the bottom and
    select "No thanks, just start my download".

    ![](http://hbs.edu/research-computing-services/PublishingImages/windows_odbc3.png){style="max-width:500px;"}

    Once you have downloaded the installer, run it. When asked to select
    Typical, Complete, or Custom, please select Typical. If you do run
    into issues with the Typical download you can come back and select
    Complete. The example here will be based on the Typical install.

    ![](http://hbs.edu/research-computing-services/PublishingImages/windows_odbc4.png){style="max-width:500px;"}

    After the installation has completed, you will need to configure
    your ODBC data sources with the ODBC Administrator. Windows has a
    built-in ODBC administration tool. To access it, click on the
    Windows Start button, type "**data sources**" and then select
    **Data Sources (ODBC)** as shown below. For users with a Windows
    version earlier than Windows 7, you may not have this tool. Instead,
    you will use **32 Bit Administration Tool**.

    ![](http://hbs.edu/research-computing-services/PublishingImages/windows_odbc5.png){style="max-width:500px;"}

    Within the ODBC Administrator window, please verify that the MySQL
    ODBC connector is present under the **Drivers** tab.

    ![](http://hbs.edu/research-computing-services/PublishingImages/windows_odbc6.png){style="max-width:500px;"}

    Next, switch to the **User DSN** tab, click **Add\...**, and then
    select the appropriate MySQL ODBC connector (there may be two
    versions of the driver, **ANSI** and **Unicode**, in which case RCS
    recommends using **ANSI**) followed by clicking on **Finished**.

    ![](https://hbs.edu/research-computing-services/PublishingImages/windows_odbc7.png){style="max-width:500px;"}

    A new window will open to configure your Data Source. Configuring
    your Data Source should be straightforward. The required fields, as
    shown below, are:

        Data Source Name = Any name may be used, but please do not include spaces
        TCP/IP Server = Our MariaDB host name
        User = MariaDB username
        Password = MariaDB password
        Database = You may leave this blank. It is recommended to use your
        personal database

    Please be sure to click on **Test** to validate your connection
    settings!

    ![](http://hbs.edu/research-computing-services/PublishingImages/windows_odbc8.png){style="max-width:500px;"}

    Now you should see your newly created Data Source Name under the
    **User DSN** tab. Click OK and you are done!

    ![](http://hbs.edu/research-computing-services/PublishingImages/windows_odbc9.png){style="max-width:500px;"}

??? note "Setup Instructions for Mac Users"
    
    Getting ODBC up and running to connect to the MariaDB server at HBS
    consists of four steps: [installing the ODBC
    framework](#odbc_framework){url="#odbc_framework"} , [installing the
    ODBC manager](#odbc_manager){url="#odbc_manager"}, [installing the
    MariaDB ODBC
    driver](#mariadb_odbc_driver){url="#mariadb_odbc_driver"}, and
    [Configuring the ODBC
    Connection](#odbc_connection){url="#odbc_connection"}.

    ### **[]{#odbc_framework}Installing the ODBC Framework**

    Macs can support both unixODBC and iODBC. It is the latter framework
    that is typically used for most Mac OS GUI programs. Download the
    iODBC installer from
    [http://www.iodbc.org/dataspace/iodbc/wiki/iODBC/Downloads](http://www.iodbc.org/dataspace/iodbc/wiki/iODBC/Downloads).

    To install iODBC:

    1.  After downloading iODBC, double-click on the downloaded .dmg
        file.
    2.  Double-click on the installer file, `iODBC-SDK.pkg`, and follow the prompts.

    **Note**: iODBC provides a GUI administrator tool for configuring
    drivers and DSNs (data source names); however, this tool has some
    problems and, therefore, should not be used to create or manage
    DSNs. We will use ODBC Manager instead.

    ### Installing the ODBC Manager {#odbc_manager}

    ODBC Manager is a GUI tool for configuring drivers and
    creating/managing DSNs. Although one can create the required files
    (odbc.ini and odbcinst.ini) by hand, the GUI tool is more
    convenient.

    Please download ODBC Manager from <http://www.odbcmanager.net/>.

    To install the ODBC Manager:

    1.  After downloading ODBC Manager, double-click on the downloaded
        .dmg file.
    2.  Double-click on the installer file, `ODBC Manager.pkg`{.inline
        style="overflow-x: auto;"}, and follow the prompts.

    The installer places the ODBC Manager tool in the
    `/Applications/Utilities`{.inline style="overflow-x: auto;"}
    directory.

    ### Installing the MariaDB ODBC Driver {#mariadb_odbc_driver}

    The final component needed is the ODBC driver itself. This connects
    the ODBC Manager to the local or remote database, and thus is
    specific for the target database system you wish to use. Although we
    are using MariaDB as our relational database server, we prefer to
    use the MySQL ODBC Connector instead.

    Please download the MySQL ODBC Connector from
    <https://dev.mysql.com/downloads/connector/odbc/>

    To install the MySQL ODBC Connector:

    1.  After downloading MySQL ODBC Connector DMG Archive, double-click
        on the downloaded .dmg file.
    2.  Double-click on the installer file,
        `mysql-connector-odbc-8.0.15-macos10.14-x86-64bit.pkg`, and follow the prompts.

    The installer places the ODBC drivers in the appropriate location on
    your hard drive.

    ### Configuring the ODBC Connection {#odbc_connection}

    To configure a DSN on macOS you can use the ODBC Administrator GUI.
    To use ODBC Administrator first open the ODBC Administrator from the
    *`Utilities`{.inline style="overflow-x: auto;"}* folder in the
    *`Applications`{.inline style="overflow-x: auto;"}* folder. From the
    `ODBC Administrator`{.inline style="overflow-x: auto;"} dialog,
    choose the 'User DSN' and click 'Add'**:**

    ![](/research-computing-services/PublishingImages/odbc-mac1.png){style="max-width:500px;"}

    Select the 'Connector/ODBC driver' and click 'OK'. You will be
    presented with the '`Data Source Name`{.inline
    style="overflow-x: auto;"} (DSN)' dialog. Enter 'MariaDB' as the
    `Data Source Name`{.inline style="overflow-x: auto;"} and enter an
    optional `Description`{.inline style="overflow-x: auto;"} for the
    DSN**:**

    ![](/research-computing-services/PublishingImages/odbc-mac2.png){style="max-width:500px;"}

    Click "Add" to add a new keyword/value pair to the panel. Please
    configure the following connection parameters:

    `                            server = HOSTNAMEport = 3306database = jharvarduser = jharvardpassword = PASSWORDsslmode = requiredsslca = PATH_TO_SSL_CERT                            `{style="overflow-x:auto;"}

    noting that you will substitute "jharvard" and "PASSWORD**"**
    with your MariaDB username and password. For the other parameters
    such as 'HOSTNAME', please contact us at <research@hbs.edu>. The
    PATH_TO_SSL_CERT should be the location where you placed the
    "ca-cert.pem" on your local hard drive. If this had been placed in
    your home folder, the path would be
    "/Users/(youraccountname)/ca-cert.pem".

??? note "ODBC Configuration Files for Non-Windows Users"
    
    ### **This section only applies to non-Windows users.**

    ### **[ODBC Configuration Files]{style="color:#b22222;"}**

    ODBC configuration files are important for setting up connection
    parameters to our MariaDB server in a secure manner. We have
    detailed descriptions of the configuration files below.

    ### **.odbc.ini** {#odbc.ini style="color:#b22222;"}

    The **.odbc.ini** configuration file found within your home
    directory is used to store ODBC connection details to any
    ODBC-compliant database server, such as our MariaDB server. This
    file will identify which driver to use for the connection as well as
    user account information and connection parameters to the server.

    All ODBC connections are to be defined within a single **.odbc.ini**
    file. Within this configuration file, each grouping of parameters is
    preceded by **\[GROUP_NAME\]**. This is the **DSN** or **data source
    name**. Stata or any other program you wish to connect to your
    database will require you to specify which **dsn** you want to use.

    *Do I need this file?*

    If you are going to use Stata or any other tool that relies on an
    ODBC connection, then yes you must have this file.

    *I don't have this file (on the Grid). How do I create one?*

    You may [request a template](mailto:research@hbs.edu) or create your
    own with the following details

    ```
    [ODBC Data Sources]
    rcs_mariadb = RCS_MariaDB_ODBC_connection
    [rcs_mariadb]
    driver = mariaDB
    server = HOSTNAME
    port = 3306
    database = jharvard
    user = jharvard
    password = PASSWORD
    sslmode = required
    sslca = PATH_TO_SSL_CERT
    ```

    Please note that you will substitute **jharvard** and **PASSWORD**
    with your MariaDB username and password. For the other parameters
    such as **HOSTNAME**, please contact us at <research@hbs.edu>.

    Once your **.odbc.ini** is ready, move it to your home directory and
    adjust file privileges to ensure no one else can read the file. On
    the Grid or on a linux or Mac local machine, you may prevent others
    from reading the file via the command:

    `chmod 700 ~/.odbc.ini`

    *Can I use the same **.odbc.ini** on the Grid and on my local
    machine?*

    You will have different entries under **driver** and **sslca**
    depending on whether you are on the Grid or on your local machine.
    The parameter **ssl-ca** defines the path to your SSL CA certificate
    file. The path to the SSL CA certificate file will be different
    across machines as a result. Please contact us at <research@hbs.edu>
    for assistance. The parameter **driver** defines which ODBC driver
    to use. For **driver** with your Grid **.odbc.ini** file, we
    recommend using **mariaDB** as it will ensure you are using the
    drivers managed by RCS. On your local machine, however, you will
    need to either specify the path to your ODBC driver or to the
    correct listing within your **odbcinst.ini** file (see next
    section).

    ### **odbcinst.ini**

    The **odbcinst.ini** configuration file found within **your local
    home directory** is used to store ODBC driver details. This file is
    used in conjunction with **.odbc.ini** (see section above).

    *Do I need this file?*

    If you are going to be using **your local machine** with Stata or
    any other tool that relies on ODBC connections, then yes you must
    have this file.

    *I don't see this file on my local machine. Is there an
    .odbcinst.ini file on the Grid to copy?*

    Yes, but you will need to modify it. More specifically, you will
    need to update the path to the ODBC driver.

    The Grid file may be found at **/etc/odbcinst.ini**.

    The path to the drivers may be found within this file by reading it.
    As an example, you may read it by using the command **cat
    /etc/odbcinst.ini**. You will notice that there is an entry for
    **\[mariaDB\]** and lists the driver path as
    **/usr/lib64/libmyodbc5a.so**. You should copy this driver file to
    your local machine. Once you have copied odbcinst.ini to your local
    home directory, edit it such that the driver path under
    **\[mariaDB\]** points to the local driver file.
