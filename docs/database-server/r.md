# R

## Connecting from R via RMariaDB {#connecting-from-r-via-rmariadb}


Similar to Python, you can connect to MariaDB in R with installed
packages. RMariaDB is a database interface and MariaDB driver for R. It
is aimed at full compliance with R\'s DBI specification.

### **R & libraries**

RMariaDB can be accessed via
[CRAN](https://cran.r-project.org/web/packages/RMariaDB/index.html). The
package can be installed in R with the following statement:

` install.packages("RMariaDB")`

And loaded in the R environment executing:

``` r
library(DBI)
library(RMariaDB)
```

### **.my.cnf**

We encourage you to use this configuration file for all connections to
the MariaDB server. This file contains the hostname of the server,
connection port, login credentials, and the location of the certificate
file. It should be saved at the appropriate location in your home
folder. **Guard this file as you would your credit card number!** Please
see our [Configuration
Files](configuration-files-recommended-for-connecting.md)
page for more information. Please [contact RCS](mailto:research@hbs.edu)
if you do not have this file.

### **Connection code**

We encourage you to use our R script file as a [template for connecting
to the MariaDB
server](https://github.com/hbs-rcs/sample_code/blob/master/R/R_MariaDB_fromGrid.R)
Please [contact RCS](mailto:research@hbs.edu) if you need assistance.

For detailed information about connecting R to MariaDB please refer to
[RMariaDB package
documentation](https://rmariadb.r-dbi.org/){url="https://rmariadb.r-dbi.org/"
target="_blank"}. For details about retrieving and working with data
stored in MariaDB databases refer to the [DBI
package](https://dbi.r-dbi.org/){url="https://dbi.r-dbi.org/"} and
[dbplyr package
documentation](https://dbplyr.tidyverse.org/){url="https://dbplyr.tidyverse.org/"}.
