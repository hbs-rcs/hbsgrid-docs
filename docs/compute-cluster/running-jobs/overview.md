# Running Jobs Overview

The most important goal for using the HBSGrid is for running programs
and scripts that might consume more resources than are available on your
desktop or laptop. These sections will provide information to give you a
complete understanding of the modes for using the compute cluster as
well as details for doing so effectively.

## [Guidelines for Choosing Resources](guidelines-for-choosing-resources.md)

The HBSGrid's collection of compute nodes and servers are all
coordinated by the software system Load Sharing Facility, otherwise
known as LSF ([see LSF reference
guide](https://www.ibm.com/support/knowledgecenter/en/SSWRJV_10.1.0/lsf_welcome/lsf_welcome.html)),
or the scheduler. This scheduler listens to your requests and then
matches you with the computing resources that you need to perform your
work. These resources are exclusively available to you for the duration
of your job, but is part of a larger shared system with finite
constraints, so it is important to be judicious in your resource usage.
The section on choosing your resources provides guidelines for doing
this.


## [Running a Program/Submitting a Job](running-a-program-submitting-a-job.md)

There are two sets of methods of running programs and jobs on the HBS
compute Grid: using default submission (wrapper) scripts or by writing
custom submission commands. Default submission (wrapper) scripts are the
most straightforward way to submit a job on the HBSGrid. However, with
this ease of use, there is the tradeoff in flexibility: there are
limited choices in what programs can be run and the resources requested.

-   Interactive sessions are appropriate for doing work in graphical
    applications, interactive "console tools" like R and iPython,
    significant script/code development, or efforts like iterative data
    exploration, either in a GUI or at the command line. For example,
    signing in via the NoMachine client, and starting an application
    from the Applications drop-down menus is common (but not the only)
    way start an interactive session.
-   Batch jobs are sessions or program runs that are executed in the
    background and where there isn't any user interaction. This is
    useful for finished scripts or code you wish to run repeatedly, such
    as parameter sweeps or large analyses broken into smaller parts
    (pleasantly parallelizing). This can be done through the command
    line or via the Program Application Center. Scripts written for
    graphical applications like MATLAB, Stata, and SAS, can be run in
    this manner and scaled for large numbers of runs, unleashing the
    power of the compute cluster. Using the Program Application Center
    to start an application with a run script is an example of running a
    batch job.


## [Monitoring Jobs & Troubleshooting](monitoring.md)

Monitoring the progress of your jobs and understanding how to control
them is essential. This section provides key commands to accomplish
this, along with guidance on troubleshooting.

[](/research-computing-services/resources/compute-cluster/running-jobs/scaling-work.aspx){.no-append
.no-pdf-hover style="text-decoration:none;"}

## [Scaling Work](scaling-work.md)

Learn how to scale up your work through such techniques such as parallel
processing.
