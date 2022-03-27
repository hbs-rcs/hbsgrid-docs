# Accessing Spaces & Storage

You can access storage via GUI and terminal. Below, we detail different
options to access storage.

## Accessing Spaces and Storage via GUI {#accessing-spaces-and-storage-via-gui}

??? note "Mapped Drive (PC)"
    
    Using the Windows Explorer (the File/Folder icon in the toolbar at
    the bottom of your screen) to access the research storage via a
    mapped drive is a convenient way to access your home folder and/or
    project spaces using a familiar interface.

    1.  [Connect to the HBS
        VPN](/research-computing-services/Shared%20Documents/Grid/two-step_vpn_qrg_updated_pdf_1.pdf)
        if you are not on the HBS campus or are not using HBS Secure
        Wireless.

    2.  Right-click on the "Computer" icon on the desktop and select
        "Map Network Drive." If you do not have a "Computer" icon on
        your Desktop, then open a Windows Explorer window via the
        File/Folder icon in your bottom-of-the-screen toolbar,
        right-click on the "Computer" icon, and then select "Map
        Network Drive".

        
        

        ![Mapping Windows network
        drive](https://hbs.sharepoint.com/sites/web/research-computing-services/Shared%20Documents/Grid/map_network_drive_image.png "Mapping Windows network drive"){.fluid}

    3.  In the Map Network Drive dialog, choose the appropriate drive
        letter, and in the Folder field:

        1.  To map a drive to your home directory, specify the path
            `\\research\username`. For example, `\\research\jharvard.`
        2.  For project spaces on the research storage, your path will
            be either be in projects\\ or projects2\\. You should have
            received this information in your project space
            confirmation; and make a note of this in the directions
            below.
        3.  To map a drive to a project space on research storage,
            specify the path `\\research.hbs.edu\projects\projectname.`
            If you have more than one project space, you may want to
            connect to `\\research.hbs.edu\projects`, which will enable
            you to access any project spaces that you have permission to
            use.

    4.  Check the "Reconnect at logon" option only if this computer is
        typically on-campus. And click "Connect using different
        credentials" if this is not an HBS-issued machine. Click
        "Finish".

    5.  If the Windows Security appears and prompts you for your
        username and password, enter your grid / HBS username (the part
        preceding `@hbs.edu`), and your password. **NB!!** If you are
        connecting from a non-HBS-issued machine, please add `HBS\`
        before your username (e.g. `HBS\jharvard`). This specifies the
        proper Windows domain for authenticating your credentials.


??? note "Mounted Volume (Mac)"
    
    You can connect to your research storage project spaces and home
    folders by using the familiar Finder "Connect to Server..."
    option:

    1.  Connect to the HBS VPN if you are not on the HBS campus or are
        not using HBS Secure Wireless.

    2.  From the Finder menu bar, select Go \> Connect to Sever...

    3.  In the Server Address field, enter the domain\\username, server
        address, and file path combination that is appropriate for your
        the space you're trying to access:

        1.  For home folders, enter
            `smb://HBS\jharvard@research.hbs.edu/jharvard.`
        2.  For project spaces on the research storage, your path will
            be either be in projects/ or projects2/. You should have
            received this information in your project space
            confirmation; and make a note of this in the directions
            below.
        3.  For project folders, enter
            `smb://HBS\jharvard@research.hbs.edu/projects/projectname`.
            If you have more than one project space, you may want to
            connect to simply leaving off the projectname which will
            enable you to access any project spaces that you have
            permission to use.


??? note "GUI file transfer client"
    
    While mapping drives is convenient and familiar, the process of
    accessing and transferring files can be slower due to high network
    traffic overhead. A faster and simpler way method is to use a
    program that implements the SFTP protocol, such as SecureFX (PC; and
    an HBS-supplied program),
    [Cyberduck](https://cyberduck.io/){target="_blank"} (Mac), or
    [Filezilla](https://filezilla-project.org/download.php?show_all=1){target="_blank"}
    (cross-platform).

    Please note that you should direct all programs to log in to the
    host `researchgrid.hbs.edu` over port 22, with the same username and
    password as terminal and NoMachineNX logins.

    ### SecureFX

    Please see [this
    document](https://hbs.edu/research-computing-services/Shared%20Documents/Grid/securefx_setup_and_transfering_grid_files.pdf)
    for using the Windows SecureFX GUI file transfer client.

    ### **FileZilla**

    Please see [this
    document](https://hbs/edu/research-computing-services/Shared%20Documents/Grid/filezilla_install.pdf)
    for using the cross-platform FileZilla GUI file transfer client.

    ### **Cyberduck**

    Please see [this
    document](https://hbs.edu/research-computing-services/Shared%20Documents/Grid/cyberduck_setup_and_transfering_grid_files.pdf)
    for using the Mac Cyberduck GUI file transfer client.

## Accessing Spaces and Storage via Terminal {#accessing-spaces-and-storage-via-terminal}

Whether connecting via MacOS Terminal, Windows SecureCRT, Windows Putty,
or any other terminal-like program, you will be connecting to the
HBSGrid via the login node.

The various storage locations can be found at the following Unix paths:

  -----------------------------------| -----------------------------------
  Home folders                       | `$HOME`, or\
                                     | `/export/home/role/username`
                                     | 
  Project folders                    | `/export/projects/projectname`, or\
                                     | `/export/projects2/projectname`
                                     | 
  Scratch storage                    | `/export/scratch`
  -----------------------------------| -----------------------------------

'`role`' will depend on your position/affiliation at HBS; and
'`username`' is your account name. Use common Unix commands such as
`cd path` or `pushd path` to change from one directory to another.

For information about how to transfer data from any given machine to
these locations, see our [Transferring
Files](https://hbs.edu/research-computing-services/data-practices/transferring-data/Pages/default.aspx)
or [Copying
Data](http://hbs.edu/research-computing-services/data-practices/transferring-data/copying-files-from-the-hbsgrid.aspx)
web pages.)
