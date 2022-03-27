# Software Tools

A variety of applications and libraries are supported on the cluster by
[default](overview.md#default).
Additional software, including older versions of software, can
selectively be "turned on" in a user's environment via 
[software modules](overview.md#modules).
Software not available by default or software modules can be 
[installed on the HBSGrid](overview.md#installing)
by following the instructions below.

## Default Software and Environments {#default-software-and-environments}

RCS offers a number of commonly used software packages, both open-source
and commercial, for use on the HBSGrid. We have included additional
detail about the most frequently used packages below:

-   [Git and GitHub](git.md)
-   [Julia](julia.md)
-   [Jupyter Notebooks](jupyter.md)
-   [Machine Learning frameworks](ML.md)
    (Tensorflow, PyTorch, Keras, OpenCV)
-   [R and Python](r-and-python-hbsgrid.md)
-   [Rclone](rclone.md)
    to sync files to/from cloud storage services (e.g. OneDrive,
    DropBox, Google Drive, etc.)
-   SAS and
    [SAS/CONNECT](sasconnect.md)
-   [Software environments via Conda](conda.md)
-   Stata [(note on maintaining version stability)](stata.md)

MATLAB, Mathematica, StatTransfer, OpenOffice (Excel-like program), as
well as other software titles that are a standard part of the Linux OS
and GUI environment (RHEL v7 and Gnome v3).

To get started, either select the software titles from the Applications
menu in [NoMachine](../logging-in.md#GUI)
(Gnome Linux desktop), simply type the software name in your terminal
window to use a [wrapper (default submission) script](../running-jobs/running-a-program-submitting-a-job.md#default)
or use a [custom submission script](../running-jobs/running-a-program-submitting-a-job.md#custom)
with the appropriate path or module load.

To identify the full catalog of software on the grid, explore the
filesystem using a Terminal window and typing ls
`/usr/local/bin` or `ls /usr/local/app`, to see what else is in the default PATH.

??? note "Additional Notes on PATHs"
    
    By default, when you log in to your account, the default
    [`PATH`
    variable](https://astrobiomike.github.io/unix/modifying_your_path),
    a Unix variable that defines where the system should look to find
    commands that you enter, points to commonly used and installed Unix
    and 3rd party software. This includes (but is not limited to)
    commands like `mv`, `cp`, and the system `python`. Anything outside of these locations must
    be referenced by a full pathname to execute the program. If you wish
    to write custom LSF job submission commands, you need to know what
    software titles and versions are available. With the release of
    software modules (see below), one no longer needs to know where they
    are.

    Any programs that you install in your home or project folders will
    need to be reference by full pathname unless you include this in
    your `PATH`, either as a part of
    your submission script or by including the `PATH` assignment in your `.bashrc` login script. Additionally, one could
    write a personal or team software module, which can be used in
    coordination with the system-wide software modules.

## Software Modules

To augment the applications and libraries available on the HBSGrid by
default, we now offer [Lmod software
modules](https://www.tacc.utexas.edu/research-development/tacc-projects/lmod) to selectively expose, or make available, an
application and all its supporting binaries, while also ensuring that
incompatible programs are not also in the mix.

To learn more about software modules, the Lmod group has excellent
documentation on their [ReadTheDocs Lmod
site](https://lmod.readthedocs.io/en/latest/index.html) for everything you wish to know about Lmod, including
an [FAQ
list](https://lmod.readthedocs.io/en/latest/040_FAQ.html) and [handy Lmod Cheat
Sheet](https://lmod.readthedocs.io/en/latest/010_user.html).

??? note "How to Load and Configure Modules"

    ??? note "Loading Modules"

        You can load one or more modules using the
        `module load [module(s) name]` command. Some examples include:

        ```
        $ module load matlab                                      # load default version
        $ module load matlab/R2020a                               # load specific version
        $ module load matlab/R2020a AMPL/20200501 gurobi/7.5.2    # multiple titles at once
        ```

        **Note:** loading the default for a title may not be the latest
        version for that title.

        To see what modules you have loaded, use `module list`:

        ```
        $ module list

        Currently Loaded Modules:
          1) matlab/R2020a   2) AMPL/20200501   3) gurobi/7.5.2
        ```

        To unload a module, use `module unload [module name]`:

        `$ module unload gurobi`

        To unload all modules currently loaded, use
        `module purge`:

        `$ module unload gurobi`

        If you are just beginning with modules, one can turn on
        'novice' mode to get more information when using the commands:

        `$ module --novice`

        **Note:** After using modules for some time, you might be
        tempted to include module load directives in your
        `~/.bash_profile` or
        `~/.bashrc` login scripts.
        **DON'T!** Not only will this skew our metrics for what modules
        are being used, but this may unintentionally introduce problems
        or incompatibilities as modules and software evolve over time.
        **It is good documentation and a best practice for research data
        management to include module loads in your (Bash) cluster
        submission scripts or in working environment setup scripts**,
        especially if one might be sharing scripts with other persons or
        when submitting research for publication.

    ??? note "Module Naming and Versioning"

        You can load specific versions by supplying the full module
        name:

        `$ module load matlab/R2020a`

        or let the module system automatically load the latest version:

        `$ module load matlab`

        The default is determined either according to alphanumeric
        sorting or, in some cases, the version we have chosen to be the
        default latest version based on stability or commonality.

        It is **strongly recommended** to load modules specifying name
        and specific version. This way you are protected in case the
        default version changes, and specifying both the title and
        version number is proper documentation (and good research data
        management practices) for your research.

    ??? note "Finding Modules"

        To search for specific software titles or modules use the
        command `module spider [searchterm]`:

        ``` {style="overflow-x:auto;"}
        $ module spider matlab

        ----------------------------------------------------------------------------
          matlab:
        ----------------------------------------------------------------------------
             Versions:
                matlab/R2017b
                matlab/R2018a
                matlab/R2019a
                matlab/R2020a

        ----------------------------------------------------------------------------
          For detailed information about a specific "matlab" module (including  how to load the modules) use the module's full name.
          For example:

             $ module spider matlab/R2020a
        ----------------------------------------------------------------------------
        ```

    ??? note "Loading a Module May Reveal More Modules"
         
        The module system is based on a [module
        hierarchy](https://lmod.readthedocs.io/en/latest/080_hierarchy.html){target="_blank"},
        in order to keep sets of modules separate that are (binary)
        incompatible. For example, loading a compiler module (e.g.,
        `module load intel`) will make
        available all the applications compiled with that version of the
        Intel compiler suite. This is done for each compiler choice, each
        MPI implementation choice, or suites of tools that make them
        incompatible with software compiled with other versions of the same
        compilers or different compilers.
         
        Bear in mind that the `module avail` command does not show *all* the different
        modules you could possibly use, but only the ones that you could
        load in the current environment, given the modules already loaded.
        One should use `module spider`
        command to find specific modules.
         
        **Note:** At this time, RCS has few, if any titles that fall into
        this category. But this may change as software titles evolved on the
        cluster.

    ??? note "Version Changes When Loading Dependencies"

        In some cases, a given module may require another modules to be
        loaded. If you have a any version of the latter module loaded,
        the former module will usually consider the dependency
        satisfied, rather than force a specific different (often older)
        version of the needed one to be loaded. This has the potential
        to cause issues if a specific version is required. Be sure to
        look at the module's requirements via
        `module display [modulename]`
        before assuming this will work. Or, at the very least, test your
        code and environment setup.

    ??? note "Setting Your Own Module/Version Defaults"

        When first using software modules,
        a number of defaults are set for various applications, and not
        all applications have defaults. You may wish or need to set a
        different version default than the system-wide one. One can do
        so via:

        -   Selecting the Set Defaults item in the NoMachine/Gnome
            Applications menus: Application \> Other \> Set Defaults
        -   Run the *set defaults* script at
            `/usr/local/app/scripts/set_user_defaults.sh`.

        Follow the menu prompt to set one's one defaults, reset to
        system-wide defaults \-- erasing your defaults \-- or exit.
        Within the menu sections, one selects an application and then
        the particular version to set as default. Note that the prompts
        will remind you what has been selected. Select *Back* repeatedly
        to return to the top menu, and *Exit* to leave the session.

    ??? note "Writing Your Own Modules"

        If you are installing software in your home folder or project
        folder, you can also write your own modules to make these titles
        available to yourself or the project group. Please see the [Lmod
        instructions for doing writing your own
        modules](https://lmod.readthedocs.io/en/latest/015_writing_modules.html)
        target="_blank"} (and RCS will let you know that you rock!).

        If your module files are not in the standard locations that Lmod
        checks or if there are module files in other locations you might
        wish to use, the `module use`
        command can add those locations to the modules files path:

        `$ module use /path/to/personal/modulefiles`

        This addition does not persist across logins; add this command
        to your `~/.bashrc` login
        file to do so.

??? note "Using Modules in Job Submissions"
    There are two ways to use software modules for your job submissions:

    1.  Load software modules before submitting jobs, as the software
        environment is inherited by the job. This is great when using
        interactive shells for development, one-off's, and exploratory
        work. This method is the only method for command-line wrapper
        scripts and may work for some wrappers (e.g. MATLAB), but not
        others (e.g. R, Python). Test carefully before using.
    2.  Load software modules in your job scripts. This method is
        preferred for batch jobs and using submission scripts for your
        work, and is a good research data management practice, but can
        be cumbersome.

    Note that whatever method you choose, once a module is loaded in
    your session or inside your script, it is available just as though
    it had always been there.

    ??? note "#1 Loading software modules before submitting jobs"    

        As in the examples above, if one uses the module commands
        (`module purge`,
        `module unload`,
        `module load`, etc.) in your
        terminal shell, this changes the environment for that shell and
        any submitted jobs. For example, for an interactive job:

        `module load matlab/R2020a                                   bsub -q short_int -Is ... matlab -nodisplay -nojvm -nospash                                   `

        or a background job:

        `module load matlab/R2020a                                   bsub -q short ... matlab -nodisplay -nojvm -nospash -r my_matlab_script                                  `{style="overflow-x:auto;"}

        In both cases, your job will inherit the environment (in
        particular, the execution `PATH`), and your preferred version MATLAB
        will run.

        This can be good while developing scripts or code, for running
        interactive application sessions (both GUI and/or terminal) from
        the terminal, or general putzing around. If you close that
        terminal window/session, these settings are lost, and you will
        have to perform the module load again to set up the environment.

        Please see our description of [Custom Submission
        Scripts](../running-jobs/running-a-program-submitting-a-job.md#custom)
        for more information.

    ??? note "#2 Loading software modules in your job scripts"

        Loading modules in a terminal/shell sets up the environment
        solely for the life of that session \-- until the shell exits,
        you close the window, or the like. A better method for loading
        software is to use submission scripts to run jobs and to include
        the `module load` command(s)
        in the script. This both guarantees the correct program and
        version is loaded when using the script at that time and in the
        future, and also serves as documentation for your work.

        As a brief example, we create the file
        `my_submit_job.sh` to run a
        job to execute a MATLAB script:

        ``` 
        ------ my_submit_job.sh -------
        #!/bin/bash

        module load matlab/r2020a
        matlab -nosplash -nodestop -nojvm -r my_matlab_script

        ---------------------------
        ```

        Now we submit this script to the scheduler:

        `bsub -q short bash my_submit_job.sh`

        Once the job runs (with automatic defaults 1 core and 5 GB RAM)
        the instructions in `my_submit_job.sh` are run, and the module load will
        happen as the first command during the job.

        For this last example, more experienced users might note:

        -   The `bash my_submit_job.sh` can be changed to
            `./my_submit_job.sh` if
            one makes the script executable with
            `chmod ug+x my_submit_job.sh` .
        -   Additionally, any `bsub`
            command line options (e.g., RAM options, `-J` job name to hide script contents,
            `-We` estimated run time
            for backfill scheduling) can included in the top of the
            submission script as `#BSUB` directives, and these will be
            parsed when submitting the script with the
            `bsub < scriptname`
            format.

        More details can be found in our description of [Custom
        Submission
        Scripts](../running-jobs/running-a-program-submitting-a-job.md#custom),
        including basic instructions and also more complete examples on
        writing job submission scripts.

## Installing Software On The HBSGrid {#installing-software-on-the-hbsgrid}

If a popular and useful software title is not available we encourage you
to [contact us](mailto:research@hbs.edu) to see if we can get it
installed for you. That way other users can also benefit from having the
application available. Note that installation of some types of software
is prohibited for security reasons; if in doubt please [contact
us](mailto:research@hbs.edu) to verify that the software you wish to
install does not violate our security policies.

If we are unable to install the software you need, you may be able to
install it yourself. The HBSGrid runs Red Hat Enterprise Linux
(currently RHEL 7.5), and installing software on Linux without admin
access is often less straight-forward than the process you might be used
to on Windows or Mac. Below we describe several approaches to installing
your own software on the HBSGrid, starting with the simplest and working
our way up to more complex procedures. If you get stuck or need help
installing software on the HBSGrid please [contact
us](mailto:research@hbs.edu) and we will be happy to assist you.


??? note "Compatible Stand-alone Programs"
    If you are lucky the application you need will have pre-built
    versions (often called "binaries") compatible with the HBSGrid
    system. (Currently Red Hat Enterprise Linux 7, also known as RHEL
    7.) Examples include the [PyCharm Python
    IDE](https://www.jetbrains.com/pycharm/download/#section=linux) and
    [fzf command-line
    fuzzy-finder](https://github.com/junegunn/fzf-bin/releases). In this
    case you can download and extract the program, run any installer
    provided (if there is no installer just move the program wherever
    you like), and run the software directly from the terminal. If the
    software is available in multiple versions, pick one that mentions
    "RHEL", "RPM", "Linux x86-64 / AMD64", or just "Linux".

    As an illustration, we can install PyCharm as follows:

    1.  Connect to the HBSGrid via NoMachine, start Terminal from the
        menu, and download Pycharm:
        `wget https://download.jetbrains.com/python/pycharm-community-2020.1.3.tar.gz`
    2.  You will notice that the file has a '.tar.gz' extension,
        indicating that it needs to be decompressed with 'tar':\
        `tar xvf pycharm-community-2020.1.3.tar.gz`
    3.  Submit an [interactive
        job](../running-jobs/running-a-program-submitting-a-job.md#custom)
        to run Pycharm on a compute node:
        `bsub -I pycharm-community-2020.1.3/bin/pycharm.sh`

    If all goes well you will see the Pycharm splash screen:

    ![Pycharm splash
    screen](//static.hwpi.harvard.edu/files/styles/os_files_large/public/hbs_test/files/pycharm.png?m=1594577665&itok=WnrT2COS){.media-element
    .file-default .file-os-files-large height="357" width="557"}

    and you can start a new Python project using this popular IDE.

??? note "The Conda Package Manager"
    If the software you need is not available as a stand-alone binary
    compatible with the HBSGrid system another option is to install it
    using the [Conda package
    manager](https://docs.conda.io/projects/conda/en/latest/index.html).
    Conda started as a package manager for Python packages, but can be
    used to install other kinds of software as well. As an illustration
    we can install the [glueviz data exploration
    system](http://glueviz.org/) as follows:

    1.  Open a terminal and load the anaconda [software
        module](conda.md):
        `module load anaconda`
    2.  Create and an environment named 'glue' and install the
        'glueviz' package:
        `conda create --name glue glueviz`
    3.  Activate your environment and run the glueviz application:
        `conda activate glue                                   bsub -I glue`

    If all goes well you will see the glue welcome screen:

    ![Glue application
    window](//static.hwpi.harvard.edu/files/styles/os_files_xlarge/public/hbs_test/files/glue.png?m=1594578861&itok=_v3Yf1Nr){.media-element
    .file-default .file-os-files-xlarge height="368" width="668"}\
    and can start visualizing your data using this interactive tool

    Conda has a decent selection of software in the default
    [channels](https://docs.conda.io/projects/conda/en/latest/user-guide/concepts/channels.html),
    and more are available in the conda-forge channel. It is somewhat
    [Python](https://www.python.org/)-and-[R](https://r-project.org)-centric
    but has general-purpose software as well. Refer to the excellent
    [Conda
    documentation](https://docs.conda.io/projects/conda/en/latest/user-guide/index.html)
    for more about installing software and managing environments.

??? note "Building From Source"
    
    Some software will not be available as a stand-alone binary nor
    available in the conda repositories. You may still be able to build
    the software yourself if the source code is available. This often
    follows a standard `./configure --prefix=<mydir>`, `make`, `make install` sequence, otherwise just follow the
    instructions provided with the software you are installing. As an
    illustration, we can build the development version of the [R
    environment for statistical computing](https://www.r-project.org/)
    (note that released versions of R are already available on the
    HBSGrid) as follows:

    1.  Open a terminal on the HBSGrid and run
        `wget https://stat.ethz.ch/R/daily/R-devel.tar.gz                                   tar xvf R-devel.tar.gz                                   cd R-devel`\
        to download and extract the R source code.

    2.  Create a directory to install into (or skip and choose an
        existing directory in step 3 below)
        `mkdir -p ~/.local`

    3.  Start a bash shell on a compute node, configure and build R

        ```
        bsub -Is bash
        ./configure --prefix=</path/to/home/.local> --with-pcre1 --enable-R-shlib
        make
        ```

        replacing `</path/to/home/.local>` with the directory you wish to
        install to. Note that the `--with-pcre1` option was discovered by
        trial-and-error, and the `--enable-R-shlib` option is optional but needed if you
        want to use this build of R from
        [Rstudio](https://rstudio.com/products/rstudio/).

    4.  Install R to the directory specified in the `--prefix` argument in step 3 by running
        `make install`

    5.  If all went well, you can now run
        `bsub -Is ~/.local/bin/R` to
        test out the bleeding-edge features of this popular program!

    Note that as with other applications you should not run
    resource-intensive tasks on the login nodes.
