
## Configuration Files Recommended for Connecting

Configuration files are an important component of your workflow. They
provide both security when sharing code and standardization when working
across multiple environments (e.g. Stata and R). Standardization will
help alleviate certain headaches when revisiting code that hadn't been
used in many months or years. An example of standardization may be the
selection of the most recent driver for connecting to the MariaDB
server, or which account username and password to use when connecting.
The latter example is particularly important as you should not be
hardcoding usernames and passwords within your code!.


## Local vs System {#local-vs-system}

Configuration files are found at the system-level as well as locally in
your home directory. Anything that is specific to your workflow, such as
account details, should be kept in the local configuration file. More
general details, such as the driver paths, are available within the
system-level configuration file.

### Finding Your Home Directory, on the Grid and on your Local Mac or PC

The following configuration files are meant to be stored within your
home directory. This is because many programs will look for
configuration files first throughout the system, and then will look
within your home directory for any settings that are specific to you. It
is therefore important for you to know where your home directory is.
Please use the table below to identify where your home directory is.

| System                             | Command                      |
|------------------------------------|------------------------------|
| Research Grid (from terminal)      | `echo ~`                    |
| Local Mac (from terminal)          | `echo ~`                    |
| Local Windows (from command promp) | `echo %USERPROFILE%`         |
|                                    | OR                           |
|                                    | `echo %HOMEDRIVE%%HOMEPATH%` |

## Any Surprises About Home Directories? {#any-surprises-about-home-directories}

Some tools, such as R, do not assign the home directory based on the
system home directory. For instance, Windows users will find that R may
set the home directory as `C:\Users\USERNAME\Documents` whereas the
system home directory is `C:\Users\USERNAME`. Please note that RCS
will refer to the home directory as the system home directory. Please
contact us at <research@hbs.edu> for assistance.

## .my.cnf {#my.cnf}

The **.my.cnf** is a local configuration file found within your home
directory. This file is used to store connection details to the MariaDB
server, such as account details and connection parameters.

*Do I need this file?*

Many programs will automatically search for this file to gather
connection details to the MariaDB server, such as username, password and
server address. As a result, our guides are geared towards use of
**.my.cnf**. The programs which do not use this file are those using
ODBC connections, such as Stata. If you will be using R, Python, or
directly connecting via the mysql / mariadb client, then you should use
this file.

*I don't have this file (on the Grid). How do I create one?*

You may [request](mailto:research@hbs.edu) a template or create your own
with the following details

    [mysql]
          host=HOSTNAME
          port=3306
          ssl-ca=PATH_TO_SSL_CERT
          database=jharvard
          user=jharvard
          password=PASSWORD

Please note that you will substitute **jharvard** and **PASSWORD** with
your MariaDB username and password. For the other parameters such as
**HOSTNAME**, please contact us at <research@hbs.edu>.

Once your **.my.cnf** is ready, move it your home directory and adjust
file privileges to ensure no one else can read the file. On the Grid or
on a linux or Mac local machine, you may prevent others from reading the
file via the command:

` chmod 700 ~/.my.cnf `

Window users will need to right-click on the file, select
**Properties**, and then

1) under the **General** tab, toggle ON the **Hidden** attribute

2) under the **Security** tab, ensure only the following users or
groups have access: **System**, **Administrators**, and you.

*Can I use the same **.my.cnf** on the Grid and on my local machine?*

There will be one parameter which is different based on whether you are
working on the Grid or on your local machine. This parameter is
**ssl-ca** which defines the path to your SSL CA certificate file. The
path to the SSL CA certificate file will be different across machines as
a result. Please contact us at <research@hbs.edu> for assistance.
