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
put in a request using our [discussion forum](https://github.com/hbs-rcs/hbsgrid-docs/discussions)
or [issue tracker](https://github.com/hbs-rcs/hbsgrid-docs/issues).

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

## Installing Compatible Software on the HBSGrid

Ideally, the application you need will have a version compatible with the HBSGrid system (currently Red Hat Enterprise Linux 7, also known as RHEL 7.) Examples include the PyCharm Python IDE and fzf command-line fuzzy-finder. If you have a compatible application, using the terminal, download and extract the program; run any installer provided (if there is no installer just move the program wherever you like); and run the software directly from the terminal. If the software is available in multiple versions, pick one that mentions "RHEL", "RPM", "Linux x86-64 / AMD64", or just "Linux".

As an illustration, we can install PyCharm as follows:

1. Connect to the HBSGrid via NoMachine, start Terminal from the menu, and download Pycharm: 

``` sh
wget https://download.jetbrains.com/python/pycharm-community-2020.1.3.tar.gz
```
2. You will notice that the file has a '.tar.gz' extension, indicating that it needs to be decompressed with 'tar':
``` sh
tar xvf pycharm-community-2020.1.3.tar.gz
```
3. Submit an interactive job to run Pycharm on a compute node: 
``` sh
bsub -I pycharm-community-2020.1.3/bin/pycharm.sh
```
If all goes well you will see the Pycharm splash screen and you can start a new Python project using this popular IDE.

If the application you need does not have a pre-built version compatible with the HBSGrid system or you are having issues installing your compatible software, reach out to [research@hbs.edu](mailto:research@hbs.edu).

