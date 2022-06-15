# 🔄 Copy and Transfer Files

The HBS Grid is primarily used for data analysis, machine learning, data
wrangling, and data visualization. Usually this means that 
**you need to copy or sync your data to the HBS Grid in order to do your work**.


## Access local files from *NoMachine* login nodes

!!! info inline end ""
     
    This makes files accessible from the [login nodes](commandline.md#compute-cluster-basics) 
    but not from the [compute nodes](commandline.md#compute-cluster-basics). For that you need to 
    [copy your files to the HBS Grid](syncfiles.md#sync-data-fromto-local-storage).

NoMachine makes it easy to mount your local file system on the HBS Grid
login node. This is useful for reading documentation, scripts, and other
small files without needing to physically copy anything to the HBS Grid.
</br>
&nbsp;

!!! example "Mount your local file system to the HBS Grid:"
     
    1.  Log in to the HBS Grid by using
        [NoMachine](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client")
        to connect to host `hbsgrid-nx.hbs.edu`.
    2.  Press *Ctrl-Alt-0* to open the NoMachine session menu.
    3.  Click *Devices*
    4.  Click *Connect a disk*.
    5.  Locate the disk you want to mount under Local disks and click on it.
    6.  click the *Connect* button to mount your local disk on the HBS Grid.

Click the image below for a local drive mounting demonstration:

<video width="100%" controls>
  <source src="../media/datasync.mp4" type="video/webm">
Your browser does not support the video tag.
</video>

## Transfer data from/to local storage

*NoMachine* file mounting is useful, but it has a major limitation;
**drives mounted via NoMachine are not accessible by applications running on HBS Grid compute nodes**. 
This means that you will usually want to copy or sync your data to the HBS Grid. 
The easiest way to do this for files on your local machine is to mount your 
local drive 
[as described above](syncfiles.md#access-local-files-from-nomachine-login-nodes), 
and then use *grsync* to sync files from the 
*NoMachine* mount to the HBS Grid.

Because you must physically copy data to the HBS Grid in order to access
it from the [compute nodes](commandline.md#overview), you
have to decide where to put it. There are three options: *home directory*, 
*project space*, or *scratch storage*.

<a name="storageoverview"></a>
!!! info "HBS Grid storage overview"
    
    A **home directory** was created at `/export/home/<group>/<username>` 
    when you requested your account. Your home folder has limited storage 
    capacity and is accessible only by you.
     
    **Project spaces** are directories that are shared and accessible by all
    HBS Grid users working on that project. You can request a new
    project space using the [new project space request form](https://www.hbs.edu/research-computing-services/help/online-requests.aspx)
    and you can request modifications to an existing project space using the
    [change request form](https://www.hbs.edu/research-computing-services/help/online-requests.aspx).
     
    **Scratch storage** is available at `/export/scratch`. It is appropriate only for temporary, 
    short-term storage. Files are not backed up and will be deleted after 60 days.
    Scratch storage is a shared resource accessible to all users on the HBS Grid;
    make sure you [set permissions on your files accordingly](worksafe.md).

!!! info inline end "Sync data from the command line"
    You can alternatively use the `rsync` command-line program to transfer data from your 
    [connected local drive](syncfiles.md#access-local-files-from-nomachine-login-nodes). Documentation
    is [available online](https://download.samba.org/pub/rsync/rsync.1) or type `man rsync` at the
    HBS Grid command line.

Once you have decided where to store your files on the HBS Grid you can follow the steps below to transfer them.

!!! example "Sync data from your local machine to the HBS Grid desktop"
    1.  Log in to the HBS Grid and connect your local drive using
        NoMachine [as described above](syncfiles.md#access-local-files-from-nomachine-login-nodes).
     
    2.  Identify the directory on the HBS Grid that you will copy your data
        too, creating it if needed.
     
    3.  From the HBS Grid desktop, open the
        grsync application.
     
    4.  Choose a source directory under the
        NoMachine mount and specify the target directory from step 2.
     
    5.  Click the
        run button in the upper-right corner of the
        grsync application.

Note that transferring many small files is much slower than transferring
a small number of large files. You may find it faster to compress
folders with many small files into `.zip` or `.tar` archives, transfer those, 
and decompress/extract them on the other end.

Click the image below for a demonstration showing how to sync your data
from a local drive to the HBS Grid:

<video width="100%" controls>
  <source src="../media/datasync.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>


## Transfer data from/to cloud storage 

!!! info inline end "Sync from the command-line"
    `rclone` is also available as a command-line application that you can
    use interactively in a terminal or in scripts. Refer to the
    [rclone documentation](https://rclone.org/docs/) for details.

If your data is in cloud storage (OneDrive, Dropbox etc.) you may wish to sync it directly from
there. While the HBS Grid does not offer native *Dropbox*, *OneDrive*,
or other cloud storage clients, you can use `rclone` to perform on-demand 
data synchronization with all major cloud storage providers.

!!! example "Sync your data from a cloud provider to the HBS Grid desktop"

    1.  Log in to the HBS Grid via *NoMachine*.
     
    2.  Identify the directory on the HBS Grid that you will copy your data
        to, creating it if needed.
     
    3.  From the HBS Grid desktop, open the *rclone browser* application.
     
    4.  Click the *Config...* button and follow the prompts (**only needed the first time**).
     
    5.  Click the cloud storage icon in the *Remotes* tab and select the directory you wish to sync.
     
    6.  Specify the target directory from step 2 in the destination field.
     
 
 Click the image below for a quick demonstration showing how to copy files from *Dropbox* to the HBS Grid.

<video width="100%" controls>
  <source src="../media/rclone.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

Note that the demonstration video goes through the configuration step, which only needs to be done once.
After that you can skip step 4 above, which greatly simplifies the process.

## Transfer data using Globus

*Globus* is a robust data transfer service that enables sharing files or
data with external persons, eliminates the need for both parties to have
HBS or guest user credentials, and is capable of tolerating transfer
interruptions. **Note**: At this time, *Globus* should not be used to transfer
[DSL 4 research data](https://policy.security.harvard.edu/level-4).

!!! info inline end "Globus key concepts"
    A [Globus Collection](https://docs.globus.org/globus-connect-server/v5/reference/collection/#collections)
    is a named location containing data you can access with Globus.

HBS maintains a *Globus Collection* named *Harvard Business School DTN*.
Storage for this collection is mounted on the HBS Grid at `/export/globus`.
You can create folders there and share them with other *Globus* users, or 
transfer data to them from other *Globus* collections you have access to.
As with [scratch storage](storage.md#scratch-storage), `/export/globus` is
accessible by all grid users, so you must 
**ensure that both the [ownership and permissions are set appropriately](worksafe.md)**.

Please be aware that you can share out files or folders not only
that you own but also that you have explicit permission to access.
Please be careful not to share too broadly.

!!! example "Log in to *Globus* and transfer data"
     
    1.  [Login to the Globus web interface](https://app.globus.org), 
        selecting "*Harvard University*" as your organization and authenticating
        via [HarvardKey](https://key.harvard.edu/) if prompted.
     
    2.  In the *Collection* field, search for and select the *Harvard Business School DTN* (data transfer node).  
        *If you have not already created a folder here*, create one now by clicking the *New Folder* button.
     
    3.  Click on the "Transfer or Sync to..." button.
     
    4.  Use the second *Collection* search box on the right to find the other collection.
     
    5.  Select the folder you wish to transfer and click on the appropriate Start arrow icon.
        (The direction the *Start* button arrow points indicates the direction files will transfer.)

*Globus* can also be used to transfer data from you local machine using *Globus Connect Personal*.
Installers are available for [Mac OS X](https://docs.globus.org/how-to/globus-connect-personal-mac/).
[Windows](https://docs.globus.org/how-to/globus-connect-personal-windows) and
[Linux](https://docs.globus.org/how-to/globus-connect-personal-linux).

For details on using *Globus* refer to the excellent [Globus documentation](https://docs.globus.org/how-to/).
A [FAQ section](https://docs.globus.org/faq/) is also available.


## Important data transfer considerations

The speed and success of data transfer rely on numerous factors, only
some of which are in your control. Following these listed tips will help
increase the likelihood of success:

-   Wired, ethernet connections tend to be more reliable and faster than 
    wireless internet connections.If using WiFi, try to use a network that 
    has a strong signal and is interference-free.

-   Transferring a few large files is often much faster than transferring many small files.
    When transferring many small files we recommend that you compress/archive the
    directories up into a small number of archives. On the HBSGrid cluster, we
    recommend the GUI File Manager in NoMachine/Gnome or using
    command-line programs like `tar` or `zip`.

-   We do not recommend creating any single archive file larger than
    about 100 GB in size: Many transfer programs don't support resuming partial transfers, 
    so If your transfer is interrupted it will start again and transfer the whole file.

-   You can use [LSF batch jobs](commandline.md) to quickly compress large files and/or a large number of files.
    If using *Globus*, you can create archives directly in your *Globus* collection folder, 
    eliminating the need to copy the data twice.
