## Troubleshooting Login Issues

Login issues are usually caused by one of three common problems, and are often easy to resolve.

### Network and VPN

Connecting to the HBS Grid requires either a direct on-campus connection to the
HBS network or a 
[VPN connection](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/ivanti_connecting-to-vpn_rcs.pdf) 
if you are connecting remotely. 

Ethernet connections from HBS offices or WiFi connections to *HBS Secure* 
will both work without further configuration. Note that connecting from other Harvard 
networks, such as *Harvard Secure* or an Ethernet  connection from another Harvard School 
will not work; you must be connected to the **HBS** network.

If you are connecting from outside the HBS network you must use a
[VPN connection](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf).
If you suspect the VPN is not connected properly try re-installing the VPN client and restarting
your computer.

### Disk quota

A *quota* system is used to limit the amount of data you can store in your home directory on 
the HBS Grid. Reaching this limit can prevent *NoMachine* sessions from starting, and this is 
one of the most common reasons for difficulties connecting to the HBS Grid desktop via NoMachine. Please see our [instructions](storage.md#home-folder-quota) to fix this problem.

### NoMachine Hanging While Loading Session

If you get stuck on a spinning loading wheel when trying to connect to a NoMachine session:

1. Cancel the hanging connection attempt.
2. Right click on the Virtual Desktop button and select "Terminate session."
3. Start a new NoMachine session.

To avoid such issues and to prevent instability on the login nodes, we recommend that users 
**always log out of NoMachine completely** when they are finished with their work.

If you still cannot get a NoMachine session after following the above steps, please [contact RCS](mailto:research@hbs.edu).

### Shell misconfiguration

Some users like to configure the startup behavior of their login shell by editing the
`~/.bashrc` or `~/.bash_profile` configuration files. A common problem is that activating
*conda*, *software modules* or other environments in these config files can cause problems
with *NoMachine* connections. 

If you suspect this has happend, you can fix this problem yourself by opening a terminal 
(Cmd prompt or PowerShell on Windows) and running

```sh
ssh <username>@hbsgrid.hbs.edu
```

(replace `<username>` with your actual HBS Grid username). One connected you can use a 
terminal-based editor 
[such as nano](https://www.howtogeek.com/howto/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/)
to comment out or remove sections of your config files that you suspect have caused the problem. 
Alternative you can run

```
mv ~/.bashrc ~/backup.bashrc
mv ~/.bash_profile ~/backup.bash_profile
```

to temporarily move your config files to backup locations.


## Troubleshooting LSF Jobs {#troubleshooting-jobs-and-resources}

A variety of problems can arise when running jobs and applications on
the HBSGrid. LSF provides *command-line tools* to monitor and inspect your jobs
to help you figure out if something goes wrong.

!!! example "Job troubleshooting steps"

    Open a *Terminal* and the HBS Grid and run the commands below to troubleshoot jobs.
    
    1. Get the JOBID number by running  
       `bjobs`  
       If your job is no longer running use  
       `bhist -a`  
       to list all your recent jobs, whether finished or unfinished. The JOBID is the first number in the output`.
    2. Get detailed information about a specific job by running_
       `bjobs -l <JOBID>`  
       where `<JOBID>` is the number you looked up in step 1. The -l flag asks for the output in a long format with more detailed information.
    3. You can also look at any output produced by your job by running  
       `bpeek <JOBID>`
    4. Older jobs may not appear in `bjobs`. In that case you can still get some
       information by running  
       `bhist -l <JOBID>`  

The `bjobs -l <JOBID>` command give you information about the *state* of the job,
as defined below.

!!! info "Job state definitions"
    
    `PENDING`
     
    :   Job is awaiting a slot suitable for the requested
        resources or you've gone over your limit on resource usage. Jobs
        with high resource demands may spend significant time PENDING if the
        compute grid is busy.
        
    `RUNNING`
        
    :   Job is running.
     
    `COMPLETED`
        
    :    Job has finished and the command(s) have returned
        successfully (i.e., exit code 0).
     
    `CANCELLED`
        
    :   Job has been terminated by the user or administrator
        using `bkill`.
     
    `FAILED`
        
    :   Job finished with an exit code other than 0.


If your job has failed `bjobs` will usually tell you why, but these messages can be cryptic.
The most common are described below.

  Error                                                    | Likely Cause
  ---------------------------------------------------------| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  `JOB <jobid> CANCELLED AT <time> DUE TO TIME LIMIT`      | You did not specify enough time in your submission script. The `-W` option sets time in minutes or can also take HH:MM form (12:30 for 12.5 hours)
  `Job <jobid> exceeded <mem> memory limit, being killed`  | Your job is attempting to use more memory than you've requested for it. Either increase the amount of memory requested or, if possible, reduce the amount your application is trying to use. For example, many Java programs set heap space using the `-Xmx` JVM option. This could potentially be reduced.
  `Exited with exit code N`                                | Your job failed because your application exited with an error. Please look at the job or application logs to determine why your program exited abnormally.

For more detailed information refer to the [official LSF
documentation](https://www.ibm.com/docs/en/spectrum-lsf/10.1.0?topic=run-jobs).

## Jobs Exceeding Memory Limit {#MaxMem}

Many times, a job that suddenly shuts down without an apparent error message has exceeded its memory limit (i.e., too little RAM was requested for the job). You can confirm this in a terminal window by using the `bhist -a -l` command to review all recent jobs (recall that the `-a` displays historical job information about both finished and unfinished jobs and the `-l` command asks for the output in a long format with more detailed information). Scroll until you see the header MEMLIMIT. Just above this may be an error message indicated that the job was killed after reaching the memory limit and just below will be the memory  used. For example:

```
[jharvard@rhrcscli01:~]$ bhist -a –l
...
Tue Dec 23 14:46:42: Submitted from host <rhrcscli1>, to Queue <short>, CWD <$H
                     OME/dev/pipeline>, Output File </export/pr
                     ojects5/facultyproject/log.log>, Error File </export/projects5/facultyproject/
                     error.log>, 12 Task(s), Requested 
                     Resources <rusage[mem=49152]>, memory/swap limit enforced 
                     per-job/per-host;
Tue Dec 23 14:46:43: Dispatched 12 Task(s) on Host(s) <12*rhrcsnod19>, Allocate
                     d 12 Slot(s) on Host(s) <12*rhrcsnod19>, Effective RES_REQ
                      <select[type == local] order[r15s:pg] rusage[mem=49152.00
                     ] span[hosts=1] affinity[core(1)*1] >;
Tue Dec 23 14:46:43: Starting (Pid 258999);
Tue Dec 23 14:46:43: Running with execution home </export/home/itg/idoroshenko>
                     , Execution CWD </export/home/itg/idoroshenko/dev/bbaik-wo
                     rdcount-pipeline>, Execution Pid <258999>;
Tue Dec 23 16:34:13: Exited with exit code 1. The CPU time used is 31911.0 seco
                     nds;

Tue Dec 23 16:34:13: Completed <exit>; TERM_MEMLIMIT: job killed after reaching
                      LSF memory usage limit;


 MEMLIMIT
     48 G 

MEMORY USAGE:
MAX MEM: 48 Gbytes;  AVG MEM: 1.3 Gbytes

```

The MAX MEM values can inform how much RAM you would ask for next time you do similar work or work with the same data. If the amount was not sufficient for your job and the job exceeded the memory limit and was shut down, you know that you will need to ask for more memory the next time. This output can also tell you if you've asked for more RAM than was needed to complete the job.

If you would like to avoid scrolling through the output of the `bhist` commands, you can write a longer customized statement so that only the MAX MEM and AVG MEM are output:

```
[jharvard@rhrcscli01:~]$ bhist -a -l | grep -E "MAX"

MAX MEM: 29.5 Gbytes;  AVG MEM: 20.5 Gbytes
MAX MEM: 373 Mbytes;  AVG MEM: 299 Mbytes
MAX MEM: 50 Gbytes;  AVG MEM: 7.4 Gbytes
MAX MEM: 46.4 Gbytes;  AVG MEM: 41.9 Gbytes
MAX MEM: 1.1 Gbytes;  AVG MEM: 997 Mbytes
MAX MEM: 42.2 Gbytes;  AVG MEM: 36.6 Gbytes
MAX MEM: 915 Mbytes;  AVG MEM: 340 Mbytes
MAX MEM: 471 Mbytes;  AVG MEM: 211 Mbytes
```
You can further customize this output to focus on particular dates, or parse the output further if you were running many jobs. Below is an example of how you can narrow down the dates (using the `-S` submitted date command with a comma to indicate a date range up to today), and output when jobs were submitted, the job ID, the RAM (memory) requested, the maximum/average amount of RAM (memory) used, and the reason a job failed (if applicable):

```
[jharvard@rhrcscli01:~]$ bhist -a -l -S 2025/12/20, | awk '
/^Job </ {match($0,/Job <([0-9]+)/,m); jobid=m[1]; mem_req="MEM_REQ=NA"; reason=""}
/Submitted from host/ {split($0,a,":"); submittime=a[1]":"a[2]":"a[3]}
/MEMLIMIT/ {getline; gsub(/^[ \t]+/,""); mem_req="MEM_REQ=" $0}
/Completed <exit>;/ {s=index($0,";"); reason=substr($0,s+1); gsub(/^[ \t]+/,"",reason)}
/MAX MEM:/ {print submittime "\tJobID=" jobid "\t" mem_req "\t" $0 (reason?"\t"reason:"")}'

Mon Jan  5 10:15:09	JobID=3083242	MEM_REQ=30 G 	MAX MEM: 30 Gbytes;  AVG MEM: 21.5 Gbytes
Mon Jan  5 12:22:32	JobID=3083263	MEM_REQ=30 G 	MAX MEM: 30 Gbytes;  AVG MEM: 19.2 Gbytes
Mon Jan  5 12:37:43	JobID=3083266	MEM_REQ=30 G 	MAX MEM: 30 Gbytes;  AVG MEM: 6.8 Gbytes
Mon Jan  5 12:59:31	JobID=3083390	MEM_REQ=40 G 	MAX MEM: 33 Gbytes;  AVG MEM: 24.5 Gbytes
Mon Jan  5 16:53:45	JobID=3083455	MEM_REQ=35 G 	MAX MEM: 35 Gbytes;  AVG MEM: 22.8 Gbytes
Mon Jan  5 17:38:21	JobID=3083461	MEM_REQ=40 G 	MAX MEM: 33 Gbytes;  AVG MEM: 26.3 Gbytes
```

For more detailed information refer to the [official LSF
documentation](https://www.ibm.com/docs/en/spectrum-lsf/10.1.0?topic=reference-bhist) about `bhist`.

## Stata Temporary Files and Temp Storage {#stata-temporary-files-and-stata-tmp}

If there is not enough disk space available in `/tmp` *Stata* may give you an error message that looks like this:

```
insufficient disk space
r(699);
```

As a first step you may be able to change your *Stata* code to reduce the amount of temp space 
needed -- `preserve` and `restore` commands are often the cause.

You can also try deleting any files you have in `/tmp` and see if that gives you enough space.
Since each computer in the cluster has it's own `/tmp` disk you need to do this on the computer 
*Stata* is running on. An easy way to achieve that is to delete files directly from *Stata* 
[using the shell escape feature](https://www.stata.com/manuals/dshell.pdf). For example, running 
`! rm /tmp/my-temp-file` in *Stata* will delete `/tmp/my-temp-file`.

If you cannot get enough space on `/tmp` you can tell *Stata* to store temporary files in a 
[Scratch storage](storage.md#scratch-storage) directory on the HBS Grid.

!!! example "Use scratch storage for *Stata* temp files"

    1. Create a directory under `/export/scratch` and ensure that the 
       [permissions are set correctly](worksafe.md).
    2. Set the `STATATMP` environment variable to the directory you created
       in step one. Use [launcher options](menulaunch.md#pre-submission-command)
       if running from the destkop, or [set this variable from the command line](https://man.archlinux.org/man/export.1p).
    3. Start *Stata* as usual after setting the `STATATMP` environment variable as described in steps 1-2 above.

More details about this issue can be found in the [Stata FAQ](https://www.stata.com/support/faqs/data-management/statatmp-environment-variable/).

