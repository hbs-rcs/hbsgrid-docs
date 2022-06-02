# 👥 Collaborate and Share

The HBS Grid is a multi-user environment shared by many people. Because
of this you must take care to ensure that only authorized project members 
can access your files.

## Projects and group membership

!!! info inline end
    For more information about storage options refer to the 
    [file transfer documentation](syncfiles.md#storageoverview).

For collaborative projects in which more than one person needs access, you must use a *project space*
([request one](https://www.hbs.edu/research-computing-services/help/online-requests.aspx) 
if needed). Each project has an associated group that includes the HBS Grid users
who have access to that project space. Changing group membership must
currently be done by a system administrator; use the
[change request form](https://www.hbs.edu/research-computing-services/help/online-requests.aspx) 
to request a change.

## File ownership and permissions

For project space files you will almost always want group members to
have read and write permission. You can view and set permissions using
the *File Browser* or from the command line using the *Terminal*.

### Set permissions using the file browser

!!! example "Follow these steps to change file permissions using the *Files* application"
    
    1.  Open the *Files* application from the *Applications menu* or *Activites* search
    2.  Locate the file or folder you wish to modify, right-click on it and select *Properties*
    3.  Select the *Permissions* tab in file properties dialog
    4.  If you wish to change permissions for all files in a directory, click the
        *Change Permissions for Enclosed Files* button.
    5.  Select appropriate access levels for *Owner* (you), *Group*, and *Others*.

Click the image below to see these steps visually:

<video width="100%" controls>
  <source src="../media/permissions.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

Refer to the [official GNOME
documentation](https://help.gnome.org/users/gnome-help/stable/nautilus-file-properties-permissions.html.en)
for details.

### Set ownership and permissions using the command line

Ownership and permissions can alternatively be set from the command line using `chown` and
`chmod`. For example 

``` sh
chmod -R g+rwx project1/data
```
says "**R**ecursively for **g**roup members, add **r**ead, **w**rite 
and **e**xecute permissions to `project1/data` and everything in it". 
Refer to `tldr chmod` for more permissions examples and to `man chmod`
for details.

Group ownership can be set from the command line using `chgrp`. For example opening the
*Terminal* application and running
``` sh
chgrp -R my_project_group project1/data
```
says "**R**ecursively make *my_project_group* the group owner of `project1/data` and everything in it". 
Refer to `tldr chgrp` for more examples and to `man` chgrp for details.


## Avoid running services other users can access

Some applications are designed to run as local servers that you connect
to using a web browser or other client. On a single-user machine that
may be relatively safe, but in a multi-user environment you need to take
extra care to ensure that you don't start services that other users on
the HBS Grid can connect to. 

For example, running an unprotected *Jupyter* notebook can give other
users the ability to connect to your service and execute arbitrary
commands as you! Fortunately jupyter notebooks are token protected by
default, and you can password protect them if you wish. The key thing
is that you must be aware of any services you are running and you must
understand how those services are protected against unwanted access by
other users on the HBS Grid. The simple rule is **if you don't know if
or how a service is protected, don't use it**!
