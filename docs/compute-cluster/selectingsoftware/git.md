## Git & Github

Tired of wading through files/folders titled 'paper_v1', 'paper_v2',
'paper_v3_beforeAdvisor?' Are you collaborating with a large group of
individuals, all making small tweaks to the same code, and want to
easily merge everyone's versions? Have you ever made a mistake in your
code, saved over your file, and wished you could roll it back to an
earlier version?


For these (and many other!) reasons, we strongly encourage people to use
some form of version control as a part of best practices for research
data management, reproducible research, and documenting her/his scripts
and code changes over the course of a research project (see our [Best
Practices
page](https://www.hbs.edu/research-computing-services/data-practices/general-and-best-data-practices.aspx)).
Version control can be used to keep track of versions of a piece of work
that either a single person is working on, or a shared document.

## What are version control systems? {#what-are-version-control-systems}

Version control systems start with a base version of the document and
then save just the changes you made at each step of the way by taking a
so-called "snapshot". A snapshot records information about when it was
taken, and all the changes between the current document and the previous
version. The user (you) decides when these snapshots are collected, and
this allows one to 'rewind' your file to an older version. Multiple
users can make independent sets of changes based on the same document
and have separate snapshots documenting the changes. You can then
"merge" various sets of changes onto the same base document. Version
control systems are used to track changes in text documents (HTML pages,
text files, Markdown documents, etc) and binary files (MS Office files,
images, etc), though the changes in these types of files are tracked
less efficiently (and is beyond the scope of this document).

## What version control systems are available to you? {#what-version-control-systems-are-available-to-you}

There are many different version control systems available, but one of
the most widely used is
[Git](https://git-scm.com/){url="https://git-scm.com/" target="_blank"},
which is the program that will track changes of your scripts (source
code) over time. And Git should not be confused with
[GitHub](https://github.com){url="https://github.com" target="_blank"},
which is a hosting service for Git repositories, the bundle of files and
folders that represent your work and the typically-invisible data files
that track your changes & history. Other hosting services include
[GitLab](https://gitlab.com){url="https://gitlab.com" target="_blank"},
[SourceForg](https://sourceforge.com){url="https://sourceforge.com"
target="_blank"}e, and
[BitBucket](https://BitBucket.com){url="https://BitBucket.com"
target="_blank"}.

If you'd like general information on how to use Git, please see the
excellent, self-paced materials for [Git at the command
line](http://swcarpentry.github.io/git-novice){url="http://swcarpentry.github.io/git-novice"
target="_blank"} from Software Carpentry. For a GUI version of Git, we
recommend
[GitKraken](https://www.gitkraken.com/){url="https://www.gitkraken.com/"
target="_blank"}, and [our own GitKraken usage
tutorial](https://hbs-rcs.github.io/versioning_data_scripts/){url="https://hbs-rcs.github.io/versioning_data_scripts/"
target="_blank"}.

Git and GitKraken are installed on the HBSGrid. GitLFS, the extensions
for handling files larger than 50 MB, is also installed.

Two of the most commonly used hosting platforms within the Harvard
community are described below.

## code.harvard.edu {#code.harvard.edu}

Members of the Harvard community can take advantage of Harvard's Git
hosting platform at https://code.harvard.edu by signing in with their
Harvard Key (an account will automatically be created). Features of this
platform include:

-   Public repositories are only visible to people within Harvard
-   Private repositories are only visible to the user and collaborators
-   Maximum total file size for a repository is 1GB
-   Users can create an unlimited number of repositories

## github.com {#github.com}

Free accounts can also be created on github.com, a web-based code
repository. While similar to the repositories at code.harvard.edu, the
platform has slightly different features for the free accounts:

-   Public repositories are open to everyone on the platform
-   Private repositories are only visible to the user and collaborators,
    but the free account limits the features and only allows you to
    share with up to three collaborators
-   Maximum total file size for a repository is 100GB, but if your
    repository exceeds 1 GB GitHub support may contact you to reduce the
    size
-   Users can create an unlimited number of repositories
