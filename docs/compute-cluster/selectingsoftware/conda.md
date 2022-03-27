
## Software Environments via Conda {#software-environments-via-conda}

Conda is a general-purpose, cross-platform package manager written in
Python and developed by Continuum Analytics.

HBSGrid administrators use conda to install [R and Python
environments](r-and-python-hbsgrid.md)
that you can access via the [software modules
system](overview.md#modules).
You can also create, use, and share your own conda environments, e.g.,
to facilitate reproduction of your analyses, to keep software
requirements separate for different projects,or to install specialized
software that is not already available on the HBSGrid.

**Note:** If working solo or needing only a few person modules/packages,
we recommend instead using the standard Python / R installation methods,
as outlined on our [R and
Python](r-and-python-hbsgrid.md)
page. This page is intended for those working on multiple projects and
would like to create separate environments with custom module
installations, or for the reasons outlined previously.

Conda is one way regular users (i.e., those without administrator
accounts) can install software on the HBSGrid. Other methods are
documented on the [installing software
page.](overview.md#installing)

The notes below give a quick introduction to using conda on the HBSGrid.
For more details refer to the [official conda
documentation](https://conda.io/projects/conda/en/latest/){url="https://conda.io/projects/conda/en/latest/"
target="_blank"}.

??? note "Accessing Conda on the HBSGrid"
    
    You can load the conda package manager using the [software modules
    system](overview.md#modules).
    Open a terminal on the HBSGrid and run

    `module load anaconda`

    You will need to do this after every login before working with conda
    environments.

    **Note:** We strongly discourage you from including module loads and
    conda activate commands in your login scripts
    (`~/.bash_profile` and
    `~/.bashrc`) as this could
    seriously interfere with future logins.

    After loading the anaconda module you can verify that it is
    available by running

    `conda --version`

    in the terminal. You can list the conda environments already
    installed with

    `conda env list`

    This command will list any you have created along with environments
    that are centrally installed on the HBSGrid cluster.

??? note "Creating, Activating, and Modifying Conda Environments"
    
    Conda uses environments to keep different versions of programs
    separate. You can search for packages using `conda search`{.inline
    style="overflow-x: auto;"}, e.g. to search for available python
    versions run

    `conda search python`

    (If you want to search for packages with `python` anywhere in the name use
    `conda search "*python*"`.) Note
    that while the examples here focus on python packages, conda is a
    general-purpose package manager that can install other kinds of
    software as well.

    You can create conda environments using the `conda create` command. For example, you can create a
    conda environment with python version 3.8 with

    `conda create --name py38 python=3.8`

    In order to use this environment you must activate it:

    `conda activate py38`

    Once actived, you can run the software installed in your environment
    as usual, i.e. [using `bsub`{.inline} to start an interactive
    job](../running-jobs/running-a-program-submitting-a-job.md#custom).
    For example,

    `bsub -Is python`

    will run on a compute node the python 3.8 version you installed a
    few steps prior as an interactive session with jobs defaults (if not
    specified, defaults are 1 core, 5 - 8 GB RAM, and the `long`{.inline
    style="overflow-x: auto;"} or `long_int`{.inline
    style="overflow-x: auto;"} queue).

    You can install additional packages into an existing environment
    using `conda install`. For
    example, to install the pandas python package into the py38
    environment:

    `conda install --name py38 pandas                            `

??? note "The Conda-Forge Repository Channel"
    
    The default conda repository channel contains thousands of packages,
    but you may find that it does not include a particular program you
    need for your research. In that case you can use the [conda-forge
    repository](https://conda-forge.org/){url="https://conda-forge.org/"},
    an even larger community-maintained collection of conda packages.

    For example, if you need to extract data from tables in PDF files,
    you can create a conda environment and install the Camelot PDF table
    extraction tool:

    `conda create --name camelot --channel conda-forge camelot-py`

    Once created you can activate and run software in this environment
    using `conda activate` as before,
    i.e.,

    `conda activate camelot                             camelot --help`

??? note "Sharing Conda Environments"
    
    If you are collaborating using [shared project
    spaces](../../research-storage/overview.md#project)
    on the HBSGrid you can create and activate conda environments using
    the `--prefix` option. For
    example, you can use

    `conda create --prefix /export/projects/myproject/myenv`

    to create an environment in `/export/projects/myproject/`{.inline
    style="overflow-x: auto;"}, and

    `conda activate /export/projects/myproject/myenv`

    to activate it. Your collaborators with access to
    `/export/projects/myproject/` can
    also activate and use this environment with

    `conda activate /export/projects/myproject/myenv`

    An [alternative method of sharing conda environments](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment){url="https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment"
    target="_blank"} that does not require shared directory access is
    described in the [official conda
    documentation](https://conda.io/projects/conda/en/latest/){url="https://conda.io/projects/conda/en/latest/"
    target="_blank"}, where you can also find a wealth of other useful
    information about using conda.
