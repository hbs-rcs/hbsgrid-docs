
# Rclone

Many people use a web browser to transfer files between local and cloud
storage. In comparison,
[Rclone](https://rclone.org/){url="https://rclone.org/"} is a robust
command-line utility for synchronizing and transferring files to and
from cloud storage. The command-line subcommands are similar to standard
Unix file management commands, and [a long list of cloud providers are
supported](https://rclone.org/#providers){url="https://rclone.org/#providers"}.
You can use rclone to transfer and synchronize files between [HBSGrid
storage](../../research-storage/overview.md)
and your [HBS Microsoft OneDrive
storage](https://hbs-my.sharepoint.com/){url="https://hbs-my.sharepoint.com/"},
or any other supported cloud storage provider you may use. Rclone
supports transferring only files that have changed and resuming
interrupted transfers.

**Note:** Please remember that cloud storage services, rclone, and
HBSGrid storage should be used in compliance with data safety guidelines
and any Data Usage Agreement or approved IRB. If you have hesitations or
questions, please consult HBS IT Security\'s web pages on [data safety
levels](https://security.harvard.edu/files/it-security/files/rdslexamples.pdf) and [appropriate data storage
locations](https://inside.hbs.edu/Departments/it/security/Pages/dataprotection.aspx)
target="_blank"} (see large graphic), or contact
<informationsecurity@hbs.edu>.

## Configuring rclone {#configuring-rclone}

You must configure rclone for each cloud storage account you wish to
use. Note that *rclone configuration should be done on a login node* so
that rclone can use the web browser for authentication. This process is
usually simple: open a terminal and run

`module load rclone`

to make rclone available, and then run

`rclone config`

to start the configuration wizard. The program will prompt you for the
name and type of account you want to configure and other information
needed to set up the connection. Generally you can just accept the
defaults, but [detailed
documentation](https://rclone.org/docs/)
is available if you need it.

#### OneDrive configuration

Follow these steps to configure rclone for OneDrive:

1.  Open a terminal and run `rclone config`{.inline
    style="overflow-x: auto;"}
2.  Enter `n` at the prompt to create
    a new config
3.  Enter a name of your choosing at the prompt, e.g.,
    `OneDrive`
4.  At the "Storage" prompt Choose `onedrive`{.inline
    style="overflow-x: auto;"}
5.  Respond to subsequent prompts, accepting defaults unless you wish to
    change them
6.  A web browser window will open to retrieve credentials. Sign in to
    your OneDrive account if prompted
7.  Choose `ondedive` or
    `sharepoint` at the prompt
8.  Choose the drive you wish to use at the prompt
9.  Respond to subsequent prompts, accepting defaults unless you wish to
    change them
10. At the main menu choose `q` to
    quit the rclone configuration utility

### **Dropbox configuration**

Follow these steps to configure rclone for Dropbox:

1.  Open a terminal and run `rclone config`}
2.  Enter `n` at the prompt to create
    a new config
3.  Enter a name of your choosing at the prompt, e.g., `DropBox`
4.  At the "Storage" prompt Choose `dropbox`
5.  Respond to subsequent prompts, accepting defaults unless you wish to
    change them
6.  A web browser window will open to retrieve credentials. Sign in to
    your DropBox account if prompted
7.  Choose `Yes this is OK` at the
    confirmation prompt
8.  At the main menu choose `q` to
    quit the rclone configuration utility

Configuring other cloud storage providers follows a similar process \--
refer to the [detailed
documentation](https://rclone.org/docs/){url="https://rclone.org/docs/"}
if you have any doubts about how to respond to the prompts.

### Basic use

Once you have configured rclone, you can use it to manage files in cloud
storage. The more commonly used rclone commands include:

-   `rclone ls remote:path` (list
    objects on remote)
-   `rclone sync remote:path local/path`{.inline
    style="overflow-x: auto;"} (make local/path the same as remote:path)
-   `rclone copy local/path remote:path`{.inline
    style="overflow-x: auto;"} (copy local/path to remote/path).

## More information {#more-information}

As mentioned, Rclone supports a large number of cloud storage providers,
and has many features and options. And the project provides
comprehensive (yet comprehensible!) documentation at
[https://rclone.org/docs/](https://rclone.org/docs/){url="https://rclone.org/docs/"}.
And check out the [full list of `rclone`{.inline
style="overflow-x: auto;"}
commands](https://rclone.org/commands/)
