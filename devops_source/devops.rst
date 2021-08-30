Dev-ops Docs
============

:Author: Ista Zahn
:Date: 2021-03-03

RCS provides **Technology Preveiew** software on the HBS Grid. Most
of this software is installed using the `conda <https://docs.conda.io/en/latest/>`_
package manager, with additional ad hoc installations of software not available via conda.
This section of the documentation describes how these environments were
created and how other software was installed and configured. The intended
audience is developers and system administrators who need to install, fix, or
improve these environments. **Users should instead refer to the**
`User Guide <../../userguide/html/>`_.

General approach
----------------

We have used the Conda package manager, singularity containers, and ad hoc installation
of additional software to constitute modern data science and productivity software stacks.
The heaving lifting is done by *conda*, with *Singularity* and locally build software filling
in the gaps.

The conda environments are named *rcs_<date>.<version>*. The basic idea here is that when we
update the system we just create a new conda environment and increment the *<version>* number.
This allows users to continue using or fall back to old environments for convenience or reproducibility
reasons, while providing up-to-date software stacks for new projects. Because conda using a number
of strategies to avoid duplication, new environments usually require relatively little storage space
(though of course this depends on how much has changed relative to existing environments).

The conda-forge ecosystem is large and active, but there are still some programs that are not available
there. In that case we either 1. install pre-built binaries directly from upstream projects, 2. build and
install it locally, or 3. make it available via Singularity. An ongoing goal is to move as much as
possible into conda in order to take advantage of automatic updates, package de-duplication, and other
features provided by the conda ecosystem.

This project also provides launcher scripts and desktop files providing GUIs to start interactive LSF jobs on
a computing cluster. The core idea is to make working on a computing cluster feel more intuitive my
leveraging the "desktop" metaphor and workflows that many people are already comfortable with. For example,
the launchers and desktop files provided by this project enable users to launch a Stata job in LSF by double
clicking on a *.do* file in the file browser.


Requirements
------------

The **build requirements** on the host system mostly common and easily available on most Linux distributions.
They are:

- `make <https://www.gnu.org/software/make/>`_
- `coreutils <https://www.gnu.org/software/coreutils/>`_
- `xdg-utils <https://www.freedesktop.org/wiki/Software/xdg-utils/>`_ ,
- `singularity <https://sylabs.io/singularity/>`_
- `git <https://git-scm.com/>`_
- `findutils <http://www.gnu.org/software/findutils/>`_
- `bc <http://www.gnu.org/software/bc/>`_
- `libgl <https://www.mesa3d.org/>`_
- `rsync <https://rsync.samba.org/>`_
- `bash <https://www.gnu.org/software/bash/>`_
- `make <https://www.gnu.org/software/make/>`_
- `unzip <http://www.info-zip.org/UnZip.html>`_
- `tar <http://www.gnu.org/software/tar/>`_
- `cpio <http://www.gnu.org/software/cpio/>`_
- `mkfontdir <http://www.x.org>`_  
- `shared-mime-info <http://freedesktop.org/Software/shared-mime-info>`_
- `dconf <https://wiki.gnome.org/Projects/dconf>`_
- `rpm2cpio <http://www.rpm.org/>`_ or `rmpextract <https://github.com/dowjones/rpm-extract>`_
- `libnsl <https://github.com/thkukuk/libnsl>`_
- `wget <https://www.gnu.org/software/wget/>`_
- `lmod >= 7.6 <https://lmod.readthedocs.io/en/latest/>`_

These build dependencies can generally be installed using your Linux distribution package manager.
For example, on Fedora use

.. code-block:: bash

       
       dnf install mesa-libGL-devel cpio rpm tar unzip Lmod make \
           dconf libnsl bc xdg-utils singularity git rsync bash \
           wget shared-mime-info findutils xorg-x11-font-utils 


Everything else should be bootstrapped and built using conda environments.

Note that many Linux systems ship with really old **lmod**, e.g., Ubuntu 2020.04 has
version 6.6 (released in 2016). Sorry for the hassle, but you will need a more recent (>=
7.6) lmod. Fedora is a good option is you are running in docker or similar container, or
if you are setting up a new system to install on, otherwise you can follow the instructions at
https://lmod.readthedocs.io/en/latest/030_installing.html

Additional dependencies are needed to build the documentation, namely
`sphinx <https://www.sphinx-doc.org/en/master/>`_ and `mallard <http://projectmallard.org/>`_.

Run-time dependencies additionally include
`LSF <https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_welcome/lsf_welcome.html>`_ and
`GNOME 3 <https://www.gnome.org/>`_. We are interested in generalizing this to work with other
schedulers and /or desktop environments, but this has not yet been attempted.

A few things will only work correctly on
`RHEL 7 <https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux>`_, e.g., the
version of RStudio installed is the one built for RHEL 7. It would be good to fully support running on
other host operating systems. That probably isn't too hard (there are only a few os-specific binaries involved)
but this has not yet been attempted.


Environment creation and software installation
----------------------------------------------

NOTE: An installation of this software has been set up on the HBS Grid, so you may not need to set it up again.
(See the `user guide <https://code.harvard.edu/pages/HBS/rcs__cluster_software_modules/userguide/html/>`_
if you want to try it out.)

If you want to install somewhere else, there is
a *Makefile* in the top-level directory that you can run to (re) install the
software and set up environments. Note that the ``GRID_EXP_ROOTDIR`` variable will
by used as the root installation directory. It defaults to ``/opt/gridpowered``
but you can set it when you call ``make``, e.g., ``make all GRID_EXP_ROOTDIR=/opt/gridpowered``.

The ``scripts`` directory contains in installation and configuration code. Generally you should
run this code using ``make`` from the top-level directory rather than executing the scripts
directly. There are three types of scripts, as indicated by the file name prefix or suffix:

conda prefix
    Files starting with ``conda_.sh`` install and configure conda environments.

build prefix
    Files starting with ``build_`` build and install additional software not
    available via conda. These are installed in the ``local`` directory
    under the active ``conda`` environment.
    
install prefix
    Files starting with ``install_`` install additional pre-compiled binaries
    not available via conda. These are installed into the `opt` sub-directory
    under the top-level installation directory, and are not environment-specific.

make prefix
    Files starting with ``make_`` are used to generate scripts, modulefiles, and desktop files.
    These generally are environment-specific and installed in the ``local`` directory
    under the active ``conda`` environment.


Modulefiles and Launchers
-------------------------

LMOD modulefiles for the data science software environments 
installed using the `conda <https://docs.conda.io/en/latest/>`_ 
package manager are generated from the ``scripts/make_modulefiles.sh`` script.

Graphical applications ran be launched from the HBS Grid desktop using the
launcher scripts and *.desktop* files built from ``scripts/make_launchers.sh``
and ``scripts/make_desktopfiles.sh``.


Desktop Menu (.desktop) Files
-----------------------------

There are three sets of desktop files installed. Most importantly, those generated
from ``scripts/make_desktopfiles.sh`` install menus for launching applications
using bsub via graphical menu launchers.

Additional .desktop files in ``desktop_mask`` are used to hide "wrapper" and other RCS
menu entries that are to be replaced by those generated from ``scripts/make_desktopfiles.sh``.


Activation and startup
----------------------

Users can opt-in to this environment by running the
``bin/grid_set_desktop_mode.sh``
script. This script initializes some environment variables, adds application and
font symlinks to ``~/.local``, and creates a symlink in ``~/.config/autostart``.
In particular, ``share/applications/grid_gnome_modern.desktop`` will be
symlinked to ``~/.config/autostart``. This has the effect of setting environment
variables, activating the "rcs_<year>.<version>" conda environment described above and then restarting,
the Gnome desktop so that the desktop environment inherits these environment variables
and conda environments.

The setup process described above results a symlink in ``~/.local/applications`` linking
to the ``share/applications/grid_gnome.desktop`` file. This adds
a "HBS Grid Configuration" menu item, making it easy to toggle technology preview features on
and off.


Updates and new environments
----------------------------

This system is designed to make it easy to create new environments with updated software while leaving
previous environments intact so researchers can fall back to older versions when needed. In general we
encourage you to avoid updating existing environments -- just create a new one instead. Because conda
does a bunch of de-duplication you won't end up using much more in the way of resources, and you'll reduce
the risk of breaking something in an existing environment.

In our experience a two-step process for releasing new environments has been useful. First, create a development
environment (we usually name ours *rcs_0000.99*). Do whatever you like in this environment, including breaking
things (temporarily of course!). When you get it working to your satisfaction re-create it with a proper
*rcs_<year>.<version>* name (and never change it again).

Details about our specific release process on the HBS Grid are available in the HBS Grid Deployment section,
as an example you may wish to follow when deploying elsewhere.


Building the documentation
--------------------------

The devops documentation you are now reading is generated from the
`sphinx <https://www.sphinx-doc.org/en/master/>`_ sources in
``docs/devops_source``. The easiest way to update this
documentation is to run ``make all`` from the ``docs/``
directory.

The User Guide documentation is maintained as 
`mallard pages <http://projectmallard.org/>`_ in
``docs/userguide``. Mallard was chosen so that we can display
this documentation in Yelp, the Gnome help viewer. HTML versions of the user guide
were generated with ``yelp build html``; the easiest way to update this
documentation is to run ``make all`` from the ``docs/``
directory.
