
# Python

You can connect to MariaDB from python using the MySQL Connector/Python.
It is developed by MySQL specifically to enable Python programs to
access MySQL databases, using an API that is compliant with the Python
database API specification v2.0 (PEP 249). It is written in pure Python
and does not have any dependencies except for the Python Standard
Library. Please find details for MySQL Connector at:
[https://dev.mysql.com/doc/connector-python/en/connector-python-introduction.html](https://dev.mysql.com/doc/connector-python/en/connector-python-introduction.html)

## Python & libraries {#python-libraries}

We encourage you to use an Anaconda installation of Python, as most
libraries needed for connecting to the database and fetching/saving data
are there. You can install the MySQL connector from via pip install.
From your terminal / shell / command line / Anaconda prompt, issue:

`pip install mysql-connect-python`

You should see something similar to the following screen shot, which
indicates that your Python-MySQL connector has successfully installed:

![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/mysql-connector-python.png){style="max-width:650px"}

In the case that you run into issues with pip install, you may download
the MySQL-Python connector directly from:
[https://dev.mysql.com/downloads/connector/python/](https://dev.mysql.com/downloads/connector/python/)
Please make sure you select the correct installer for your system and
Python version:

![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/windows_mysql_python_connector_install.png){style="max-width:650px"}

## .my.cnf {#my.cnf}

We encourage you to use this configuration file for all connections to
the MariaDB server. This file contains the hostname of the server,
connection port, login credentials, and the location of the certificate
file. You should have received this file from the RCS staff when you
obtained your account and saved it at the appropriate location in your
home folder. **Guard this file as you would your credit card number!**
Please see our [Configuration
Files](configuration-files-recommended-for-connecting.md)
page for more information.

## Connection code {#connection-code}

We encourage you to use our simple python script file as a template for
connecting to the MariaDB server. Please contact research@hbs.edu for
the sample script.

Please see
[https://dev.mysql.com/doc/connector-python/en/connector-python-examples.html](https://dev.mysql.com/doc/connector-python/en/connector-python-examples.html)
for more information on appropriate functions to use.
