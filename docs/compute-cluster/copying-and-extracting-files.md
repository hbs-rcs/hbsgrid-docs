
# Copying & Extracting Files

Copying files between computers is made easy via GUI and terminal.
However, before you start the copying process please keep in mind our
policies on [responsibilities and acceptable use of
storage](https://www.hbs.edu/research-computing-services/about-us/terms-of-service.aspx#responsibilities).

## Copying Files using a Graphical User Interface

A convenient way to copy files is by directly connecting to your
home folder or project space. Common ways to achieve this include
using NoMachine, mapping a network drive (PC) or mounting a shared
volume (Mac), and using a file transfer program such as SecureFX,
Filezilla, or Cyberduck.

??? note "GUI File Copy Details"
     
    NoMachine has a cool feature: one can "attach" one's local disk
    as if it were a network volume on the HBSGrid. Although probably too
    slow for computing at HBS on files at home, this feature is an easy
    way to make a disk, directory, or set of files available for
    transfer or synchronization. Please see NoMachine's [Accessing
    files on local or remote disk
    drives](https://www.nomachine.com/accessing-files-on-local-or-remote-disk-drives),
    and be sure to mark your disk as Private. (See this page for
    NoMachine client [Settings Panel
    options](https://www.nomachine.com/DT07M00087)) Note: if working
    with L3 or L4 data, ensure that any data movement operations are
    compliant with your data safety level.

    #### Mapped Drive (PC)
     
    Map a network drive to your home folder or project spaces in Windows
    Explorer to easily access and copy over files.
     
    ### Mapped Volume (Mac)
     
    Connect to your home folder or project spaces in Mac OS with Finder
    "Connect to Server\..." to conveniently access and copy over
    files.

    #### SecureFX
     
    Windows SecureFX GUI file transfer client implements the SFTP
    protocol for fast and simple file transfers. Please see [this document for using the Windows SecureFX GUI file transfer client](/research-computing-services/Shared%20Documents/Grid/securefx_setup_and_transfering_grid_files.pdf).

    #### FileZilla
     
    FileZilla is a cross-platform GUI file transfer client. Please see
    [this document for using the cross-platform FileZilla GUI file transfer client](/research-computing-services/Shared%20Documents/Grid/filezilla_install.pdf){fid="676196"}.

    #### Cyberduck
     
    Cyberduck is a Mac GUI file transfer client. Please see 
    [this document for using the Mac Cyberduck GUI file transfer client](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/cyberduck_setup_and_transfering_grid_files.pdf).
     

## Copying Files Using Terminal

SSH terminal protocols such as SFTP, SCP, and rsync allow you to
copy files with simple unix commands.

!!! note
     
    We use "\~" in the examples. The tilde "\~" is a Unix
    short-hand that means "my home directory". So if user
    johnharvard uses \~/ this is the same as typing out the full
    path to his home directory (easier to remember than
    /export/faculty/johnharvard/ ). You can, of course, specify
    other paths (ex. -
    /export/projects/johnharvard/output/files.zip)
     
    Also note that wildcard characters can be used to indicate
    spaces or runs of characters. Ensure that you include the option
    `-T` (e.g. `scp -T` \...) to ensure correct handling of
    wildcards on the source and destination computers 
    (see [thisStack Overflow post](https://stackoverflow.com/questions/54598689/scp-fails-with-protocol-error-filename-does-not-match-request#comment102458279_54599326){target="_blank"}
    for more info).

### Secure Copy (SCP)

SCP can be a simple, quick way to transfer files between two computers from the terminal command line.

??? note "SCP details"
     
    SCP usage is simple, but the order that file
    locations are specified is crucial. SCP always expects the
    'from' location first, then the 'to' destination. Depending
    on which is the remote system, you will prefix your username and
    server to one of the locations.
     
    `scp [username@server:][location of file] [destination of file]`
     
    or 
     
    `scp [location of file] [username@server:][destination of file]`
     
    Below are some examples of the two most common uses of SCP to
    copy to and from various sources.
     
     
    #### Copying files from the HBSGrid research storage to another computer
     
    From a terminal/shell on another computer (like your local
    machine), you'll issue your SCP command and enter your HBSGrid
    password.
     
    `scp johnharvard@hbsgrid.hbs.edu:~/files.zip /home/johnharvard/Password:Enter PASSCODE:files.zip 100% 9664KB 508.6KB/s 00:19`
     
    This copies the file files.zip from from your home directory on
    the HBSGrid research storage to the /home/johnharvard/ directory
    on the computer you issued the command from (your local
    computer).
     
    #### Copying files from another computer to the HBSGrid
     
    From a terminal/shell on your non-Grid computer (like your local
    machine), you'll issue your SCP command and enter your HBSGrid
    password.
     
    `scp /home/johnharvard/myfile.zip johnharvard@hbsgrid.hbs.edu:~/Password:Enter PASSCODE:files.zip 100% 9664KB 508.6KB/s 00:19`
     
    This copies the file files.zip from from the /home/johnharvard/
    directory on the computer you issued the command on (like your
    local machine) to your home on the research storage.
     
    While it's probably best to compress all the files you intend
    to transfer into one file, this is not always an option. To copy
    the contents of an entire directory, you can use the -r (for
    recursive) flag.
     
    `scp johnharvard@hbsgrid.hbs.edu:~/mydata/ /home/johnharvard/mydata/Password:Enter PASSCODE:files.zip 100% 9664KB 508.6KB/s 00:19`
     
    This copies all the files from \~/mydata/ on the HBSGrid
    research storage to the /home/johnharvard/mydata/ directory on
    the computer you issued the command from (like your local
    machine).
     
    *We thank [FASRC for the
    origin](https://docs.rc.fas.harvard.edu/kb/copying-data-to-and-from-cluster-using-scp/)
    of this material, and Albert Shin for the -T suggestion.*

### Rsync

Rsync is a fast, versatile, remote (and local) file-copying
tool. It is famous for its delta-transfer algorithm, which
reduces the amount of data sent over the network by sending only
the differences between the source files and the existing files
in the destination. 

??? note "Rsync details"
     
    Rsync is available on most Unix-like systems,
    including the HBSGrid and Mac OS X. Windows implementations of
    rsync are available.
     
    The basic syntax is: `rsync SOURCE DESTINATION` where `SOURCE`
    and `DESTINATION` are filesystem paths.
     
    They can be local, either absolute or relative to the current
    working directory, or they can be remote but prefixing something
    like `USERNAME@HOSTNAME:` to the front of them.
     
    **NOTE:** Unlike `cp` and most shell commands, a trailing `/`
    character on a directory name is significant --- it means the
    *contents* of the directory as opposed to the directory itself.
     
    #### Examples
     
    -   **As a replacement for `cp` --- copying a single large file,
        but with a progress meter:**\
        `rsync --progress bigfile bigfile-copy `
     
    -   **Make a recursive copy of local directory `foo` as
        `foo-copy`:**\
        `rsync -av foo/ foo-copy/ ` The trailing slash on
        `foo-copy/` is optional, but if it's not on `foo/`, the
        file `foo/myfile` will appear as `foo-copy/foo/myfile`
        instead of `foo-copy/myfile`.
     
    -   **Upload the directory foo on the local machine to your home
        directory on the HBSGrid research storage:**\
        `rsync -avz foo/ MYUSERNAME@hbsgrid.hbs.edu:~/foo/ ` This
        works for individual files, too, just don't put the
        trailing slashes on them.
     
    -   **Download the directory foo in your home directory on the
        HBSGrid research storage to the local machine:**\
        `rsync -avz MYUSERNAME@hbsgrid.hbs.edu:~/foo . `
     
    -   **Update a previously made copy of foo on the HBSGrid
        research storage after you've made changes to the local
        copy:**\
        `rsync -avz --delete foo/ MYUSERNAME@hbsgrid.hbs.edu:~/foo/ `
     
        The `--delete` option has no effect when making a new copy,
        and therefore can be used the previous example, too (making
        the commands identical), but since it recursively deletes
        files, it's best to use it sparingly.
     
    -   **Update a previously made copy of foo on the HBSGrid
        research storage after you or someone else has already
        updated it from a different source:**\
        `rsync -avz --update foo/ MYUSERNAME@hbsgrid.edu:~/foo/ `
     
        The `--update` options has no effect when making a new copy,
        and can freely be specified in that case, also.
     
    #### Compression
     
    If the `SOURCE` and `DESTINATION` are on different machines with
    fast CPUs, especially if they're on different networks (e.g.
    your home computer and the HBSGrid), it's recommended to add
    the `-z` option to compress the data that's transferred.
     
    This will cause more CPU to be used on both ends, but it is
    usually faster.
     
    #### File Attributes, Permissions, Ownership, etc.
     
    By default, `rsync` does not copy recursively, preserve
    timestamps, preserve non-default permissions, etc.
     
    There are individual options for all of these things, but the
    option `-a`, which is short for archive mode, sums up many of
    these (`-rlptgoD`) and is best for producing the most exact
    copy.\
    (`-A` (preserve ACLs), `-X` (preserve extended attributes), and
    `-H` (preserve hardlinks) may also be desired on rare
    occasions.)
     
    #### Updating a Copy
     
    Rsync's delta-transfer algorithm allows you to efficiently
    update copies you've previously made by only sending the
    differences needed to update the `DESTINATION` instead of
    re-copying it from scratch.\
    However, there are some addition options you will probably want
    to use depending on the type of copy you're trying to maintain.
     
    If you want to maintain a *mirror*, i.e. the `DESTINATION` is to
    be an exact copy of the `SOURCE`, then you will want to add the
    `--delete` option.
     
    This deletes stuff in the `DESTINATION` that is no longer in the
    `SOURCE`
     
    *Be careful with this option!*
     
    If you incorrectly specify the `DESTINATION` you may
    accidentally delete many files.
     
    See also the `--delete-excluded` option if you're adding
    `--exclude` options that were not used when making the original
    copy.
     
    If you're updating a master copy, i.e. the `DESTINATION` may
    have files that are newer than the versions in `SOURCE`, you
    will want to add the `--update` option.\
    This will leave those files alone, not revert them to the older
    copy in `SOURCE`.
     
    ### **Progress, Verbosity, Statistics**
     
    -   `-v`\
        Verbose mode --- list each file transferred.\
        Adding more `v`s makes it more verbose.
    -   `--progress`\
        Show a progress meter for each file transfer (not a progress
        meter for the whole operation).\
        If you have many small files, this can significantly slow
        down the transfer.
    -   `--stats`\
        Print a short paragraph of statistics at the end of the
        session, like average transfer rate, total numbers of files
        transferred, etc.
     
    ### **Other Useful Options**
     
    -   `--dry-run`\
        Perform a dry-run of the session instead of actually
        modifying the DESTINATION.\
        Most useful when adding multiple `-v` options, especially
        for verifying `--delete` is doing what you want.
    -   `--exclude PATTERN`\
        Skip some parts of the `SOURCE`.
     
    *We thank [FASRC for the
    origin](https://rc.fas.harvard.edu/resources/documentation/linux/rsync/){target="_blank"}
    of this material.*

## Extracting Archived/Compressed Files on the HBSGrid

On the Grid, there are two sets of system-wide tools for extracting
files from an archive / compressed file. They are `unzip` and `gunzip`.


### Unzip

May be used to extract from common archive formats such as ZIP and
RAR. General usage: To extract all contents to the current
directory.

`unzip FILE`

To extract all contents within `subfolder` of the archive

`unzip FILE subfolder/*`

To extract all contents within `subfolder` to a specific folder

`unzip FILE subfolder/* -d DESTINATION`

Documentation may be found here: <https://linux.die.net/man/1/unzip>

If neither tool works on your archive / compressed file, then you
will need to [install software for your use](/research-computing-services/resources/compute-cluster/selectingsoftware.aspx#installing).

### Gunzip

This is meant to be used on files ending with .`gz `or `.z`

General usage:

To extract a file and not save the original compressed file

`gunzip FILE`

To extract a file and keep both the compressed and decompressed file

`gunzip –k FILE`

To extract all files within a folder and subfolders

`gunzip –r FOLDER`

Documentation may be found here: https://linux.die.net/man/1/gunzip

If neither tool works on your archive / compressed file, then you
will need to [install software for your use](/research-computing-services/resources/compute-cluster/selectingsoftware.aspx#installing).
