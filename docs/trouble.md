## Troubleshooting Login Issues

Login issues are usually caused by one of three common problems, and are often easy to resolve.

### Network and VPN

Connecting to the HBS Grid requires either a direct on-campus connection to the
HBS network or a 
[VPN connection](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf) 
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
one of the most common reasons for difficulties connecting to the HBS Grid desktop via NoMachine.

You can fix this problem yourself by opening a terminal (in the Windows search toolbar, type "Cmd" or "Windows PowerShell"; in the Mac search toolbar, type "Terminal") and running

```sh
ssh <username>@hbsgrid.hbs.edu
```

(replace `<username>` with your actual HBS Grid username). Once connected you can use terminal
commands like `ls` to list files in the directory, `rm` (remove) plus the name of the file to remove files you don't need, or `mv` (move) plus the name of your file and a path to a new location to move files. Removing and moving files can help get your home directory back under your storage 
quota. You can also run `gio trash --empty` to empty the trash, which may give you enough 
breathing room to permit NoMachine login.

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
       to list all your recent jobs. The JOBID is the first number in the output`.
    2. Get detailed information about a specific job by running_
       `bjobs -l <JOBID>`  
       where `<JOBID>` is the number you looked up in step 1.
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

