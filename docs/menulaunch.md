# 🚀 Run Desktop Applications

You can run applications on powerful HBS Grid 
[compute nodes](commandline.md#compute-cluster-basics) by 
[connecting to the HBS grid via NoMachine](index.md#quick-start) and clicking 
one of the application icons under the **Applications** or **Activities** menus. 
This allows you to easily run compute and/or memory intensive applications with 
just a few mouse clicks!

## Basic launcher options

!!! important inline end
    Note that **the system reserves the
    resources you select**, e.g., CPUs used by your job become
    unavailable for other users. **Request only 1 CPU** unless you
    know that you are using code or libraries that were written to run
    in parallel. Specific memory requirements depend on the nature of
    the job, but as a rough guide **we recommend requesting RAM 4-10
    times the size of your data**. For example, if you have a 6 Gb
    .csv file you may wish to request 24GB of memory or so.

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

-   Interactive jobs are limited to 12 CPUs for up to 24 hours, or 4
    CPUs for up to 72 hours.

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
