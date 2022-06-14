# 🔄 Copy and Sync Files

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

## Sync data from/to local storage

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

Once you have decided where to store your files on the HBS Grid you can follow the steps below to transfer them.

!!! example "Sync data from your local machine to the HBS Grid"
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


## Sync data from/to cloud storage (OneDrive, Dropbox etc.)

If your data is in cloud storage you may wish to sync it directly from
there. While the HBS Grid does not offer native *Dropbox*, *OneDrive*,
or other cloud storage clients, you can use `rclone` to perform on-demand 
data synchronization with all major cloud storage providers.

!!! example "Sync your data from a cloud provider to the HBS Grid:"

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

!!! important inline end ""
    At this time, **Globus should not be used to transfer** 
    [DSL 4 research data](https://policy.security.harvard.edu/level-4).

Globus is a robust data transfer service that enables sharing files or
data with external persons, eliminates the need for both parties to have
HBS or guest user credentials, and is capable of tolerating transfer
interruptions.

!!! info inline end "Preparing data for Globus transfer"
    If staging files and/or a transfer folder on the HBSGrid cluster and
    its storage, `/export/globus` is the main directory visible by the
    Globus server. Create a folder there for yourself or your group by:
    -   Using the Globus File Manager web interface, or
    -   Using a shell via stand-alone terminal or one inside NoMachine
     
    **Note**: If using the terminal to create the folder, ensure that both
    the [permissions and ownership are set appropriately](worksafe.md)
    
    **Note** A [Globus Collection](https://docs.globus.org/globus-connect-server/v5/reference/collection/#collections)
    is a named location containing data you can access with Globus. An 
    [Endpoint](https://docs.globus.org/globus-connect-server/v5/reference/endpoint/) is a server that hosts
    collections.


!!! example "Log in to Globus and transfer data"

1.  [Login to the Globus web interface](https://app.globus.org), 
    selecting "*Harvard University*" as your organization and authenticating
    via [HarvardKey](https://key.harvard.edu/) if prompted.

2.  In the *Collection* field, search for and select the *Harvard Business School DTN* (data transfer node).  
    If you do not have a folder here, create one by clicking the *New Folder* button.

3.  Click on the "Transfer or Sync to..." button

4.  Use the second *Collection* search box on the right to find the other collection.

5.  Select the folder you wish to transfer and click on the appropriate Start arrow icon.
    (The direction the *Start* button arrow points indicates the direction file transfer).

To share out files in disparate directories, create a separate directory which you will share, and copy these files into it.

Please be aware that you can share out files or folders not only that you own but also that you have explicit permission to access.
**Please be careful about sharing too broadly**.
    
For details refer to the excellent [Globus documentation](https://docs.globus.org/how-to/), and
note that *Globus* has [documented limitations](https://docs.globus.org/faq/transfer-sharing/#are_there_any_limits_on_using_the_file_transfer_service) 
on its transfer service capabilities.


## Important Data Transfer Considerations

The speed and success of data transfer rely on numerous factors, only
some of which are in your control. Following these listed tips will help
increase the likelihood of success:

-   Wired, ethernet connections are the most reliable and fastest way to
    transfer data, especially large amounts.

-   If using WiFi, try to use a network that has a strong signal and is
    interference-free.

-   If in a location with a large numbers of WiFi networks
    (e.g. apartment buildings), please restart both your cable/fiber
    modem & your WiFi network router.

-   If your data contains directories with hundreds or thousands of
    files, we strongly recommend that you compress/archive the
    directories up into a small number of archives, or you may
    experience sluggish or failed transfers. On the HBSGrid cluster, we
    recommend the GUI File Manager in NoMachine/Gnome or using
    command-line programs like tar or zip.

-   We do not recommend creating any single archive file larger than
    about 100 GB in size: If your transfer must be restarted, *Globus*
    and *RClone* will start at the beginning of the file.

-   One can submit batch jobs to compress files if handling large number
    of files, the sizes of the files are large, or compressing/processing will take 10s of minutes. 
    If using *Globus* compression tools can use Globus transfer staging area as the destination,
    eliminating the need to copy the data twice.
