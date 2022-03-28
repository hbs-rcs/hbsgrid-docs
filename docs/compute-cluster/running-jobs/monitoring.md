
## Monitoring Jobs & Troubleshooting {#monitoring-jobs-troubleshooting}

Whether using a GUI or the command line, monitoring the progress of your
jobs and understanding how to control them is essential. Below we
provide commands to accomplish both.

Using these commands will provide information about the job state. This
value will typically be one of PENDING, RUNNING, COMPLETED, CANCELLED,
and FAILED:

-   **PENDING:** Job is awaiting a slot suitable for the requested
    resources or you've gone over your limit on resource usage. Jobs
    with high resource demands may spend significant time PENDING if the
    compute grid is busy.
-   **RUNNING:** Job is running.
-   **COMPLETED:** Job has finished and the command(s) have returned
    successfully (i.e., exit code 0).
-   **CANCELLED:** Job has been terminated by the user or administrator
    using bkill.
-   **FAILED:** Job finished with an exit code other than 0.

Please also see our technote on [Monitoring CPU Usage for your
Jobs](https://www.hbs.edu/research-computing-services/help/technical-how-tos-and-technical-notes/monitoring-cpu-usage-of-your-jobs-on-the-hbsgrid.aspx) in
order to understand the runtime behavior of your code.

Note: If using the NoMachine NX client, you will need to open a terminal
window to execute these commands. From the menu bar, select Applications
\> Accessories \> gnome-terminal.

??? note "Summary of LSF Commands for Monitoring and Controlling Jobs"
        
    The table below shows a summary of LSF commands. A link to the
    official LSF documentation is included at the bottom of the table.
    Note that JOBID refers to one of the job IDs listed from the generic
    bjobs command or from your log of jobs you've run.
     
    <table>
    <colgroup>
    <col style="width: 33%" />
    <col style="width: 33%" />
    <col style="width: 33%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th scope="col" style="width: 40%">Action</th>
    <th scope="col" style="width: 10%">LSF command</th>
    <th scope="col" style="width: 50%">Example</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>Submit a batch (background) script or run and application
    script</p></td>
    <td><p><strong><code class="inline" style="overflow-x: hidden;">
    bsub</code></strong></p></td>
    <td><p><code class="inline" style="overflow-x: hidden;"> bsub
    runscript.sh</code></p>
    <p><code class="inline" style="overflow-x: hidden;"> bsub -q long matlab
    -r "myscript"</code></p></td>
    </tr>
    <tr class="even">
    <td><p>Get an interactive session (shell) or script
    interactively</p></td>
    <td><p><strong><code class="inline" style="overflow-x: hidden;"> bsub
    -Ip</code></strong></p></td>
    <td><p><code class="inline" style="overflow-x: hidden;"> bsub -q
    long_int -Is -W 2:00 /bin/bash</code></p>
    <p><code class="inline" style="overflow-x: hidden;"> bsub -q long_int
    -Is -W 10 /bin/bash /bin/hostname</code></p></td>
    </tr>
    <tr class="odd">
    <td><p>Kill a job or kill all jobs</p></td>
    <td><p><strong><code class="inline" style="overflow-x: hidden;">
    bkill</code></strong></p></td>
    <td><p><code class="inline" style="overflow-x: hidden;"> bkill</code>
    JOBID</p>
    <p><code class="inline" style="overflow-x: hidden;"> bkill
    0</code></p></td>
    </tr>
    <tr class="even">
    <td><p>View current/pending jobs</p>
    <p>View specific job</p>
    <p>View details (long format) of job</p></td>
    <td><p><strong><code class="inline" style="overflow-x: hidden;">
    bjobs</code></strong></p></td>
    <td><p><code class="inline" style="overflow-x: hidden;">
    bjobs</code></p>
    <p><code class="inline" style="overflow-x: hidden;"> bjobs</code>
    JOBID</p>
    <p><code class="inline" style="overflow-x: hidden;"> bjobs -l</code>
    JOBID</p></td>
    </tr>
    <tr class="odd">
    <td><p>View the output and error files of a job</p></td>
    <td><p><strong><code class="inline" style="overflow-x: hidden;">
    bpeek</code></strong></p></td>
    <td><p><code class="inline" style="overflow-x: hidden;"> bpeek</code>
    JOBID</p></td>
    </tr>
    <tr class="even">
    <td><p>View queue status</p>
    <p>View queue status for all users</p></td>
    <td><p><strong><code class="inline" style="overflow-x: hidden;">
    bqueues</code></strong></p></td>
    <td><p><code class="inline" style="overflow-x: hidden;">
    bqueues</code></p>
    <p><code class="inline" style="overflow-x: hidden;"> bqueues -u
    all</code></p></td>
    </tr>
    <tr class="odd">
    <td><p>View recent past job info</p>
    <p>View list of past jobs (failed or good) from date to now</p>
    <p>View details (long format) of past job</p></td>
    <td><p><strong><code class="inline" style="overflow-x: hidden;">
    bhist</code></strong></p></td>
    <td><p><code class="inline" style="overflow-x: hidden;"> bhist</code>
    JOBID</p>
    <p><code class="inline" style="overflow-x: hidden;"> bhist -a [-n #] -S
    2017/09/01,</code></p>
    <p><code class="inline" style="overflow-x: hidden;"> bhist -l [-n #]
    JOBID</code></p>
    <p>Note: The <code class="inline" style="overflow-x: hidden;"> -n</code>
    option (where n = 0 or 1 - 400) must be used for jobs older than a day
    or two. This indicates how many jobs lobs to look backwards through. 0
    indicates first 100 logs, and may result in the command taking several
    tens of seconds to return any information.</p></td>
    </tr>
    <tr class="even">
    <td><p>Check how busy the cluster is by user</p>
    <p>View cluster load by several criteria</p></td>
    <td><p><strong><code class="inline" style="overflow-x: hidden;">
    bjobs</code></strong></p></td>
    <td><p><code class="inline" style="overflow-x: hidden;"> bjobs -u
    all</code></p>
    <p><code class="inline" style="overflow-x: hidden;"> bqueues</code>
    <code class="inline" style="overflow-x: hidden;">
    bhosts</code> <code class="inline"
    style="overflow-x: hidden;"> lsload</code></p></td>
    </tr>
    </tbody>
    </table>
     
    See additional commands in the [official LSF
    documentation](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_welcome/lsf_kc_cmd_ref.html).

## Troubleshooting Jobs and Resources {#troubleshooting-jobs-and-resources}

A variety of problems can arise when running jobs and applications on
the HBSGrid. Many are related to resource misallocation, but there are
other common problems as well. Be sure to check for email messages from
the schedule which may explain problems; or check the log files from
your application.

  Error                                                                                         | Likely Cause
  ----------------------------------------------------------------------------------------------| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `JOB <jobid> CANCELLED AT <time> DUE TO TIME LIMIT`{.inline style="overflow-x: hidden;"}      | You did not specify enough time in your submission script. The `-W`{.inline style="overflow-x: hidden;"} option sets time in minutes or can also take HH:MM form (12:30 for 12.5 hours)
  `Job <jobid> exceeded <mem> memory limit, being killed`{.inline style="overflow-x: hidden;"}  | Your job is attempting to use more memory than you've requested for it. Either increase the amount of memory requested or, if possible, reduce the amount your application is trying to use. For example, many Java programs set heap space using the `-Xmx`{.inline style="overflow-x: hidden;"} JVM option. This could potentially be reduced.
  `Exited with exit code N`{.inline style="overflow-x: hidden;"}                                | Your job failed because your application exited with an error. Please look at the job or application logs to determine why your program exited abnormally.

If you are unable to determine why your jobs are not running correctly,
please [contact
RCS](mailto:research@hbs.edu?subject=Running%20a%20Job%20on%20the%20Grid%20(Issue))
for assistance.
