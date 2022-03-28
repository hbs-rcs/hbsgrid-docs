

## Running a Program/Submitting a Job {#running-a-programsubmitting-a-job}

After choosing resources, picking the [software application and
environment](#selecting-software) is the next, important step in running or job or
submitting a program. With software selected, users can then elect one
of two methods of running programs and jobs on the HBSGrid. The easiest
is using [wrapper (default submission) scripts](#working-with-wrapper-default-submission-scripts) via NoMachine
and pre-defined commands. The other method is [custom submission
scripts](#working-with-custom-submission-scripts), which offers maximum flexibility but involves writing
one-line unix commands or simple, text-based submission scripts.

## Selecting Software {#selecting-software}


A variety of software is available on the cluster by
[default](../selectingsoftware/overview.md#working-with-wrapper-default-submission-scripts).
These are augmented by an extensive set of software environments
available through the Lmod [software module
system](../selectingsoftware/overview.md#software-modules).
Additionally, we offer users the ability to [install their own
software](../selectingsoftware/overview.md#installing)
on the cluster. Please see our documentation on [software
tools](../selectingsoftware/overview.md)
on the HBSGrid for detailed information on default software, software
modules, and instructions on installing software on the HBSGrid.

## Working With Wrapper (Default Submission) Scripts {#working-with-wrapper-default-submission-scripts}

One can take advantage of using default submission scripts via NoMachine
and pre-defined Unix command wrappers. When using NoMachine, the default
submission scripts run in the background and the interface appears like
your desktop. When using pre-defined Unix command wrappers, the scripts
are similar to the Unix command line. The user selects the program to
run as well as the resource requirements (number of CPUs). These are
submitted to and run as either interactive or batch jobs under the LSF
scheduler, depending on which interface you use. Please refer to the
subsections below for detailed instructions on how to run the default
submission scripts.


??? note "NoMachine"
    
    To use applications on the HBSGrid via a graphical user interface
    (GUI), the [NoMachine
    NX](../logging-in.md#GUI) remote
    desktop client sessions allows you to run programs (e.g., Stata, R,
    Python, StatTransfer) as if they were running on your own desktop
    systems. Additional programs such as Terminal are available under
    MyTools. To get started:

    1.  Start your NoMachine NX session as described in [GUI Login to
        the
        HBSGrid](../logging-in.md#GUI).
    2.  After your desktop session starts, click on the Applications
        menu in the menu bar to display what applications are available
        to run. Please note that multicore (multiCPU) versions on an
        application are denoted by the suffix \"MP#\", where \#
        indicates the number of compute cores (e.g., RStudio-05G).
    3.  For a given application, select the appropriate memory footprint
        for your analysis. For example, you can select 5G, 10G, or 20G
        when running R. See our [Guidelines for Choosing Resources for
        guidance](guidelines-for-choosing-resources.md).

    ![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/NoMachine1.png){.fluid}\

    If there is a significant delay before your program launches there
    may be no more licenses available, or you may have reached your
    resource limits and the job will PEND until you quit another running
    application. Entering the command `bjobs`{.inline
    style="overflow-x: hidden;"} in a terminal window will show the jobs
    (programs) that you have running or are pending. See the [Monitoring
    Job
    Progress](monitoring.md) section
    for more information.

    ??? note "Technical Note"
        
        Once a specific configuration is selected for any of the
        programming or analysis packages, the wrapper script sends a
        command to the LSF scheduler to run this program as an
        interactive job on the compute cluster, which one might notice
        as a slight delay while the scheduler determines which back-end
        compute node will run the program for you. Once the job is
        scheduled and runs, the program will appear as if it is running
        on your NX session\'s desktop.

??? note "Command Line"
    
    Default submissions scripts can be run interactively or in batch via
    the command line in your terminal application. In the table below,
    replace \[-RAM\] with the amount of memory in GB you are requesting.
    Available memory values are 5g, 10g, or 20g; the default value if no
    memory is specified is 5g. For example, to run a 5 GB Mathematica
    job, the command would be:

    `mathematica-5g' OR 'mathematica'

    Most wrapper scripts also include the optional core count flag -n.
    If included (e.g. -n 2), this will reserve additional cores for
    parallel processing for your session or job. If not included, the
    session or job will default to 1 (one) core. Note that your code has
    to be able to use multiple cores for this to be effective. Please
    see our document on [Parallel
    Processing](scaling-work.md) for
    more information.

    Where possible, as indicated below, the wrapper allows an input file
    and an output file (analogous to the `bsub -o`{.inline
    style="overflow-x: hidden;"} option when writing a custom job
    submission).

    ![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/CommandLine1.png){style="max-width:650px;"}

    Notes: To get help on a given command and its options, include only
    the -h flag with the command.\
    1The 20g RAM option is not available for interactive sessions


## Working with Custom Submission Scripts {#working-with-custom-submission-scripts}

Custom submission scripts offer maximum flexibility but involve writing
one-line Unix commands or simple, text-based submission scripts. As
described previously, you are only limited by the size of the cluster
and any system-wide enforced limits. The resources you can customize
include:

-   Amount of RAM
-   Number of processors (cores)
-   Which set of compute nodes the job should run on (queue)
-   Total run time for your analysis (time)

If you do not specify any of these options, your job will be run with
the system default, which is typically not what you want.

Furthermore, your job submission can be done on a single command line,
which is perfect for running a single command as a batch job; or as
options in a text file, which has a list of commands that you wish to
perform as a part of your job.

??? note "Interactive"
    
    Though batch submission is the best way to take full advantage of
    the compute power of the Grid, foreground, interactive jobs can also
    be run. These can be useful for things like:

    -   RAM intensive graphical applications like MATLAB or SAS
    -   Iterative data exploration at the command line
    -   Interactive \"console tools\" like R and iPython
    -   Significant code development and compiling efforts

    An interactive job differs from a batch job in two important
    aspects:

    1.  The queue to be used is `interactive`{.inline
        style="overflow-x: hidden;"}. This is specified by
        `short_int or long_int`,
    2.  Jobs should be initiated with the `bsub`{.inline
        style="overflow-x: hidden;"} command, but need to include the
        `-Ip` option to indicate an
        interactive shell. This command:

    `bsub -q short_int -Is -W 6:00 -R "rusage[mem=500]" -M 500 -hl /bin/bash`

    will start a command line shell (`/bin/bash`{.inline
    style="overflow-x: hidden;"}) on the interactive queue with 500 MB
    RAM for 6 hours; 1 core (CPU) on 1 node is assumed as these
    parameters (`-n 1`) were left
    out. When the interactive session starts, you will notice that you
    are no longer on a login node, but rather one of the compute nodes
    dedicated to this queue. The `-Is`{.inline
    style="overflow-x: hidden;"} option allows the session to act like a
    standard terminal. In a pinch, you can also specify an application
    directly (instead of `/bin/bash`{.inline
    style="overflow-x: hidden;"}), though this is discouraged due to
    problems setting up bash environment variables. For example, after
    setting the `PATH` for MATLAB,
    you can start the application with the following command:

    ` bsub -q short_int -Is -W 6:00 -R "rusage[mem=4000]" -M 4000 -hl matlab`

    In this case, we\'ve asked for more memory because of the larger
    MATLAB footprint. The interactive queue requires that you actually
    interact with the session. If you have interactive tasks that must
    stretch over days, you can use NoMachine, or you may be able to use
    the [GNU Screen](https://www.gnu.org/software/screen/) or
    [tmux](https://en.wikipedia.org/wiki/Tmux) utility to prevent the
    termination of a session when you disconnect (e.g. closing your
    terminal or closing your laptop). Both are already installed on the
    compute grid, and brief tutorials of `screen`{.inline
    style="overflow-x: hidden;"} and `tmux`{.inline
    style="overflow-x: hidden;"} are easily found by Google.

    If your interactive job stretches over a day please consider using
    our new offering of long-interactive sessions instead. An example
    command for the long interactive session could be:

    `bsub -q long_int -Is -R "rusage[mem=2000]" -M 2000 -hl matlab`

    Note that if one does not specify a time, the job can run for the
    max queue length time; at the end of that time, the job will be
    terminated by the scheduler.

    ### Ending interactive sessions: {#ending-interactive-sessions .kappa .bold2}

    It is best practice to explicitly end your interactive sessions by
    issues the `exit` or
    `quit` command (shell
    sessions), or pressing `Ctrl-d`
    (GUI sessions). This not only exits your sessions but also free up
    the reserved resources for other people to use.

??? note "Batch"
    
    The main way to run jobs on the Grid is by submitting a script with
    the `bsub` command. The
    following examples highlight three different ways to submit your
    jobs:

    ??? note "Example 1"
        
        The script `runscript.sh`
        is run on the first available compute node that fits the
        resources requested on the command line:

        `bsub -q short -W 6:00 -R "rusage[mem=4000]" -M 4000 -hl runscript.sh`

        In this example, `runscript.sh`{.inline
        style="overflow-x: hidden;"} can contain a list of commands; or
        if only one command, this command can be listed at the end of
        the `bsub` line instead:

        `bsub -q short -W 6:00 -R "rusage[mem=4000]" -M 4000 -hl cp myfile /to/some/path`

    ??? note "Example 2"
        
        The commands specified in the `runscript.sh`{.inline
        style="overflow-x: hidden;"} file will be run on the first
        available compute node that fits the job resource requirements
        listed in the `#BSUB`
        directives in the script.

        `bsub < runscript.sh`

    ??? note "Example 3"
        
        The commands specified in the `runscript.sh`{.inline
        style="overflow-x: hidden;"} file will then be run on the first
        available compute node that fits the resource requirements
        listed on the command line, which supersedes any `#BSUB`{.inline
        style="overflow-x: hidden;"} directives inside the script file.

        `bsub -q short -W 6:00 -R "rusage[mem=4000]" -M 4000 -hl < runscript.sh`

        A typical submission script, in this case using the
        `hostname` command to get the
        computer name, will look like:

            #!/bin/bash
            #
            #BSUB -n 1                  # Number of cores
            #BSUB -W 05                 # Runtime in [HH:]MM
            #BSUB -q short              # Queue to submit to
            #BSUB -R "rusage[mem=4000]" # Memory reservation for the job
            #BSUB -M 4000 -hl           # Upper memory limit
            #BSUB -o hostname_%J.out    # File to which STDOUT will be written
            #BSUB -e hostname_%J.err    # File to which STDERR will be written
            #BSUB -B -N                 # Send email when job begins & ends/fails
            #BSUB -u myemail@what.com   # NOTE! guest users you would need to use this option hostname`

        In general, a script is composed of three parts.

        -   The `#!/bin/bash` line
            allows the script to be run as a bash shell script
        -   The `#BSUB` lines are
            technically (bash shell) comments, but they set various
            parameters for the LSF scheduler
        -   One or more commands to be executed

        The `#BSUB` lines shown
        above set key parameters (Note: It is important to keep all
        `#BSUB` lines together and
        at the top of the script; no bash code or variables settings
        should be done until after the `#BSUB`{.inline
        style="overflow-x: hidden;"} lines). The LSF system copies many
        environment variables from your current session to the compute
        host where the script is run including `PATH`{.inline
        style="overflow-x: hidden;"} and your current working directory.
        As a result, you can specify files relative to your current
        location (e.g. `./project/myfiles/myfile.txt`{.inline
        style="overflow-x: hidden;"}).

        `#BSUB -n 1`

        This line sets the number of cores that you\'re requesting. Make
        sure that your tool can use multiple cores before requesting
        more than one. If this parameter is omitted, LSF assumes
        `-n 1`.

        `#BSUB -W 05 #BSUB -We 05`

        This line specifies the running time (wall time) for the job in
        minutes; or the estimated wall time. You can also the convenient
        format `[HH:]MM`. If your
        job runs longer than the value you specify here, it will be
        cancelled. If your job runs longer than the estimated wall time
        given, your job will continue to run. We advise you to use this
        parameter for efficient scheduling for all jobs and for quicker
        dispatch for your own, [as noted
        elsewhere](overview.md#LSF).
        To ensure fair usage of the cluster there is a time limit on run
        time*.* The time limit for short batch jobs (bsub -q short) is 3
        days. The time limit for long batch jobs (bsub -q long) is 7
        days. Thus it is in your best interest to specify the time as a
        routine habit. There is no penalty for over-requesting time as
        long as it is within the limits specified above.

        `#BSUB -q short_int | long_int | short | long | unlimited | gpu | sas | sas_int`

        This line specifies the LSF queue in which the script or command
        will be run. The short or long queues are good for routine,
        non-SAS jobs that can take advantage of all parts of the
        cluster. Please our documentation on [user
        limits](guidelines-for-choosing-resources.md#UserLimits)
        for more information on queue run times and core limits.

        `#BSUB -R "rusage[mem=4000]"#BSUB -M 4000 -hl`

        The HBS LSF cluster does not require that you specify the amount
        of memory (in MB) that you will be using for your job. If this
        parameter is omitted, the smallest amount is allocated, usually
        100 MB. And chances are good that your job will be killed as it
        will likely go over this amount. Moreover, accurate
        specifications allow jobs to be run with maximum efficiency on
        the system.

        `#BSUB -o hostname_%J.out`

        This line specifies the file to which job output (== STDOUT) not
        already captured by your application log files will be appended.
        If a relative file name is used, it will be relative to your
        current working directory. The `%J `{.inline
        style="overflow-x: hidden;"}in the filename will be substituted
        by the jobID at runtime. If this parameter is omitted, any
        output will be directed to an email that is sent out when the
        job finishes. (Updated 10/29/2020) Note that the output log is
        written out to the specified location while the job is executing
        \-- changed from after the job has finished.

        `#BSUB -e hostname_%J.err`

        This line specifies the file to which job errors (== STDERR)
        will be appended, information not already captured by your
        application log files. LSF submission and processing errors will
        also appear in the file. The `%J`{.inline
        style="overflow-x: hidden;"} in the filename will be substituted
        by the jobID at runtime. If this parameter is omitted, any
        output will be directed to the same location as the `-o`{.inline
        style="overflow-x: hidden;"} parameter, which will be either a
        file or in an email. (Updated 10/29/2020) Note that the error
        log is written out to the specified location while the job is
        executing \-- changed from after the job has finished.

        `#BSUB -B -N #BSUB -u "name@email.com"`

        Because jobs are processed in the \"background\" and can take
        some time to run, it is useful send an email message when the
        job has started or finished. If the job report is \> 10 MB, the
        file(s) will be written to disk and the location noted in the
        job report. **NOTE: guest users must also use use the
        `-u "eamail@address"`
        option in order to have job reports properly routed.**

