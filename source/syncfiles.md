You can Copy or move your data to the HBS grid using convenient desktop applications.

---

The HBS Grid is primarily used for data analysis, machine learning, data
wrangling, and data visualization. Usually this means that 
**you need to copy or sync your data to the HBS Grid in order to do your work**.

## Access local files from *NoMachine* login nodes

NoMachine makes it easy to mount your local file system on the HBS Grid
login node. This is useful for reading documentation, scripts, and other
small files without needing to physically copy anything to the HBS Grid.
Note that

this method will only make files accessible from the [login
nodes](commandline.md); for [compute node](commandline.md) access you
will need to copy your files to the HBS grid as described in the next
section below

!!! example
    Follow these simple steps to mount your local file system to the HBS
    Grid:
     
    1.  Log in to the HBS Grid by using
        [NoMachine](https://www.nomachine.com/download-enterprise#NoMachine-Enterprise-Client")
        to connect to host `hbsgrid-nx.hbs.edu`.
    2.  Press *Ctrl-Alt-0* to open the NoMachine session menu.
    3.  Click *Devices*
    4.  Click *Connect a disk*.
    5.  Locate the disk you want to mount under Local disks and click on it.
    6.  click the *Connect* button to mount your local disk on the HBS Grid.

Click the image below for a local drive mounting demonstration:

<video width="70%" controls>
  <source src="../media/datasync.webm" type="video/webm">
Your browser does not support the video tag.
</video>

## Sync data from/to local storage

*NoMachine* file mounting is useful, but it has a major limitation;
**drives mounted via NoMachine are not accessible by applications running on HBS Grid compute nodes**. 
This means that you will usually want to copy or sync your data to the HBS Grid. 
The easiest way to do this for files on your local machine is to mount your 
local drive as described above, and then use *grsync* to sync files from the 
*NoMachine* mount to the HBS Grid.

??? info "Grid storage overview (click here for details)"
    Because you must physically copy data to the HBS Grid in order to access
    it from the
     
    [compute nodes](commandline.md#overview), you
    have to decide where to put it. There are three options:.
     
    Home directory
    :   A
        Home directory was created at
        /export/home/\<group>/\<username> when you requested your account.
        Your home folder has limited storage capacity is accessible only by
        you.
     
    Project spaces
    :   Project spaces are directories created for particular projects.
        Project space directories are usually shared and accessible by all
        HBS Grid users working on that project. You can request a new
        project space using the
        [new project space request
        form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhURFhFT09aVVJEQ0tQM1JRMjJOOTg0SFpZQi4u "https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhURFhFT09aVVJEQ0tQM1JRMjJOOTg0SFpZQi4u")
        and you can request modifications to an existing project space using
        the
        [change request
        form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUOEJQSUFSUkpUVUFRUEFHQzZGOVVMODNNRy4u "https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUOEJQSUFSUkpUVUFRUEFHQzZGOVVMODNNRy4u").
        See
        [Projects and group
        membership](worksafe.md#projectgroups")
        for details.
     
    Scratch storage
    :   Files may be temporarily stored in
        scratch storage, available at
        /export/scratch. As them name implies, scratch storage is
        appropriate only for temporary short-term storage. Files stored in
        /export/scratch and not backed up and will be deleted after 60 days.
        Scratch storage is a
        shared resource accessible to all users on the HBS Grid;
        make sure you
        [set permissions on your files
        accordingly](worksafe.md).

!!! example "Follow these steps to sync data from your local machine to the HBS Grid"
    1.  Log in to the HBS Grid and connect your local drive using
        NoMachine as described above.
     
    2.  Identify the directory on the HBS Grid that you will copy your data
        too, creating it if needed.
     
    3.  From the HBS Grid desktop, open the
        grsync application.
     
    4.  Choose a source directory under the
        NoMachine mount and specify the target directory from step 2.
     
    5.  Click the
        run button in the upper-right corner of the
        grsync application.

Click the image below for a demonstration showing how to sync your data
from a local drive to the HBS Grid:

<video width="70%" controls>
  <source src="../media/datasync.webm" type="video/webm">
Your browser does not support the video tag.
</video>


Note that transferring many small files is much slower than transferring
a small number of large files. You may find it faster to compress
folders with many small files into `.zip` or `.tar` archives, transfer those, 
and decompress/extract them on the other end.

## Sync data from/to cloud storage (OneDrive,Dropbox etc.)

If your data is in cloud storage you may wish to sync it directly from
there. While the HBS Grid does not offer native *Dropbox*, *OneDrive*,
or other cloud storage clients, you can use `rclone` to perform on-demand 
data synchronization with all major cloud storage providers.

!!! example "Follow these steps to sync your data from a cloud provider to the HBS Grid:"

    1.  Log in to the HBS Grid and connect your local drive using
        *NoMachine* as described above.
     
    2.  Identify the directory on the HBS Grid that you will copy your data
        too, creating it if needed.
     
    3.  From the HBS Grid desktop, open the *rclone browser* application.
     
    4.  Click the *Config...* button and follow the prompts (only needed the first
        time).
     
    5.  Click the cloud storage icon in the *Remotes* tab and select the directory you wish to sync.
     
    6.  Specify the target directory from step 2 in the destination field.
     
 
 Click the image below for a quick demonstration showing how to copy files from *Dropbox* to the HBS Grid.

<video width="70%" controls>
  <source src="../media/rclone.webm" type="video/webm">
Your browser does not support the video tag.
</video>

## Help and support

If you run into any problems please let us know by posting at
<https://github.com/hbs-rcs/hbsgrid-docs/discussions> and letting us
know so we can fix them! You may also find the [Support and Troubleshooting](trouble.md)
section helpful.
