# Logging In

---

Follow our instructions to connect to the HBSGrid via a GUI or Terminal.

??? note "Connection Requirements"

    ### **On-HBS-Campus**

    To connect to the HBSGrid from on-campus, you must be connected to
    the HBS Network via either a wired ethernet connection or the [HBS
    Secure Wireless
    Network](https://inside.hbs.edu/Departments/it/howto/networking/Pages/wireless.aspx).

    ### **Off-HBS-Campus**

    From off-HBS-campus, the HBSGrid can only be accessed through a
    virtual private network (VPN) connection using the Pulse
    Secure software. A VPN ensures that all communication between your
    computer and grid resources are encrypted. Harvard University also
    mandates that all persons accessing sensitive systems use two-factor
    authentication as a part of their login process.

    **Pulse Secure VPN Software Installation and Set-Up**

    Persons with HBS-issued desktops and laptops may already have the
    necessary software. If you need to re-download, re-install, or
    download a new version of the software (e.g., VPN with two-factor),
    it can be
    found [here](https://inside.hbs.edu/Departments/it/howto/installed-software/Pages/pulsesecure.aspx).

    Collaborators and guest users can download the VPN Pulse Secure
    software (with two-factor)
    here for [PC](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/ps-pulse-win-9.1r9.0-b4983-64bitinstaller.msi) or [Mac](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/ps-pulse-mac-9.1r9.0-b4983-installer.dmg).

    Please ensure that the VPN software Pulse Secure has been installed
    as described in the previous step, and that the Duo Mobile app (or
    some other two-factor authentication method), also described above,
    has been installed and registered/configured.

    For connecting to the HBS campus network, please follow the
    appropriate section on the [VPN/DUO Quick Reference
    Guide](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf).
    For example, to connect to the VPN with Duo Mobile \'push\' using
    the smartphone mobile application, please see Section 3, steps 1 and
    5 through 8.

??? note "GUI Login to the HBSGrid"

    If you wish to use applications on the HBSGrid via a graphical user
    interface (GUI), we support remote desktop sessions using the
    NoMachine NX client software. Like Windows RDP or VNC running Stata
    on the cluster looks like running Stata on your desktop, for
    example. An additional application to run X11 (a long-established
    Unix graphics windows system) such as Xming or XQuartz is not
    needed. With NoMachine, Unix/Linux knowledge is not required.

    **Note**: NoMachine also has a browser-based interface which you can
    connect to at: <https://hbsgrid-nx.hbs.edu:4443/nxwebplayer>.
    However, we\'ve found connection speeds of the installed softwareto
    be significantly faster.

    [Local Client Installation](#)

    :   1.  Please download for
            [Mac](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/nomachine_6.12.3_8.zip)
            or
            [PC](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/nomachine_6.12.3_7.exe)
            and run the NoMachine version 6 installer application on
            your desktop (use all default settings during the
            installation).
        2.  After the desktop installation is complete, please restart
            your machine before proceeding.

    [Local Client Connection](#)

    :   On the Welcome page, click on "Create a new connection" and
        click \"Continue.\"

        ![](/research-computing-services/PublishingImages/Connection%201.png){style="max-width:500px;"}

        On the \"New connect\" screen use the default Protocol setting
        \"NX\" and click \"Continue.\" Next, enter host information for
        the compute grid, **hbsgrid-nx.hbs.edu**, on port **4000**.
        Ensure the checkbox for UDP communication is checked and click
        \"Continue.\"

        ![](/research-computing-services/PublishingImages/Connection%202.png){style="max-width:500px;"}

        On the next screen choose \"Password\" selected and click
        \"Continue.\" Next, please check \"Don\'t use a proxy\" check
        and click \"Continue.\" Select the checkbox for \"Create a link
        on the desktop,\" and click \"Continue.\"

        Next click \"Settings\" in the top right corner, click
        \"Privacy\", and check the option \"Don\'t show other computers
        on the network,\" and click \"Done.\"

        ![](/research-computing-services/PublishingImages/Connection%203.png){style="max-width:500px;"}

        Highlight the **hbsgrid-nx.hbs.edu**connection and click
        \"Connect.\"

        ![](/research-computing-services/PublishingImages/Connection%204.png){style="max-width:500px;"}

        In the window \"Verify host authenticity\", click \"Yes.\" Next
        enter your username and password. For security purposes, do not
        select \"Save this password.\"

        ![](/research-computing-services/PublishingImages/Connection%205.png){style="max-width:500px;"}

        After a few moments, a window will appear for windowing options.
        Click \"New virtual desktop or custom session,\" click \"Create
        a new GNOME virtual desktop" and click \"Continue.\"

        ![](/research-computing-services/PublishingImages/Connection%206.png){style="max-width:500px;"}

        On the next few pages leave the default setting and check
        \"Don\'t show this message again.\"

        The virtual desktop then appears. Congrats. You are now on one
        of two login nodes that are the gateway to the Grid!

??? note "Configure Your Desktop"

    :   If you find that your desktop is the wrong size (e.g., is larger
        than the window containing it) you can adjust it via the
        NoMachine settings page. When you hover over the upper right
        corner of the screen a page peel-back icon appears. Click on the
        image of the peel-back.

        ![](/research-computing-services/PublishingImages/Configure%201.png){style="max-width:500px;"}

        Next click on \"Display\" and \"Resize remote screen\" and click
        \"Done\" twice. For more details about configuring your display
        you may refer to the [NoMachine
        documentation](https://www.nomachine.com/changing-how-you-view-the-remote-host){url="https://www.nomachine.com/changing-how-you-view-the-remote-host"}.

        The Grid runs the [Gnome
        desktop](https://www.gnome.org/){url="https://www.gnome.org/"}
        and includes \"Tweak Tool\", a configuration utility for
        customizing your desktop. For example, to add icons back to your
        NoMachine desktop, launch Tweak Tool

        ![](/research-computing-services/PublishingImages/Configure%202.png){style="max-width:500px;"}

        and click on the Desktop left tab (1) and turn on the Icons on
        Desktop option (2):

        ![](/research-computing-services/PublishingImages/Configure%203.png){style="max-width:500px;"}

        More information about configuring NoMachine and the Gnome
        desktop are available in our [NoMachine Interface Changes
        guide](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/nomachine_interface_changes.pdf).

??? note "Terminal Login to the HBSGrid"

    #### PC

    :   If using an HBS-owned machine, the SSH client SecureCRT should
        already be installed. For all other machines, please download
        SecureCRT
        **[here](https://inside.hbs.edu/Departments/it/howto/installed-software/Pages/SecureCRT.aspx){url="https://inside.hbs.edu/Departments/it/howto/installed-software/Pages/SecureCRT.aspx"}**.

        Open SecureCRT and select from the menu File \> Quick Connect.

        ![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/scrt1.png){style="max-width:500px;"}

        3\. Enter the hostname information, **hbsgrid.hbs.edu**, your
        username (e.g., jharvard), and click "Connect."

        ![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/terminal_login_shot2.png){style="max-width:500px;"}

        4\. Several dialogue boxes may come appear; please press \"Yes\"
        or "Allow" for each. When prompted, please enter your HBS
        password.

        ![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/terminal_login_shot3.png){style="max-width:500px;"}

        If you've logged in successfully, you\'ll see a last login,
        greeting, and quota information, as well as the Unix (bash)
        prompt `researchgrid$`{.inline style="overflow-x: hidden;"}.

        ![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/scrt4.png){style="max-width:500px;"}

        For future logins, after opening SecureCRT, the Sessions Manager
        window pane appears on the left. Double click on
        `hbsgrid.hbs.edu`{.inline style="overflow-x: hidden;"} to
        connect, and enter your password when prompted.

        Once logged in successfully, you'll be placed in your home
        directory at:

        `/export/home/<group>/<username>`{style="overflow-x: hidden;"}
        (e.g.
        `/export/home/faculty/jharvard`{style="overflow-x: hidden;"}).

        Project spaces are located at:

        `/export/projects/<projectname>`{style="overflow-x: hidden;"}

        See our [Research
        Storage](../research-storage/overview.md)
        instructions for more information on home folders and project
        spaces.

        Continue on to our [Running
        Jobs](running-jobs/overview.md)
        section for instructions on getting work done.

        Guest Users can download Putty to gain terminal access to the
        HBS grid. Download Putty from [this
        URL](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).

    #### Mac

    :   1.  Open **Terminal**
        2.  Once the Terminal is open type:
            `ssh  username@hbsgrid.hbs.edu`
        3.  Your username is the local part of your HBS email address
            (e.g., jharvard) and your password is the same as your HBS
            credentials password

        Once logged in successfully, you'll be place in your home
        directory at `/export/home/<group>/<username>` (e.g.,
        `/export/home/faculty/jharvard`).

        Project spaces are located at
        `/export/projects/<projectname>`.

        See our [Research
        Storage](../research-storage/overview.md)
        instructions for more information on home folders and project
        spaces.

        Continue on to our [Running
        Jobs](running-jobs/overview.md)
        section for instructions on getting work done.

    #### Guest Users

    :   Guest Users can [download
        Putty](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)
        to access the HBSGrid via terminal sessions.

        Once logged in successfully, you'll be place in your home
        directory at `/export/home/<group>/<username>`{.inline
        style="overflow-x: hidden;"} (e.g.,
        `/export/home/faculty/rcs_jharvard`{.inline
        style="overflow-x: hidden;"}).

        Project spaces are located at
        `/export/projects/<projectname>`{.inline
        style="overflow-x: hidden;"}

        See our [Research
        Storage](../research-storage/overview.md)
        instructions for more information on home folders and project
        spaces.

        Continue on to our learn about transferring and prepaing your
        data files and starting your analyses.
