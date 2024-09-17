---
tags:
  - R
  - Python
  - Stata
  - Matlab
  - Parallelization
  - GPU
---

# Maintaining Version Stability in Stata

As new versions of Stata are released, we update Stata in our research computing environment 
(both desktops and on the HBSGrid). While this is an excellent opportunity 
to stay abreast of the new features, it does present a problem: 
how does one guarantee that you will obtain the same results with the new version 
for a project you’ve been working on for a number of years? 

## Using the Version Command

Stata has the excellent command `version` that maintains 
backwards compatibility for the execution engine:

`version #` sets the command interpreter 
and other features such as random-number generators (RNGs)
to version number #. 
`version #` is used to allow old programs to run correctly 
under more recent versions of Stata 
and to ensure that new programs run correctly 
under future versions of Stata.

This guarantees that your code will still execute correctly, 
but it does not necessarily guarantee 
that the fundamental, underlying math libraries haven’t changed, 
which may result in calculation results 
which are not consistent with previous runs. 
Please see [https://www.stata.com/manuals/pversion.pdf](https://www.stata.com/manuals/pversion.pdf) for more information. 

## Running Old Stata Versions

We keep at least one to two versions of Stata installed on the HBSGrid 
to guarantee that changes in versions (and the underlying math and software libraries)
do not cause unexpected problems.

Executing Stata via drop-down Application menus through NoMachine will run 
the version of Stata installed in the environment specified 
in the "Software environment version" drop-down menu.
To run an older version, you can change the environment in the drop-down.

!!! important inline end
    Older environments may run a version of Stata 
    that is newer than the version listed in our documentation.
    If the version listed is too old and it is no longer installed on the HBSGrid,
    these environments will default to the oldest version available.
    
See [our environment documentation](https://hbs-rcs.github.io/hbsgrid-docs/environments/#environment-versions)
for information about which Stata version is in which environment.
<!-- Likewise, using the command line wrappers stata-mp4-5g and their permutations 
([x]stata-[se|mp4|mp8][-5g|-10g-20g]) will also run the latest Stata version. -->

To run older versions of Stata, one can use custom LSF commands 
to submit a job and point to the location of the older Stata binary. 
On the HBSGrid, in general, all binaries are located 
within respective directories at /usr/local/app. Thus:

Stata v17 MP4 is at /usr/local/app/stata17-mp4/.
Stata v17 MP8 is at /usr/local/app/stata17-mp8/

And so on. So to run a Stata v17 MP4 interactive with 5 GB RAM, 
one would use the interactive form of the [bsub command](https://hbs-rcs.github.io/hbsgrid-docs/commandline/) 
with the path to the Stata v17 MP4 GUI binary. So the command might be something like

`bsub -q long_int -Is -n 4 -M 5G /usr/local/app/stata17-mp4/xstata-mp`

To run a Stata v17 MP4 batch file with 30 GB RAM, 
one would use the non-GUI binary and use the appropriate Stata command line flags
to run the *.do file in batch. So the full command would be

`bsub -q long -n 4 -R "rusage[mem=30000]" -M 30000 -hl /usr/local/app/stata17-mp4/stata-mp -d do mydofile.do`

<!--If you plan to use ODBC with Stata, you must also include the following command before your job submission bsub:
export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH -->
