## Guidelines for Choosing Resources {#guidelines-for-choosing-resources}

Whether running an interactive or batch job, it is important to
understand the resources being used in the background of your
submissions.

## Choosing Your Resources {#choosing-your-resources}

See our [Choosing Resources
seminar](https://www.hbs.edu/research-computing-services/Shared%20Documents/Training/choosing_resources.pdf)
for more details on these guidelines.

??? note "RAM"
    
    Quick Tips for Choosing RAM:

    -   Check your MAX MEM usage (see below) from past job history, and
        select best fit memory footprint.
    -   A little more difficult, but write custom [LSF job submit
        commands](/research-computing-services/resources/compute-cluster/running-jobs/running-a-program-submitting-a-job.aspx#custom)
        to closely match memory usage that you need. You\'ll need to do
        this if requiring RAM amounts \> 20 GB, as the default wrapper
        scripts only allow 20 GB RAM allocations as a maximum.
    -   Each language has commands that will give you the memory usage
        of your data while loaded (in memory; see below).
    -   Or, if not creating new data structures after reading in data
        file and your data file is under 10GB, try RAM footprint that is
        10x the data file size. If creating new ones, try 20x to 30x.
    -   Or, try a large memory size (e.g. 20GB), finish your work, and
        decrease the memory ask by checking the MAX MEM usage, and
        selecting best fit memory footprint next time.
    -   Give yourself about 20% wiggle room.

    ??? note "Finding the MAX MEM Info in Terminal"
        

        In a terminal window, use the bjobs -l command for a currently
        running job and the bhist -l command for finished jobs (recall
        that the -l flag asks for the output in a long format with more
        detailed information). Scroll until you see the header MEMORY
        USAGE. For example:

        ` [jharvard@rhrcscli01:~]$ bjobs –l……MEMORY USAGE: MAX MEM: 788 Mbytes; AVG MEM: 446 Mbytes`

        This MAX MEM values in bold can now inform how much RAM you
        would ask for next time you do similar work or work with the
        same data.

    ??? note "Advanced Options"

        If you would like to avoid scrolling through the output of the
        bjobs or bhist commands, you can write a longer customized
        statement so that only the MAX MEM is output:

        ` [jharvard@rhrcscli01:~]$ bjobs -l | grep -E "Application|IDLE|MAX" Job <144795>, User <rfreeman>, Project <XSTATA>, Application <stata-mp4-30g>, S                                                      IDLE_FACTOR(cputime/runtime):   0.01 MAX MEM: 56 Mbytes;  AVG MEM: 49 Mbytes `

        The next example can be used to display information for jobs
        that ran since a particular date. Here we will use the
        flags -a (all jobs), -l (long format), and -S (submitted date;
        comma indicates range up to today):

        `[jharvard@rhrcscli01:~]$ bhist -a -l -S 2017/09/1, | grep -E "Application|IDLE|MAX" Job <158502>, User <jharvard>, Project <STATA-SE>, Application <stata-se-5g>, I MAX MEM: 12 Gbytes;  AVG MEM: 12 Mbytes Job <158547>, Job Name <MATLAB>, User <rfreeman>, Project <MATLAB>, Application MAX MEM: 607 Mbytes;  AVG MEM: 511 Mbytes                                  `

    ### Finding the RAM Usage in Programming Environments (e.g., Stata) {#finding-the-ram-usage-in-programming-environments-e.g.-stata}

    Estimating RAM usage can be easy in the analysis and programming
    environments that researchers typically use. Each language has
    commands that will give you the memory usage of your data while
    loaded (in memory). A few examples are listed below.

    NB! In all situations, one should add at least 0.5 - 1 GB of RAM to
    the values reported by your environments when requesting RAM as a
    part of your job submission to account for the overhead of running
    the application.

    Estimating RAM usage in your analysis/programming environment can be
    easy as each language has commands to output the memory usage of
    your data while loaded (in memory). Add at least 0.5 - 1 GB of RAM
    to this value when requesting RAM as a part of your job submission
    to account for the overhead of running the application.

    ??? note "Stata"
        
        In Stata, the memory command will display details about the RAM
        usage, and the grand total indicates amount of memory actually
        used and amount of memory allocated. We recommend taking the
        larger of the two values. Please see the [Stata manual
        entry](https://www.stata.com/manuals/dmemory.pdf) for memory for
        more information.

        ![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/ram1.png){style="max-width:500px;"}

    ??? note "R"
        
        In R, the `mem_used()`{.inline
        style="overflow-x: hidden;"} function of the pryr package can
        inform your variable usage. Please see
        the <http://adv-r.had.co.nz/memory.html> (by Hadley Wickham) for
        more information.

        ![](https://www.hbs.edu//research-computing-services/Shared%20Documents/Grid/ram2.png){style="max-width:500px;"}

    ??? note "Python"
        
        The `guppy` module is a
        library and programming environment for Python, currently
        providing in particular the Heapy subsystem, which supports
        object and heap memory sizing, profiling and debugging.

        `from guppy import hpy h = hpy() print h.heap() Total size = 19909080 bytes. `

        Please see the [guppy PyPi](https://pypi.python.org/pypi/guppy)
        page for more information or [this
        tutorial](https://www.pluralsight.com/blog/tutorials/how-to-profile-memory-usage-in-python).

    ??? note "MATLAB"
        
        Sadly, MATLAB does not have a command common to all platforms
        that will give memory usage. On Windows, one can use
        the `memory()` function:

        `>> A = magic(1000); B = phantom(500); C = peaks(250); in_use = memory() Maximum possible array: 6397 MB (6.708e+09 bytes) * Memory available for all arrays: 6397 MB (6.708e+09 bytes) * Memory used by MATLAB: 1094 MB (1.148e+09 bytes) Physical Memory (RAM): 7861 MB (8.243e+09 bytes) * Limited by System Memory (physical + swap file) available. `

        One Mac and Linux, one must run download and run the small
        script [monitor_memory_whos.m](https://www.mathworks.com/matlabcentral/answers/uploaded_files/1861/monitor_memory_whos.m) in
        order to determine what is going on under the hood:.

        `>> A = magic(1000); B = phantom(500); C = peaks(250); in_use = monitor_memory_whos in_use = 10.0136`

        The value reported in MB is that used by objects in the
        application space. MATLAB itself will use about 500 MB. Please
        see this
        [Mathworks](https://www.mathworks.com/matlabcentral/answers/97560-how-can-i-monitor-how-much-memory-matlab-is-using)
        technote for more information on MATLAB\'s memory usage.

??? note "Cores"
    
    Quick Tips for Choosing Cores:

    -   More is not really better, since this is a shared resource.
    -   Use fewer cores (1!) for interactive work, especially if you
        plan on having a session open over several days. It is
        considered bad form to leave sessions open for more than 7 days,
        as no one can use the resources that are reserved exclusively
        for your use.
    -   Choosing multiple cores for interactive work is OK if you will
        be finishing your work in hours to a day or two. Please do not
        let these sessions sit idle.
    -   Remember that MATLAB, R, and Python can only use 1 CPU unless
        you\'ve programmed it to do otherwise.
    -   Stata can use multiple CPUs, but be conservative. Again, more is
        not necessarily better.

??? note "Queue"

    The HBS grid has does have some per-user resource limits, but
    unlimited run times for interactive sessions and batch jobs are no
    longer permitted. In general, the lower the cores requested per job,
    the long the job can run. This table gives a summary of the runtime
    and core limits:

        Queue       Type                  Max Run Time   Max Cores/Job   Fairshare
        ----------- --------------------- -------------- --------------- -----------
        long_int    interactive           3 days         4               No
        short_int   interactive           1 day          12              No
        sas_int     interactive           no limit       4               No
        gpu         interactive & batch   no limit       4               No
        long        batch                 7 days         12              Yes
        short       batch                 3 days         16              Yes
        mini        batch                 12 hrs         16              Yes
        micro       batch                 1 hr           16              Yes
        unlimited   batch                 no limit       4 (for now)     No
        sas         batch                 no limit       4               No

    
    Details on the queues are as follows:

    ***Interactive queues:*** Interactive queues are divided into long
    and short run lengths, based on the number of cores requested per
    job. Additionally, since we wish to ensure that all persons should
    be able to get at least one interactive session, there is a maximum
    of 24 cores allowed over a max of 3 sessions; more than 12 cores for
    a given job are not permitted (\"interactive sessions limit\").

    ### **long_int**

    This queue is dedicated for interactive (foreground / live) work,
    for testing (interactively) code before submitting in batch or
    scaling, or for exploratory work. Serial and parallel jobs using 1
    to 4 cores are permitted in this queue, can run a maximum of 3 days,
    and are subject to the interactive sessions limit.

    ### **short_int**

    This queue is also dedicated for interactive (foreground / live)
    work, for testing (interactively) code before submitting in batch or
    scaling, or for exploratory work. Parallel jobs using 1 to 12 cores
    are permitted in this queue, can run a maximum of 1 day, and are
    subject to the interactive sessions limit.

    ### **sas_int**

    This queue is dedicated for interactive and code testing work for
    SAS, before submitting in batch or scaling. Serial and parallel jobs
    using 1 to 4 cores with small resource requirements (RAM/cores) are
    permitted on this queue, and can run for an unlimited length of
    time.

    ### **gpu**

    This queue is available for both interactive and batch work, and
    must be specified in order to access GPUs on the compute node(s). In
    addition to specifying the queue itself, default or custom gpu usage
    parameters should be included in your job submission command, or use
    an appropriate wrapper script that does this for you (note, as of
    9/22/2020, we do not have wrapper scripts to do so). Please see our
    techncal specs page (forthcoming) for specific details of our CPU
    node(s) and our GPUs on the Cluster webpage (forthcoming) for
    submitting GPU jobs.

    ***Batch queues:*** Batch queues, like the interactive queues, are
    also divided into long and short run lengths, based on the number of
    cores requested per job. Jobs are limited only by the available
    resources on the batch compute nodes, and the scheduler may limit
    dispatching jobs to run based on your [Fairshare
    score](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_admin/fairshare_about_lsf.html){target="_blank"}
    \-- a priority score that might limit your work the more you
    compute, in order to allow others to run theirs as well. Jobs cannot
    exceed a maximum of 16 cores.

    ### **long**

    This queue is general purpose queue for all background, batch work
    and scaled jobs. Serial and parallel jobs using 1 to 12 cores are
    permitted in this queue, can run a maximum of 7 days, are only
    limited by the available resources on the system and your Fairshare
    priority score.

    ### **short**

    This queue is general purpose queue for all background, batch work
    and scaled jobs. Serial and parallel jobs using 1 to 16 cores are
    permitted in this queue, can run a maximum of 3 days, and are only
    limited by the available resources on the system and your Fairshare
    priority score.

    ### **mini**

    This queue is general purpose queue for all background, batch work
    and scaled jobs, though is ideally for quick-turnaround use. Serial
    and parallel jobs using 1 to 16 cores are permitted in this queue
    (though we recommend no more than 8), can run a maximum of 12 hrs,
    and are only limited by the available resources on the system and
    your Fairshare priority score.

    ### **micro**

    This queue is general purpose queue for all background, batch work
    and scaled jobs, also is ideally for super quick-turnaround use.
    Serial and parallel jobs using 1 to 16 cores are permitted in this
    queue (though we recommend no more than 4), can run a maximum of 1
    hour, and are only limited by the available resources on the system
    and your Fairshare priority score.

    ### **unlimited**

    This queue is for single or parallel work up to 4 cores per job with
    no run time limit (Note: the max cores/job may increase later during
    the beta-testing period). Since there are very few number of compute
    nodes for this type of work, your job will schedule when room is
    available and the previous jobs have finished. We highly recommend
    that you do not use this queue if possible.

    ### **gpu**

    Please see the description above.

    ### **sas**

    This queue is a general purpose queue for all SAS background, batch
    work and scaled jobs. Jobs submitted here can use 1 to 4 cores, are
    only limited by the available resources on the dedicated SAS nodes,
    and can run for an unlimited length of time.

    ### **[]{#fairshare}Fairshare**

    Without additional intervention, schedulers usall dispatch jobs by
    FIFO - first in, first out. This can lead to persons dumping
    hundreds or thousands of jobs on the cluster, monopolizing resources
    and preventing fair access, particularly in the batch queues. To
    prevent this, the batch queues use Fairshare: each person has a
    dynamic priority score that decreases as you use more compute. This
    allows the scheduler to move those with higher prioirty to the front
    of the queue. Since this is recalculated on a periodic cycle and
    after jobs complete (compute is used), one\'s priority shifts back
    and forth relative to other busy users, allowing jobs to be
    scheduled for all users.

    ### **[]{#scheduling_considerations}Scheduling Considerations - Resource Reservation and Backfill Scheduling**

    Between FIFO and Fairshare, these two features usually ensures
    smooth job scheduling and high turnaround, so each person gets
    results back as quickly as possible. Sometimes, though, hiccups do
    occur and we need to make adjustments.

    Large jobs \-- those bigger in cores/RAM than what is currently
    running \-- can be delayed for long periods when the cluster is both
    very busy and many jobs are waiting to run. And as we don\'t require
    run time limits for submitted jobs (interactive applications and
    batch jobs), how is the scheduler to know how to plan \-- to
    schedule?! Its approach is to run smaller jobs, even if your
    scheduling priority is high (your [Fairshare
    score](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_admin/fairshare_about_lsf.html){target="_blank"}
    is higher than that of other people whose jobs are pending),
    inconveniencing and frustrating those with \'bigger\' jobs.

    To remedy this, we have made two changes to our configuration:

    -   We have enabled resource reservation for
        [cores](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_admin/reserving_processors.html){target="_blank"}
        and
        [RAM](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_admin_short_job/reserve_memory_license.html){target="_blank"},
        which holds cores/RAM free for a configurable period of time.
        This creates an opportunity for the bigger jobs to run, although
        resources might sit idle (see next). We will take the time to
        periodically tune this to ensure jobs aren\'t waiting (\... and
        waiting \...).
    -   We have also enabled [backfill
        scheduling](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_admin/backfill.html){target="_blank"},
        a feature that will schedule small jobs on reserved/idle
        resources, provided those jobs are predeicted to finish before
        the anticipated start of the larger jobs. This depends on using
        the -W and -We options. This should promote efficient job
        throughput.

    LSF\'s scheduling algorithm prioritizes cluster utilization and
    efficiency, not necessarily fair scheduling for our users. The
    resource reservation with (configurable) grace periods should remedy
    this. And backfill scheduling should increase job throughput to
    levels we experience now.

    **Those users who submit jobs with the -W or -We options will likely
    see higher throughput**, as this exact or approximate, estimated run
    times will inform the scheduler on run lengths, and these jobs are
    scheduled via backfill scheduling on the reserved resources ahead of
    other pending jobs.

    We hope this helps you utilize the HBSGrid cluster resources more
    effectively. As always, please [contact
    RCS](mailto:mailto:research@hbs.edu?subject=LSF%20queues%20and%20scheduling%20questions)
    if you should have any questions.

??? note "Time"

    Tips for Choosing Time:

    In general we do not require persons to submit jobs with time limits
    (-W), though this requirement is standard on most clusters
    elsewhere. Once your job exceeds a given time limit, the job is
    killed by the scheduler. Although it appears more advantageous to
    submit jobs without a time limit, there are reasons and advantages
    to include a time limit.

    Please note:

    -   If one does not include a time limit with a job submission, the
        limit is then the maximum run time for the queue. For example,
        if one submits to the long_int queue without a time limit, your
        job can run for up to 3 days.
    -   Including a run time (-W) or estimate (-We) may result in faster
        dispatch (job start) time, especially if the time you supply is
        shorter than then max time for the queue. Here, the scheduler
        thinks your job is smaller, and will try to fit it in before
        others.
    -   Including the -W or -We options also permits the scheduler to
        return estimated dispatch times, an especially helpful indicator
        when the cluster is busy
    -   If one is unsure of the run time, the run time estimate (-We)
        can be supplied instead when submitting the job. This hint
        assists the scheduler for arranging job assignment and dispatch.
        Unlike the -W option, one\'s job is not killed if exceeding the
        -We run time estimate value.

## User Limits {#user-limits}

At this time, the following constraints have been put in place to help
give fair usage:

-   For interactive sessions, each user can use up to 16 CPUs (cores)
    across all jobs and up to 3 jobs at a time. For batch jobs, there is
    no hard limit on the number jobs that can run at once. Instead, the
    scheduler will dynamically limit the number of jobs dispatched to
    run based on past usage. This is an upper limit of 16 cores/job, and
    we also cap a total of 100 CPUs in play at any one time.
-   There are currently no limits on RAM (memory). This may change as we
    find that underuse of requested RAM (RAM wasted) is a significant
    problem.
-   If you launch 3 Stata-MP4 sessions on the NoMachine server (which
    consumes a total of 12 cores), and then try to launch any other
    program, this program will not pend as long as it doesn\'t consume
    more than the remaining 12 cores. 

If your work requires resources beyond these limits, please
[contact Research Computing Services](mailto:research@hbs.edu) (RCS) so
that we can arrange temporary exemptions.
