# Help and support

If you run into any problems please let us know! You can reach out to us directly via email at 
[research@hbs.edu](mailto:research@hbs.edu).
Our dedicated support team is happy to assist you.

We've provided checklists below for the most common issues that our users experience. 
To help us help you, **please work through the relevant list(s)** and **include all relevant information** (LSF logs, error logs and messages, etc.) and at which step you encountered an issue when you reach out to us.

## HBSGrid Account & Login Issues (#troubleshooting-account)

1.  **If you are a guest**, have you successfully completed our [instructions](https://secure.hbs.edu/accountManagement/guest/research/new-member-instructions) to obtain access to the cluster?
2.  Are you **[connected to the appropriate network](https://hbs-rcs.github.io/hbsgrid-docs/trouble/#network-and-vpn)**: i.e., the HBS VPN if off-campus, or to the wired HBS ethernet/HBSSECURE wireless if on-campus? 
    - *Please note that using Harvard Secure VPN/Wireless or a non-HBS ethernet connection will not work.*
3.  Are you using the **correct username and login hostnames** as outlined in our [Quick Start guide](https://hbs-rcs.github.io/hbsgrid-docs/#quick-start)?
4.  **If you are accessing the cluster via NoMachine**:
    - Is your [home folder full](https://hbs-rcs.github.io/hbsgrid-docs/trouble/#disk-quota)?
    - Have you [altered your login scripts](https://hbs-rcs.github.io/hbsgrid-docs/trouble/#shell-misconfiguration) (.bashrc / .bash_profile)? Activating conda, software modules or other environments in these config files can cause problems with NoMachine connections.

## Storage & Project Spaces - Access Problems (#troubleshooting-spaces)

1.  Has your **access been approved by the sponsor of your space**? 
    - When you request access, our [automated system sends the project space sponsor an email](https://hbs-rcs.github.io/hbsgrid-docs/accountmanagement/#project-space-access) to formally approve your access. We recommend contacting them to ensure they have received the email to approve access.
2.  **If you received an email indicating that the project space sponsor has approved your access**, have at least 2 hours passed since you were approved? This is how long the approval may take to sync in our systems.
3.  **If you are trying to access the project space by mounting/mapping the drive**, please check:
    - Are you [connected to the appropriate network](https://hbs-rcs.github.io/hbsgrid-docs/trouble/#network-and-vpn): i.e., the HBS VPN if off-campus, or to the wired HBS ethernet/HBSSECURE wireless if on-campus? 
    - Are you using the [correct path / URL](https://www.hbs.edu/research-computing-services/resources/research-storage/accessing-spaces-and-storage.aspx)?
4.  **If you are trying to access the project space via NoMachine**, have you tried terminating your session and logging back in?
5.  **If you are trying to access the project space via Terminal**, have you tried accessing the project space from a new terminal?

## Storage & Project Spaces - Permission Problems (#troubleshooting-permissions)
1.  Have you hit the **quota for the home or project folder**? 
    - You may have received an email notifying you about having reached storage quotas on your home folder or project space.
    - You can also check your disk usage *for project spaces* by running the command `df -h filepath/to/directory`.
2.  Are the **permissions set appropriately for (shared) read/write access**? 
    - Inconsistent group ownership or read/write access can cause permission denied errors.
    - Verify the permissions by viewing the item's properties in the Files browser in NoMachine/Gnome or by running `ls -al filepath/to/directory` in a terminal. 
    - Use our [File Permissions instructions](https://hbs-rcs.github.io/hbsgrid-docs/worksafe/#file-ownership-and-permissions) to change file/directory permissions. Enlist a colleague's help if needed, especially if the person owns the item in question.
3.  Did you **transfer data via mounted volumes** instead of via SFTP (e.g., Filezilla or Cyberduck)? Doing so often results in unexpected file / folder permissions. Please see our instructions in section 2 to change the permissions if this is what is causing the issue, and we recommend using [other data transfer methods](https://hbs-rcs.github.io/hbsgrid-docs/syncfiles/#transfer-data-fromto-local-storage) going forward.

## Running Interactive & Batch Applications (Jobs) - PENDs or Not Running (#troubleshooting-running-jobs)

1.  **If using the GUI Launchers in NoMachine**, did a warning dialog appear? 
    - Is this explanation – "Job Requirements Not Satisfied" == no room yet on the cluster – indicative of the problem?
2.  Have you **run the HBSGrid Job Monitor script or checked the [status of your job](https://hbs-rcs.github.io/hbsgrid-docs/trouble/#troubleshooting-jobs-and-resources) using the terminal**?
    -  The Job Monitor script can be found under "System Tools" in the Applications menu or simply by searching for "Job Monitor."
    -  Launch NoMachine's terminal via Applications > System Tools > Terminal, select 4GB RAM (and 1 CPU) to get a local terminal for using `bjobs` and its options.
3.  Do you already have **3 interactive sessions or 16 interactive cores running**, or do you already have **150 cores running in total** on the cluster? If you do, you have [reached the limit of the resources one user can request](https://hbs-rcs.github.io/hbsgrid-docs/menulaunch/#system-resources-limits). You can wait for these jobs to finish or you may opt to terminate one of your running jobs to prioritze another:
    - Launch NoMachine's terminal via Applications > System Tools > Terminal, select 4GB RAM (and 1 CPU) to get a local terminal. Review your running jobs using `bjobs` and its options. You can terminate a job using the `bkill JOBID` command or all jobs using `bkill 0`.
5.  Did you ask for **> 50-100 GB RAM and/or > 4-8 cores**? If so:
    - Are you over-asking? Could your request be reduced using information from previous runs or based on past usage or [data file sizes/types](https://hbs-rcs.github.io/hbsgrid-docs/menulaunch/#resource-recommendations)?
    - Are you doing "big data" work? Could this be done more efficiently?
6.  **If using a terminal**, did you submit your job to the [correct queue with the correct parameters](https://hbs-rcs.github.io/hbsgrid-docs/commandline/)? Or did you submit a job that could never be scheduled (e.g. a RAM size that won't fit anywhere)?
