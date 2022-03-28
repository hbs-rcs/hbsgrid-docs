
The technology preview software and environments described in this documentation
are not enabled on the [HBS Grid](https://grid.rcs.hbs.org) by default. This
guide show you how to connect to the HBS Grid and enable them.

---

## Prerequisites

!!! note inline end

    Skip this section if you are already using the HBS Grid and know how to connect
    using NoMachine. 
    
To get started you must have an
[HBS Grid account](../support/account-requests.md)
and be connected to the HBS network, either directly if you are on-campus or
[connect via VPN](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf)
otherwise. You must also have the 
[NoMachine Enterprise Client](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client)
remote desktop application installed on your computer.

## Connect and enable software environments

Once you have an account and are connected to the HBS network, follow this
simple procedure to enable our in-development research computing environment:

!!! example

    1.  Log in to the HBS Grid by using
        [NoMachine](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client)
        to connect to host `hbsgrid-nx.hbs.edu`
     
    2.  Open a Terminal in NoMachine:
        *Applications => Favorites => Terminal*
     
    3.  Run
     
        `/usr/local/app/rcs_bin/techpreview-dev/enable.sh & exit`
     
        to open the grid configuration utility (you can copy/paste from the
        documentation to your Terminal).
     
    4.  Select the *Technology Preview* environment in the welcome dialog and click
        OK.

The video below demonstrates these steps visually.
<video width="80%" controls>
  <source src="../media/enable.mp4" type="video/mp4">
Your browser does not support the video tag.
</video> 

A selection of our most popular applications are available in the favorites list
pinned to the task-bar. Additional application launchers can be found in the
Applications menu or by searching in Activities. You can add applications to
your favorites list by right-clicking and selecting Add to Favorites.

## Next steps

This environment was designed to be intuitive and user-friendly, and
you are encouraged to start exploring the available software and tools. If you
are doing real work you will probably want to refer to [Mount Drives and Copy
Data](syncfiles.md) to learn how to get your data onto the HBS Grid. Additional
documentation is available if you need it, including the [Launch
Applications from the Desktop](menulaunch.md) and [Start Jobs from the
Terminal](commandline.md) sections.

If you run into any problems please let us know by posting at
<https://github.com/hbs-rcs/hbsgrid-docs/discussions>  and letting us know so we
can fix them! You may also find the [Support and Troubleshooting](../support/trouble.md)
section helpful.
