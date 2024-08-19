# 🚀 Run Desktop Applications

You can run applications on powerful HBS Grid 
[compute nodes](commandline.md#compute-cluster-basics) by 
[connecting to the HBS grid via NoMachine](index.md#quick-start) and clicking 
one of the application icons under the **Applications** or **Activities** menus. 
This allows you to easily run compute and/or memory intensive applications with 
just a few mouse clicks!

## Basic launcher options

Each application will open a dialog where you can configure your
environment and resource requirements.

The application launchers are meant to be intuitive and easy to use.
Most of the fields should be self-explanatory, e.g., there is a
numeric field for memory (RAM) in Gigabytes, and another for the
number of CPUs needed. As a convenience you can select a starting
directory.

If your application needs a GPU make sure that you check the *Needs GPU* box.

Click the video thumbnail below to watch an application launcher
demonstration:

<video width="100%" controls>
  <source src="../media/launchers.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

## Resource recommendations

When choosing RAM and CPU values, keep in mind that 
**the system reserves these resources exclusively for your use**. That is, cores and RAM used by your job
become unavailable for other users. Please be considerate and do not reserve resources you don't need.

Specific memory requirements depend on the nature of the job, but as a rough guide:

-   If your code runs on your local machine, start by asking for 
    the same amount of RAM or less (for example, if your laptop has 8GB of RAM, try asking for 8GB).
  
-   If you are loading in native binary data files, 
    ask for an amount of RAM about 1.5x the size of your data.
  
-   If you are importing a text file (e.g., CSV), you may need to request 
    up to 8 - 10x the size of the text file.
    This should be a one-time operation: We discourage ongoing reading and writing of text files, 
    as these operations are expensive, especially on large data files. 
    To save time and RAM, try to read your text files into binary data files 
    and work primarily with those. (You may find Stat/Transfer helpful for this.)
  
-   You can review your memory usage from a past job by running `bhist -l <JOBID>`
    use `bhist` alone for a list of your recently run jobs). 
    Take note of `MAX MEM` and when you run a similar job in the future, 
    request that amount plus about 20% for wiggle room 
    (e.g., if your past job had a maximum memory usage of 10GB, request 12GB next time).

We recommend that you **request only 1 CPU**, especially for interactive work, unless you
know that you are using code or libraries that were written to run
in parallel such as 
[Matlab parallel processing toolbox](https://www.mathworks.com/help/parallel-computing/getting-started-with-parallel-computing-toolbox.html),
[Python multiprocessing library](https://docs.python.org/3/library/multiprocessing.html),
or the [R future package](https://future.futureverse.org/). For detailed parallel
processing instructions [refer to our tutorial](tutorials/scaling-work.md).

## Advanced launcher options

!!! important inline end
    It is a good idea to note the current software environment version when you
    start a new project so you will know which environment to switch back
    to if needed.

If you need to use an older software environment you can do so using
the *software environment version* dialog. **Usually there is no need to
use an environment other than the default**; the purpose of this
mechanism is to make it easy to reproduce an old analysis using a
specific software environment. 

The software and versions available in each environment are
documented in [Software Applications and
Environments](environments.md). 

Some application launchers have a *Pre-submission command* <a name="pre-submission-command"></a>field. This
allows you to run an arbitrary bash command immediately before
submitting the job. For example, you can use it to set [environment
variables](https://www.redhat.com/sysadmin/linux-environment-variables)
or activate [conda environments](https://docs.conda.io/en/latest/). 

## System resources & limits

The HBS Grid is configured with limits to prevent any single user from
monopolizing the available resources. Understanding and working within these
limits will make your experience on the HBS Grid more productive and enjoyable.

### Configured system limits

In some cases the desktop launchers will down-grade your request to the
maximum available if your request exceeds the system specified limits.
There are both user-level, queue-level and job-level limits on the resources that are available to you:

-   You are limited to
    3 concurrent interactive jobs.

-   You are limited to a total of
    24 CPUs allocated to interactive jobs at any given time.

-   Interactive jobs are limited to 12 CPUs on the short_int queue, or 4
    CPUs for the long_int queue.

As a practical example of these limits, if you try request 12 CPUs and
runtime greater than 24 hours the system will not be able to meet your
request. In that case it will offer to give you 4 CPUS (the maximum
available for jobs running more than 24 hours).

More information about queue-level limits can be found in the [command line
documentation](commandline.md#queue-characteristics).

### Available resources and resource contention

The HBS grid usually has substantial computational resources available,
but sometimes an unusually large number of users are trying to use a lot
of resources at the same time. In this case resources may become scarce
and you may not be able to access the resources you need.

You can get a quick overview of the state of the cluster using the 
*HBS Grid available resources* utility, available in the applications menu.
This will give you a sense of the current activity on the cluster, and a
rough idea of the resources currently available to you.

Click the video thumbnail below to watch a demonstration of the
available resources utility:

<video width="100%" controls>
  <source src="../media/jobfail.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

The graphical menu-based launchers documented in this section are a
quick and convenient way to run interactive applications on powerful
compute nodes. In the case where you wish to run many such jobs you
may find it more convenient to run batch jobs. Refer to the
[command line documentation](commandline.md) for details.
