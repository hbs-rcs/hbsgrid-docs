Deployment on the HBS Grid
==========================

:Author: Ista Zahn
:Date: 2021-04-01


The ``/export/projects/rcs_admin_sharedspace/techpreview-installers``
directory contains checked-out git trees for the RCS HBS Grid
Technology Preview. Please DO NOT MAKE CHANGES DIRECTLY in these
directories!

The directories in ``/export/projects/rcs_admin_sharedspace/techpreview-installers``
serve as installers for the HBS Grid technology
preview installed at ``/usr/local/app/rcs_bin/techpreview-dev``. Each
directory is a particular branch of the git repository hosted at
https://code.harvard.edu/HBS/rcs__cluster_software_modules . (Separate
directories for each branch might seem strange, but we need it because
we deploy directly from these checked-out branches using GNU Make. If we
just had one directory and checked out different branches ``make`` will
not operate correctly, for resions described in
https://git.wiki.kernel.org/index.php/GitFaq#Why_isn.27t_Git_preserving_modification_time_on_files.3F)

Development
-----------

The directories in ``/export/projects/rcs_admin_sharedspace/techpreview-installers``
currently correspond to these deployed environments:

::

   rcs_2020.01 :: /usr/local/app/rcs_bin/techpreview-dev/envs/rcs_2020.01
   rcs_2021.03 :: /usr/local/app/rcs_bin/techpreview-dev/envs/rcs_2021.03
         master :: /usr/local/app/rcs_bin/techpreview-dev/envs/rcs_0000.xx

Development should generally be done either directly on the ``master`` branch, or in
feature branches to be merged into master.

Hot-fixes for already released environments can either be done in the release
branch and merged into ``master``, or done in master and cherry-picked into th
release branch.

To release a new environment, branch it from ``master`` and check it out
to a new directory here.

Again, please DO NOT MAKE CHANGES DIRECTLY in the
``/export/projects/rcs_admin_sharedspace/techpreview-installers`` directories.
**clone your own copy of https://code.harvard.edu/HBS/rcs__cluster_software_modules and push your changes there**.
Push updates to ``code.harvard.edu/HBS/rcs__cluster_software_modules``
and then pull theme to the appropriate directory in ``/export/projects/rcs_admin_sharedspace/techpreview-installers``.
The installers in this directory should be considered "pull only".


Deploying updates and new environments
--------------------------------------

Deployment is done from one of the sub-directories in ``/export/projects/rcs_admin_sharedspace/techpreview-installers``
here using GNU ``make``. You can run ``make help`` to get a documented list of commands:

::

   all                 Create all conda environments, build local software, update config and caches 
   assets              Install assets 
   build               Build local software 
   conda_envs          Create conda environments 
   fakeupdate          mark all up-to-date 
   install             Download and install pre-built software 
   setup               Install conda, launchers, desktop files, icons and other assets

Of these, ``make all`` is usually all you need.

Deploying updates to an existing environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Previously deployed environments can be updated as follows:

-  ``cd`` to the installer directory, e.g., ``cd rcs_2021.03``
-  pull updates, e.g., ``git pull origin rcs_2021.03``
-  do a dry run to see what will be updated, e.g., ``make -n all``
-  if it looks good run ``make all`` do the actual update

Deploying a development environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We use a naming convention to "hide" development environments, so that
you can deploy and test from the ``master`` branch before spinning it off
into a new versioned branch. The ``ENVNAME`` environment variable is
used to specify the name of the environment created by ``make``, and in
the ``master`` branch we set this to ``rcs_000.xx``. The system skips
these when presenting environment options to users. For example, you can
create and test a new environment with

::

   cd master
   make -n all ENVNAME=rcs_0000.01 # dry run
   make all ENVNAME=rcs_0000.01 # actually create new environment
   /usr/local/app/rcs_bin/techpreview-dev/envs/rcs_0000.99/local/bin/grid_set_desktop_mode.sh

Note that this will prompt you to "update", which you should decline if
you want to test the development environment.

Deploying a new environment release
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

New environment releases should be branched off of the ``master`` branch.
For example, you can create a new ``rcs_2100.01`` release as follows:

::

   ## retrieve new installer directory
   git clone git@code.harvard.edu:HBS/rcs__cluster_software_modules.git rcs_2100.01
   ## create corresponding git branch
   cd rcs_2100.01
   git checkout master
   git checkout -b rcs_2100.01
   vim Makefile ## change ENVNAME to rcs_2100.01 and quit
   git commmit -m"deploy rcs_2100.01"
   git push origin rcs_2100.01
   ## create the new environment
   cd ../rcs_2100.01
   make -n all ## dry run, should not run any scripts/install_*
   make all ## if all looks good

The full installation currently takes a couple of hours.

