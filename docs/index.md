---
hide:
  - navigation
  - toc
---

# The HBS Grid makes massive computing power accessible to the whole HBS research community. Our environments offer a **familiar desktop interface** and **configured software applications** including *Julia*, *Jupyterlab*, *Matlab*, *Python*, *R / Rstudio*, *Stata*, *VSCode*, and hundreds of other popular programs

The HBS Grid consists of many computers connected by a fast
network and shared network storage. These powerful machines have up to 1.4Tb of
memory and up to 32 cores each, and together they provide the backbone
of HBS's research computing capabilities. User-friendly tools and environments
are built on top of this physical and network infrastructure,
making the power of our computing cluster accessible to all HBS researchers.
Using the HBS Grid you can:

- Interactively analyze data too large for local memory.
- Speed up your analysis using hundreds of CPUs across multiple machines.
- Access your persistent remote desktop from anywhere with an internet connection.
- Store, backup, and access large research data.
- Share data and collaborate with HBS affiliates and guests.

## Quick start

HBS faculty, staff, doctoral students and their guests are eligible for HBSGrid accounts.
You can setup your account and connect via either GUI or terminal following the instructions below.

!!! example "Getting Started"

    1.  *If you do not yet have an HBS Grid account* [request one here](https://www.hbs.edu/research-computing-services/help/online-requests.aspx).
    2.  Connect to the HBS network, either directly if you are on-campus or
        [connect via VPN](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf)
        otherwise.

=== "Connect via GUI"

    1.  *If the *NoMachine* application is not yet installed* [download](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client) and install it.
    2. Start the [NoMachine](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client) application.    
    3.  *If this is your first time connecting*, click the
        ![add](imgs/nomachine_add.png#inline) button and enter these connection details:
        - **Name**: "HBS Grid", or anything you like
        - **Host**: `hbsgrid-nx.hbs.edu`
        - **Port**: 4000
        - **Protocol**: NX
    4. Click the ![connect](imgs/nomachine_connect.png#inline) button and enter your *Username* and *Password*.


    The video below demonstrates these steps visually.
    <video width="100%" controls>
    <source src="media/enable.mp4" type="video/mp4">
    Your browser does not support the video tag.
    </video>

    NoMachine maintains a [detailed connection guide](https://www.nomachine.com/getting-started-with-nomachine) 
    that you can refer to if needed. To troubleshoot connection difficulties, see our 
    [troubleshooting checklist](https://hbs-rcs.github.io/hbsgrid-docs/help/#hbsgrid-account-login-issues).

    A selection of our most popular applications are available in the favorites list
    pinned to the task-bar. Additional application launchers can be found in the
    Applications menu or by searching in Activities. You can add applications to
    your favorites list by right-clicking and selecting Add to Favorites.

    This environment was designed to be intuitive and user-friendly, and
    you are encouraged to start exploring the available software and tools. 

=== "Connect via command line"
    
    1. In your favorite terminal program, run
    ```
    ssh USERNAME@hbsgrid.hbs.edu
    ```
    and enter your username and password if prompted.
        - If you are on a PC and choose to use 
        [SecureCRT](https://hbs.service-now.com/support?id=kb_article&table=kb_knowledge&sysparm_article=KB0015137&searchTerm=securecrt), click "Quick connect..." and enter the following:
            - **Protocol**: SSH2
            - **Hostname**: hbsgrid.hbs.edu
            - **Port**: 22
            - **Firewall**: none
            - **Username**: your HBSGrid username

    2. The [software environment](software.md) is not activated by default when connecting via `ssh`. Run
    ```
    ml rcs
    ```
    to [enable the software environment](environments.md#select-terminal-environment).

## Next Steps

To work on the cluster, you will probably want to [learn about HBSGrid storage](storage.md) and
[transfer your data](syncfiles.md). You may also refer to our documentation on [launching jobs from the desktop](menulaunch.md) and [running jobs from the command line](commandline.md).

## Feedback and support

!!! important inline end
    **Guest Users:** For expired passwords and password resets, please contact [RCS](mailto:research@hbs.edu).

Our research computing environments are actively developed and
continuously improving. **Bug reports and feature requests are important
contributions to this project and are always welcome and encouraged!**
If you find that something doesn't work as expected, of if you have a
feature request, we want to know about it so we can fix or
improve it. 

There are several ways to connect:

- For administrative requests including project and account creation or modification 
please use our [request forms](https://www.hbs.edu/research-computing-services/help/online-requests.aspx).

- If you have a question, can't get something working, or if something looks broken you can reach
out to us directly via email at
[research@hbs.edu](mailto:research@hbs.edu).

<!-- If something looks broken or is not working as expected please 
[open an issue report](https://github.com/hbs-rcs/hbsgrid-docs/issues).-->
