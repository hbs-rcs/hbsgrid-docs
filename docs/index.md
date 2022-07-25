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
You can setup your account and connect following the instructions below.

!!! info inline end "Command line access"
    
    If you prefer shell access from a terminal/command prompt you can log in using `ssh` like this:
    ```sh
    ssh USERNAME@hbsgrid.hbs.edu
    ```
    (replace "USERNAME" with your HBS Grid username). `ssh` is included by default on both
    [Mac OS X](https://support.apple.com/guide/mac-help/allow-a-remote-computer-to-access-your-mac-mchlp1066/mac#mchlp26a47b6), 
    and 
    [Windows](https://docs.microsoft.com/en-us/windows/terminal/tutorials/ssh)).
    
    Command line access via `ssh` can be useful for debugging if
    something prevents you from loggin in via NoMachine.

!!! example "Connect to the HBS Grid"

    1.  If you do not yet have an HBS Grid account [request one here](https://www.hbs.edu/research-computing-services/help/online-requests.aspx).
    2.  Connect to the HBS network, either directly if you are on-campus or
        [connect via VPN](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf)
        otherwise.
    3.  *If the *NoMachine* application is not yet installed* [download](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client) and install it.
    4. Start the [NoMachine](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client) application.
        
    5.  *If this is your first time connecting* click the
        ![add](imgs/nomachine_add.png#inline) button and enter these connection details:
        - *Name*: "HBS Grid", or anything you like
        - *Host*: `hbsgrid-nx.hbs.edu`
        - Leave defaults for all other settings.
    6. Click the ![connect](imgs/nomachine_connect.png#inline) button and enter your *Username* and *Password* (see *step* 1 above).
    7.  Open a Terminal in NoMachine:
        *Applications => Favorites => Terminal*
     
    8.  Run
     
        `/usr/local/app/rcs_bin/techpreview-dev/enable.sh & exit`
     
        to open the grid configuration utility (you can copy/paste from the
        documentation to your Terminal).
     
    9.  Select the *Technology Preview* environment in the welcome dialog and click
        OK.


The video below demonstrates these steps visually.
<video width="100%" controls>
  <source src="media/enable.mp4" type="video/mp4">
Your browser does not support the video tag.
</video> 

NoMachine maintains a [detailed connection guide](https://www.nomachine.com/getting-started-with-nomachine) 
that you can refer to if needed. Connection difficulties from off-campus may be caused by VPN issues, see the
[VPN guide](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf)
for details.

## Next steps

A selection of our most popular applications are available in the favorites list
pinned to the task-bar. Additional application launchers can be found in the
Applications menu or by searching in Activities. You can add applications to
your favorites list by right-clicking and selecting Add to Favorites.

This environment was designed to be intuitive and user-friendly, and
you are encouraged to start exploring the available software and tools. If you
are doing real work you will probably want to refer to [Mount Drives and Copy
Data](syncfiles.md) to learn how to get your data onto the HBS Grid. Additional
documentation is available if you need it, including the [Launch
Applications from the Desktop](menulaunch.md) and [Start Jobs from the
Terminal](commandline.md) sections.

## Feedback and support

Our research computing environments are actively developed and
continuously improving. **Bug reports and feature requests are important
contributions to this project and are always welcome and encouraged!**
If you find that something doesn't work as expected, of if you have a
feature request, we want to know about it so we can fix or
improve it. 

There are three ways to connect:

- For administrative requests including project and account creation or modification 
please use our [request forms](https://www.hbs.edu/research-computing-services/help/online-requests.aspx).

- If you have a question or can't get something working you can post
to our [discussion
forum](https://github.com/hbs-rcs/hbsgrid-docs/discussions) or reach
out to us directly via email at
[research@hbs.edu](mailto:research@hbs.edu).

- If something looks broken or is not working as expected please 
[open an issue report](https://github.com/hbs-rcs/hbsgrid-docs/issues).
