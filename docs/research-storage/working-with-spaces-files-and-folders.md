
## Working with Spaces, Files & Folders {#working-with-spaces-files-folders}

As you work with research storage, please consider its 
[intended uses](working-with-spaces-files-and-folders.md#intended-use-organization-considerations)
and [disk quotas](working-with-spaces-files-and-folders.md#disk-quotas-and-notifications).
We also provide information below about how to [access controls and edit
permissions](working-with-spaces-files-and-folders.md#access-controls-and-permissions)
for directories and files.

## Intended use, organization, & considerations {#intended-use-organization-considerations}

We wish to bring to your attention a number of items that will help you
work efficiently and prevent you from having future problems:

-   Remember that home folders are not sharable, and typically contain
    files that pertain to your work only. This also includes the default
    location for configuration or preference files, work that is
    considered 'in development'.

-   Project folders are shared locations, and ideally used for
    collaborative project spaces. Please see our recommendation below on
    organizing project spaces. **NOTE:** Only those persons who are
    listed on the data usage agreement or IRB proposal should have
    access to these directories. This is the responsibility of the
    primary HBS faculty member.

-   Do not dump the contents of your laptop or desktop in your home or
    project spaces as a backup. Please consider solutions like Dropbox,
    CrashPlan, or BackBlaze; or the free Connect Backup service from HBS
    IT if the functionality of a backup is needed (HBS members only).

-   HBS IT regularly scans the research storage areas for viruses as a
    part of the Harvard University security policy. Normally viruses are
    quarantined or removed via antivirus software on HBS-issued laptops
    and desktops, preventing them from reaching the research storage.
    But personal devices may not have similar protections. If you should
    receive a message from HBS IT or RCS about virus-containing files in
    your home or project spaces, please remove these as soon as possible
    to ensure the safety and integrity of research data across the
    entire computing grid and research storage.

### Organization and other Best Practices {#organization}

Organizing one's work has shifted from filing cabinets to disks filled
with hundreds, if not thousands of files. And as with paper files, it is
easy to become overwhelmed or lose things. To that end, we offer the
following advices on storage Organization and other Best Practices:

-   Two well written papers, [Gentzkow & Shapiro
    (2014)](http://web.stanford.edu/~gentzkow/research/CodeAndData.pdf)and
    [Noble
    (2009)](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000424),
    discuss strategies for organizing research project involving
    computational components and are Must Reads! (The latter paper is
    geared towards biologists, but all the content is relevant
    nonetheless.)

-   Data files should be in a directory accessible to all. If data has
    been cleaned and organized for analysis, consider making the
    foundational files 'read only' for the group to prevent accidental
    overwrites.

-   Descriptive README files in subdirectories can be useful in a space
    shared by multiple researchers.

-   Do not keep multiple copies of large data files in separate project
    directories. Move such files into a 'Reference Data' folder and
    mark it as 'read only'.

-   Consider having a directory for each group member to keep programs
    and other files they are working on organized.

-   Group members should periodically check permissions on files to
    ensure that members have the desired combination of read, write and
    execute functionality. See the previous section on "Access controls
    and permissions".

## Disk quotas and notifications {#disk-quotas-and-notifications}

The default size for project directories on the Research Grid is 50GB,
with increases granted upon request. When a project directory is full,
the system may not save files properly, which could result in a loss of
data. As you work, please regularly check your space usage. To check the
amount of space you are currently using in a project directory enter
this command in an SSH (or 'terminal') session:

`researchgrid$ df -h /export/projects/projectname`

For spaces in the "projects2" volume:
`researchgrid$ df -h /export/projects2/projectname`

When your project directory is 99% or 100% full, you will receive an
email from RCS with the following subject line:

***IMPORTANT: Project directory on the Research Grid is 99/100% full***

Please first see if you are able to archive any data using the
instructions
[here](https://www.hbs.edu/research-computing-services/help/technical-how-tos-and-technical-notes/archiving-your-research-files.aspx).
If you are unable to clear a significant amount of space, please [send
an email to
RCS](mailto:research@hbs.edu?subject=Project%20Space%20Increase) to
request a space increase.

**NOTE**: These notices only go out once a day. They are not a
substitute for regularly checking your space usage.

If you are working in an especially large project space you may receive
an email at the 99% or 100% full mark, but still have significant amount
space to work with. There is no way to turn off these notices, but if
you would like to ignore them, you can create a rule in Outlook to send
these emails to a single folder.

## Access controls and permissions {#access-controls-and-permissions}

On the Research Grid, directories and files have a set of permissions
indicating that the User, Group and World has permission to Read, Write
and/or Execute. A file listing shows the combination of permissions.
This shows read/write/execute for User and Group, with no permissions
for World.

d**rwx***rwx*\-\-- **User***Group*World ('d' indicates listing is a
directory)

In directory `/export/projects/generic_project`, enter this command line
to get the directory listing. (These are lower case 'L's; there is a
space between 'ls' and '-la'.)\
Here is an example:

`researchgrid$ ls –la-rw-r----- 1 jharvard rcs_project_generic 241215 Jul 30 2015 Article_d1.pdf`

The permissions on this file saved to the space are read/write (user
`rw-`) and read only (group `r--`). 'jharvard' is the file owner and
'rcs_project_generic' is the group name. The permissions can change when
a file is transferred from a desktop to a drive mapped to the drive in
grid storage. The person listed as 'owner' of a file (eg. 'jharvard')
is the only person who can change the permissions. To change the
permissions on files, please refer to the document '[Changing
Permissions on the Research
Grid](https://www.hbs.edu/research-computing-services/help/technical-how-tos-and-technical-notes/changing-permissions-on-the-hbsgrid.aspx)'.
