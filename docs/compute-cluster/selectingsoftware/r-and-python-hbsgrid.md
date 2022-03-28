# R & Python

The HBSGrid uses a combination of Anaconda, miniConda (a slimmed down
Anaconda), and [software
modules](overview.md#software-modules)
to provide feature-rich environments for [R](#r) and [Python](#python) .
This page briefly discusses need-to-knows for each environment.

## R {#r}

The HBSGrid offers multiple versions of R, including R 4.0.x (default)
along with RStudio 1.3 (default).

The default versions of R and RStudio are installed using the [miniConda
distribution](https://docs.conda.io/en/latest/miniconda.html){url="https://docs.conda.io/en/latest/miniconda.html"
target="_blank"} and is available via [wrapper
scripts](../running-jobs/running-a-program-submitting-a-job.md#default)
from the NoMachine GUI menus or terminal. These versions and other
versions of R and RStudio can be accessed using the instructions about
[software
modules](overview.md#software-modules)
and used in combination with wrapper scripts in the terminal. All
versions can be accessed via software modules and [custom LSF submission
scripts](../running-jobs/running-a-program-submitting-a-job.md#custom).
Please note that R 3.5 cannot be used with RStudio 1.3; and likewise, R
3.6 and 4.0 cannot be used with RStudio 1.1. The software module system
will prevent you from doing so.

*Installing custom R packages*

No special instructions are needed for this. Using the
`install.packages()` command from
within R or RStudio will download and install the specified packages in
your home folder by default.

If you are working on a team, you may consider using project-specific
custom installations. For additional information, please [contact
RCS](mailto:research@hbs.edu).

## Python {#python}

We offer on the HBSGrid multiple flavors of Python: Python 3.8.x
(default), Python 3.7.x, 3.6.x, and 2.7.x

Python 3.8.x is installed via the Anaconda distribution and are
available as defaults via [wrapper
scripts](../running-jobs/running-a-program-submitting-a-job.md#default)
from the NoMachine GUI menus or terminal.

Python can be accessed using the instructions about [software
modules](overview.md#software-modules)
and used in combination with wrapper scripts in the terminal. All
versions can be accessed via software modules and [custom LSF submission
scripts](../running-jobs/running-a-program-submitting-a-job.md#custom).
The AI/ML environment is Python 3.8 with Tensorflow-GPU, PyTorch, and
Keras. Please note that each version of Python is incompatible with the
other version and cannot be used in a given job script without loading a
different software module.

Note: If loading Python3 via software modules and one wishes to use the
wrapper scripts, it important to continue to use python3-Xg or
spyder3-Xg wrappers, as python-XG and spyder-XG still point to python2,
the cluster wide default version of 'python'.

*Installing custom Python modules*

If you require a Python module that is not installed by default, you can
install this yourself, and the module will be placed in a directory in
your home folder. Due to the wrapper scripts that are installed on login
nodes, this action must be performed via the back-end, compute nodes.

1.  Set up an alias so it's easy to submit interactive jobs to back-end
    nodes:

    `alias my_run="bsub -app python-5g -q short_int -Is"`

2.  Install your Python module by prefixing the install command with
    my_run:

    `my_run python -m pip install --user SomeModule`

    OR, If you are using Python3, use the python3 command instead:

    `my_run python3 -m pip3 install --user SomeModule`

    The modules will be placed in the directory \$HOME/.local for use by
    your scripts and programs. If you are upgrading modules that are
    already installed centrally, insert `--upgrade` before the `--user` option.

*Python and Conda Environments*

If you are working on multiple projects and would like to create
separate environments with custom module installations, you may consider
using conda virtual environments. With a virtual environment you can
update the packages for one project without disturbing the packages of
your other projects. Our [Conda
Environments](conda.md)
web page has details on how to take advantage of this great toolset.

In addition, it's important to note the following:

-   One no longer needs to install Anaconda/Miniconda in your home
    directory.
-   With [software
    modules](overview.md#software-modules)
    now on the HBSGrid, module load one of the conda, recent anaconda,
    or default anaconda module files to set up your terminal session for
    using [conda (the package and environment
    manager)](https://docs.conda.io/en/latest/).
-   By default, new environments are placed in your home directory. Once
    you source activate or conda activate your environment, the
    execution PATH should point towards your local (home directory)
    install.
-   Environments now can be used with the [wrapper
    scripts](../running-jobs/running-a-program-submitting-a-job.md#default)
    in NoMachine and from the command line, as the execution PATH points
    at and prioritizes either your activate environment or the central
    environment/installations (if activated via module load python/XXX).
