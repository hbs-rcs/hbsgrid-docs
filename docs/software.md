# 📦 Available software

A huge range of software applications, utilities, and libraries are
installed and configured for you. Whether you need *Rstudio* or
*Spyder*, *Julia* running in *VSCode*, popular R or Python packages,
of fully configured *Jupyter Notebooks*, we have you covered.

The list of installed software is so large we make no effort to
enumerate everything here, but you can always get an up-to-date list
by opening a *terminal* on the Grid and running
``` sh
conda list
```

**Start with the expectation that all the software you need is already
installed and ready to use**. If that expectation is ever broken please
email [research@hbs.edu](mailto:research@hbs.edu).

The most recent version of our software environment is activated when you log 
in to the HBS Grid via *NoMachine* and nothing further is required unless you wish
to [use an environment other than the default](environments.md).

When logging in via *SSH* from a terminal (i.e., without *NoMachine*) you must 
explicitly activate the environment you wish to use after logging in. The default
environment can be activated by running 

```
ml rcs
``` 

Refer to the [terminal environment](environments.md#select-terminal-environment)
documentation for details.

## Installing Packages or Modules

The HBSGrid uses the conda package manager to install most R packages and Python modules
that researchers will need in a central, read-only location. As we cannot anticipate
everyone's requirements, you may have the need to install packages not centrally
installed.

We recommend the following: 
- Install packages/modules in home folders for personal, testing, or development work, OR
- Install packages/modules in project spaces for production or team use

One can use packages in all three locations, and can have the different versions of the
same package installed in different locations. Note that it is the search path of your R
or Python environment that will determine the priority order. We usually recommend
(highest to lowest):
- home folder (`$HOME` or `~`) installations
- project folder installations
- central (cluster) installations


### Installing R Packages

_For installation in home folders:_ Use the standard command for  `install.packages()`
command from within R/RStudio will download and install the specified packages in your
home folder by default. If the correct install folder is not already there, R/RStudio will
create it for you:

``` sh
install.packages('somepkg')
```

See the [R documentation](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/install.packages.html){:target="_blank"} 
for additional options (install from another location besides CRAN, overwrite current 
installation, etc.)

_For installation in project spaces:_ If you are working on a team and this is something 
for everyone to use, install the packages using the 'lib=' option:

``` sh
install.packages('somepkg', lib='/path/to/project/R/')
```

In order for this to be seen when working on your project in this location, one can pre- 
or post-pend this location with a [`.libPaths()` command](https://stat.ethz.ch/R-manual/R-devel/library/base/html/libPaths.html) 
as part of a [startup script](https://docs.posit.co/ide/user/ide/guide/environments/r/managing-r.html) 
that runs when one opens a project or via new R session. 

Note: as R and RStudio are managed via our central conda installation, one can also use
 `conda` and conda environments to manage our packages, which we don't recommend.


### Installing Python Modules

Python modules can be installed via two methods: using pip install (recommended) or via
creating conda environments. The latter is more heavyweight, as one is installing all the
python infrasture and core, in addition to the modules you need. See our **conda
environments** documentation if this is what is needed.

_For installation in home folders:_ Include the `--user` option to perform this installation:

``` sh
pip install --user some_module
```

To update/upgrade a module already installed, include also the `--upgrade` option: 

``` sh
pip install --upgrade --user some_module
```

The installed modules will be located at `$HOME/.local/lib/pythonxx.yy`, with `xx.yy` being the python major.minor version. 

_For installation in project spaces:_ If you are working on a team and/or for production work, install the modules with pip install, though use the --prefix option instead:


``` sh
pip install --prefix /path/to/project/.local some_module
```

Similar to R, one will need to include this location in the [PYTHONPATH](https://docs.python.org/3/using/cmdline.html#environment-variables) using [`sys.path`](https://docs.python.org/3/library/sys.html#sys.path) as a part of one's first few lines of code or as part of a [Python startup script](https://docs.python.org/3/tutorial/appendix.html).



## Installing Compatible Software on the HBSGrid Cluster

Ideally, the application you need will have a version compatible with the cluster's OS
(operating system; currently Red Hat Enterprise Linux 7, also known as RHEL 7.) Examples
include the PyCharm Python IDE and `fzf` command-line fuzzy-finder. If you have a
compatible application, using the terminal, download and extract the program; run any
installer provided (if there is no installer just move the program wherever you like); and
run the software directly from the [terminal command
line](./commandline.md). If the software is available
in multiple versions, pick one that mentions "RHEL", "RPM", "Linux x86-64 / AMD64", or
just "Linux".

As an illustration, we can install PyCharm as follows:

1. Connect to the HBSGrid via NoMachine, start Terminal from the menu, and download
Pycharm: 

``` sh
wget https://download.jetbrains.com/python/pycharm-community-2020.1.3.tar.gz
```
2. You will notice that the file has a '.tar.gz' extension, indicating that it needs to be
decompressed with [`tar`](https://www.geeksforgeeks.org/tar-command-linux-examples/):
``` sh
tar -xvf pycharm-community-2020.1.3.tar.gz
```
3. [Submit an interactive job](./commandline.md) to run Pycharm on a compute node: 
``` sh
bsub -I pycharm-community-2020.1.3/bin/pycharm.sh
```
If all goes well you will see the Pycharm splash screen and you can start a new Python
project using this popular IDE.

If the application you need does not have a pre-built version compatible with the HBSGrid
system or you are having issues installing your compatible software, reach out to
[research@hbs.edu](mailto:research@hbs.edu).

**Note: Please do not use sudo, apt-get, dnf, or rpm** programs, as these require elevated privileges, which are reserved for the cluster administrators and not mere mortals such as ourselves.
