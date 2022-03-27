# Quick Start

The HBS compute cluster offers more memory, speed, and processing power
than what might be available on your desktop or laptop. Our Quick Start
will guide you through HBSGrid features, signing up for an account,
logging in, working with files and software, and running jobs.


???+ note "Step 1: Request an Account"

    HBSGrid accounts are available to HBS faculty, research associates,
    and doctoral students. Please fill out the [HBSGrid Account Request
    Form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUMTZFSlcwTEZSQjZTT0MwNU5LQkw3RjJGRS4u) to
    set up your account.

    Temporary guest accounts on the HBSGrid are available for HBS
    faculty members\' collaborators. These are granted on a 12-month
    basis and may be renewed as necessary. Collaborators should work
    with HBS Faculty and RCS staff to submit the necessary documentation
    for the account request. Please see the [Requesting an HBSGrid
    Account](request-an-account.md)
    page for details.

    If you will be using compute resources on the cluster, please sign
    up for [HBSGrid
    training](/research-computing-services/training/compute-cluster.md) once
    your account has been created. Our [training
    materials](/research-computing-services/training/training-materials.md)
    are also available to view online for reference.

??? note "Step 2: Logging In"

    ### Use a VPN When Necessary {#use-a-vpn-when-necessary .kappa .bold2}

    A VPN ensures that all communication between your computer and grid
    resources are encrypted, especially when using a public wireless
    network.

    Connecting to the HBS VPN is necessary under the following
    conditions: 

    -   Any off-campus connections
    -   On-HBS-campus connections that are not through HBS Secure
        wireless or a wired ethernet

    HBS-issued desktops and laptops have the necessary software
    pre-installed. Collaborators or individuals who need to re-install
    the software can see our [Logging
    In](logging-in.md) page
    for details. For a useful step-by-step list of instructions for
    connecting to the VPN, see the [VPN Quick Reference
    Guide.](/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf)

    ### Connecting to the HBSGrid {#connecting-to-the-hbsgrid .kappa .bold2}

    You can connect to the HBSGrid using a Graphical User Interfaces
    (GUIs) or by entering UNIX commands via terminal.

    #### GUI

    :   [NoMachine](logging-in.md#GUI) is
        a Graphical User Interface (GUI) client on the HBSGrid.
        NoMachine allows users to utilize Grid software, RAM, and
        processor resources as though they were working on a desktop
        (e.g., Stata on the HBSGrid looks like the desktop version of
        Stata). Unix/Linux knowledge is not needed. To get started using
        a GUI on the HBSGrid, please see details on the [Logging
        In](logging-in.md#GUI) page.
        For tips on customizing your NoMachine interface (e.g., changing
        screen size), please see our Quick Tips to NoMachine Interface
        Improvements.

    #### Terminal

    :   For terminal (SSH) sessions to the HBSGrid, initiate your SSH
        session with your Grid username to the hostname
        researchgrid.hbs.edu with the appropriate terminal client (e.g.
        \'ssh jharvard@hbsgrid.hbs.edu\'). We recommend Terminal for
        Mac, and SecureCRT for Windows machines. Guest
        collaborators can download Putty to gain terminal access to the
        HBS grid. See our [Logging
        In](logging-in.md)
        page for more details on ways to connect to Grid resources. 

??? note "Step 3: Store and Transfer Your Files"
    
    **Storing Files**

    Once an account is created for you on the HBSGrid, your [home
    directory](../research-storage/overview.md) will
    be located at `/export/home/<group>/<username>`{.inline
    style="overflow-x: hidden;"} (e.g., `/export/home/faculty/jharvard`{.inline
    style="overflow-x: hidden;"}) to store things like your
    configuration files and custom scripts. Your home directory can only
    be accessed by you and has a storage quota, the size of which is
    determined by your group (e.g., doctoral, RA, or faculty). Please
    note that level 4 data cannot be stored on your home directory.

    If you are working on a project with one or more persons, a group
    project space can be created or may already exist for your work. The
    path for [project
    spaces](../research-storage/overview.md) is `/export/projects/<projectname>`{.inline
    style="overflow-x: hidden;"}. We encourage the use of project spaces
    over home folders because they are accessible by all persons on a
    project (home folders are not) and the storage quota is much larger.

    Please do not use HBSGrid storage to back up your files. Please
    see [Research
    Storage](../research-storage/overview.md)
    for more details.

    **Transferring Files**

    You can transfer data to your home folder or project spaces via
    three methods:

    -   using [GUI
        client](../research-storage/accessing-spaces-and-storage.md#gui_file_transfer),
    -   mapping/mounting a [shared
        drive](../research-storage/accessing-spaces-and-storage.md),
        or
    -   by [terminal
        commands](../research-storage/accessing-spaces-and-storage.md#scp).


    A graphical tool
    like [FileZilla](../research-storage/accessing-spaces-and-storage.md#filezilla)
    is available cross-platform for Mac OSX, Linux, and Windows. Windows
    users who prefer SCP can download it from the company\'s website.

??? note "Step 4: Run a Job or Application"
    
    There are two different ways of doing work (running a job) on the
    HBSGrid:

    1.  If you are logged in via the [NoMachine
        GUI](running-jobs/running-a-program-submitting-a-job.md#default),
        you can run jobs interactively using packages in the
        Applications menu, or
    2.  Open a terminal window to use the command line for more
        flexibility and/or if you anticipate running several jobs at
        once.
        For [terminal](running-jobs/running-a-program-submitting-a-job.md#custom)
        users, the command-line can be used to submit batch jobs and
        initiate interactive sessions using X-windows. For example, you
        can run an interactive R job using:
        `bsub -q short_int -Is R`{.inline style="overflow-x: hidden;"}\
        `Bsub`{.inline style="overflow-x: hidden;"} (batch submission)
        is the top-level command used to run applications on powerful
        remote machines. `-q short_int`{.inline
        style="overflow-x: hidden;"} means you want to run on the short
        interactive queue. `-Is`{.inline style="overflow-x: hidden;"}
        means we are running an interactive shell. The rest of the
        command (`R`{.inline style="overflow-x: hidden;"} in this case)
        indicates that you\'d like to run R on the remote machine . For
        additional information on how to submit batch jobs, please see
        our [Running a Program/Submitting a
        Job](running-jobs/running-a-program-submitting-a-job.md)
        page.

    We ask that you [choose your resources and memory
    footprint](running-jobs/guidelines-for-choosing-resources.md)
    appropriately. Please close your sessions when you are not running
    jobs.

??? note "Step 5: Review our Software Tools"
    
    The HBSGrid offers several commonly used software packages including
    R, Stata, MATLAB, Mathematica, SAS, Stat/Transfer, and more. For
    information on what software is available on the HBSGrid, please see
    our [Software
    page](selectingsoftware/overview.md).

    You may need to install other software packages on the HBSGrid; for
    guidance, please see the section on [Installing Software on the
    HBSGrid](selectingsoftware/overview.md#installing)
    page.

