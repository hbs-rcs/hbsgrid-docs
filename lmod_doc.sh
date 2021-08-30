#!/usr/bin/env bash

## This script auto-generates documentation
## for all available modules.

command -v module &> /dev/null || [ -z "\$LMOD_ROOT" ] || source \${LMOD_PKG}/init/bash
module unuse /usr/local/app/lmod/modulefiles
module use ${GRID_EXP_ROOTDIR}/modulefiles

module load rcs

M=$(module -t -r --redirect avail | rg '^[[:alpha:]].*[[:alnum:]]$')

echo '
.. _available-software:

Available modules
=================

This documentation describes **unofficial** conda environments and other software
installed and maintained on the HBS Grid. The software
documented here is **a technology preview** and **any and all use is at your own risk**.

Modules currently available on the HBS Grid are described below.
You can use these modules using the ``module load`` or ``ml`` commands from
a terminal, or via the desktop menus on the HBS Grid.

You can get more information about individual modules from the command line;
see https://lmod.readthedocs.io/en/latest/010_user.html?highlight=whatis for details.

' > devops_source/available_modules.rst

root='.'
for mod in $M
do
    current=$(echo $mod | cut -d'/' -f1 | cut -d'-' -f1 | sed 's/[0-9]$//g')
    if [ $root != $current ]
    then
        echo "${current^}" >> devops_source/available_modules.rst
        echo $current | sed 's/./-/g' >> devops_source/available_modules.rst
        echo "" >> devops_source/available_modules.rst
    fi
    root=$current
    if [ $(echo $mod | grep "/") ]
    then
        echo $mod >> devops_source/available_modules.rst
        echo $mod | sed "s/./^/g" >> devops_source/available_modules.rst
    fi
    echo '
::' >> devops_source/available_modules.rst
    module --redirect spider $mod | sed 's/^/    /g' >> devops_source/available_modules.rst
    module --redirect whatis $mod | cut -d':' -f1 --complement | sed 's/^/    /g' >> devops_source/available_modules.rst
done
