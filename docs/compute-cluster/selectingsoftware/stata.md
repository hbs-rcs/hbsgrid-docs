
## Stata and Maintaining Version Stability


Every two years we update Stata in our research computing environment
(both desktops and on the HBSGrid). While this is an excellent
opportunity to stay abreast of the new features, it does present a
problem: how does one guarantee that you will obtain the same results
with the new version for a project you've been working on for a number
of years?

### Current Stata: Version command {#current-stata-version-command}

Stata has the excellent command `version` that maintains backwards compatibility for
the execution engine:

`version #` sets the command
interpreter and other features such as random-number generators (RNGs)
to version number `#`.
`version #` is used to allow old
programs to run correctly under more recent versions of Stata and to
ensure that new programs run correctly under future versions of Stata.

This guarantees that your code will still execute correctly, but it does
not necessarily guarantee that the fundamental, underlying math
libraries haven't changed, which may result in calculation results
which are not consistent with previous runs. Please see
[https://www.stata.com/manuals/pversion.pdf](https://www.stata.com/manuals/pversion.pdf) for more information.

### Running old Stata versions {#running-old-stata-versions}

For this reason, we keep at least one to two versions of Stata installed
on the HBSGrid to guarantee that changes in versions (and the underlying
math and software libraries) do not cause unexpected problems.

At this time, executing Stata via drop-down Application menus through
NoMachine will run the latest version of Stata that is installed.
Likewise, using the command line wrappers `stata-mp4-5g` and their permutations
(`[x]stata-[se|mp4|mp8][-5g|-10g-20g]`) will also run the latest Stata version.

To run older versions of Stata, one must use custom LSF commands to
submit a job and point to the location of the older Stata binary. On the
HBSGrid, in general, all binaries are located within respective
directories at `/usr/local/app`.
Thus:

Stata v15 SE is at `/usr/local/app/stata15-se/`, and

Stata v15 MP4 is at `/usr/local/app/stata15-mp4/`.

And so on. So to run a Stata v15 SE interactive with 5 GB RAM, one would
use the interactive form of the `bsub` command with the path to the Stata v15 SE GUI
binary. So the full command would be

`bsub -q long_int -Is -n 1 -app stata-se-5g /usr/local/app/stata15-se/xstata-se`

To run a Stata v15 MP4 batch file with 30 GB RAM, one would use the
non-GUI binary and use the appropriate Stata command line flags to run
the `*.do` file in batch. So the full
command would be

`bsub -q long -n 4 -R "rusage[mem=30000]" -M 30000 -hl /usr/local/app/stata15-mp4/stata-mp -d do mydofile.do`

If you plan to use ODBC with Stata, you must also include the following
command before your job submission `bsub`:

`export LD_LIBRARY_PATH=/usr/lib64:$LD_LIBRARY_PATH`

Please [contact
RCS](mailto:mailto:research@hbs.edu?Subject=Running%20old%20versions%20of%20Stata)
if you have any questions.
