The HBS Grid is a multi-user environment shared by many people. Because
of this you should ensure that only authorized users can access your files 
and that you do not monopolize shared resources.

---

## Share and Collaborate Safely and Securely

Most of us usually work on desktop or laptop computers on which we are
the only user, and so these considerations may be new to you. Learning
a few simple rules and techniques is needed in order to work safely in
our environment.

## Projects and group membership

There are three main locations for storing data on the HBS Grid, as
described below. 

!!! info "Grid storage overview"
    
    Home directory
    :   A Home directory was created at
        `/export/home/<group>/<username>` when you requested your account.
        Your home folder has limited storage capacity and is accessible only by
        you.
     
    Project spaces
    :   Project spaces are directories created for particular projects.
        Project space directories are usually shared and accessible by all
        HBS Grid users working on that project. You can request a new
        project space using the
        [new project space request
        form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhURFhFT09aVVJEQ0tQM1JRMjJOOTg0SFpZQi4u)
        and you can request modifications to an existing project space using the
        [change request
        form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUOEJQSUFSUkpUVUFRUEFHQzZGOVVMODNNRy4u).
        See [Projects and group membership](worksafe.md#projectgroups")
        for details.
     
    Scratch storage
    :   Files may be temporarily stored in scratch storage, available at
        `/export/scratch`. As them name implies, scratch storage is
        appropriate only for temporary short-term storage. Files stored in
        `/export/scratch` and not backed up and will be deleted after 60 days.
        Scratch storage is a shared resource accessible to all users on the HBS Grid;
        make sure you[set permissions on your files accordingly](worksafe.md).


For collaborative projects, use a *project space* 
([request one](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhURFhFT09aVVJEQ0tQM1JRMjJOOTg0SFpZQi4u) 
if needed).

Each project has an associated group that includes the HBS Grid users
who have access to that project space. Changing group membership must
currently be done by a system administrator; use the
[change request form](https://forms.office.com/Pages/ResponsePage.aspx?id=Tlb9CUK_IUOPLbjkgvhjXMoIB6PHisBIlawtyGb7ibhUOEJQSUFSUkpUVUFRUEFHQzZGOVVMODNNRy4u) 
to request a change.

## File ownership and permissions

For project space files you will almost always want group members to
have read and write permission. You can view and set permissions using
the *File Browser* or from the command line using the *Terminal*.

### Set permissions using the file browser

!!! example "Follow these steps to change file permissions using the *Files( application:"
    
    1.  Open the
        Files application from the
        Applications menu from
        Activites search
    2.  Locate the file or folder you wish to modify,
        right-click on it and select
        Properties
    3.  Select the
        Permissions tab in file properties dialog
    4.  If you wish to change permissions for all files in a directory,
        click the
        Change Permissions for Enclosed Files button.
    5.  Select appropriate
        access levels for
        Owner (you),
        Group, and
        Others.

Click the image below to see these steps visually:

<video width="70%" controls>
  <source src="../media/permissions.webm" type="video/webm">
Your browser does not support the video tag.
</video>


Refer to the [Official GNOME
documentation](https://help.gnome.org/users/gnome-help/stable/nautilus-file-properties-permissions.html.en "https://help.gnome.org/users/gnome-help/stable/nautilus-file-properties-permissions.html.en")
for details.

### Set ownership and permissions using the command line

Ownership and permissions can alternatively be set from the command line using `chown` and
`chmod`. For example 

```
chmod -R g+rwx project1/data
```
says "Recursively for **g**roup members, add **r**ead, **w**rite 
and **e**xecute permissions to project1/data and everything in it". 

Refer to
```
tldr chmod
```
for more permissions examples and to
```
man chmod
```
for details.

Group ownership can be set from the command line using `chgrp`. For example opening the
*Terminal* application and running
```
chgrp -R my_project_group project1/data
```
says "Recursively make *my_project_group* the group owner of *project1/data* and everything in it". 
Refer to
```
tldr chgrp
```
for more examples and to
```
man chgrp for details.
```

## Avoid running services like Jupyter notebooks without protection

Some applications are designed to run as local servers that you connect
to using a web browser or other client. On a single-user machine that
may be relatively safe, but in a multi-user environment you need to take
extra care to ensure that you don't start services that other users on
the HBS Grid can connect to. For example, running an unprotected

*Jupyter* notebook can give other users the ability to connect to your
service and execute arbitrary commands as you! Fortunately jupyter
notebooks are token protected by default, and you can password protect
them if you wish. The key thing is that you must be aware of any
services you are running and you must understand how those services are
protected against unwanted access by other users on the HBS Grid. The
simple rule is **if you don't know if or how a service is protected, don't use it**!
