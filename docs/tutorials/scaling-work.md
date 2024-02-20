---
tags:
  - R
  - Python
  - Stata
  - Matlab
  - Parallelization
  - GPU
---

# Scaling Work {#scaling-work}

There are numerous ways to scale up your work on the HBSGrid, including
[parallel processing](#parallel-processing) and [GPUs](#GPU).

## Parallel Processing {#parallel-processing}

Also commonly called parallel computing or multicore processing, using
multiple cores (CPUs) to analyze data is an efficient way to get more
work done in less time. But only under certain circumstances! There two
basic ways to use multiple cores: [implicit parallelism](#implicit)
built in to your application or library,
and [explicit parallelism](#explicit) that you program and manage
yourself. Explicit parallelism can be achieved using
application/language native tools or using [LSF job
arrays](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_admin/job_arrays_lsf.html).

### Requesting multiple CPUs on the HBSGrid {#requesting-multiple-cpus-on-the-hbsgrid}

When using parallel processing on shared compute systems, you need to
indicate to the scheduler, the system software that manages workloads,
that you wish to use multiple cores. On your personal desktop or laptop,
this isn't necessary, as you control all the resources on that machine.
However, on a compute cluster, you only control the resources that the
scheduler has given you, and it has given you only the resources that
you've requested, whether this is done explicitly via a custom job
submission script, or implicitly using a default values or default
submission scripts available on the HBS compute grid. This is due to the
fact that jobs (work sessions) from multiple (and possibly) different
people, are often running side-by-side on a given compute node on the
compute cluster.

When you start a job on the HBSGrid, one can specify the number of CPUs you will use.
Desktop applications have pop-up dialog where you can enter an appropriate value, and the
`bsub` command-line program allows you to specify CPUs via the `-n` argument.
For example, starting Stata-MP4 with the command `bsub -q short_int -Is -n 4 xstata-mp` from 
the HBSGrid command line will ask to start a session with 
4 CPUs reserved (the session will start when there's room and its been sent to the
appropriate compute node.)

### Implicit Parallelism {#implicit-parallelism}

Implicit parallelism is easiest to use but limited to the features
offered by your application or programming language. Most of the
applications commonly used for data analysis on the HBSGrid provide some
degree of implicit parallelization. The system-wide installation of
Rstudio / Microsoft R Open uses the Intel Math Kernel Lbrary (MKL)
for fast multi-threaded computations.  The system-wide installation of
Spyder / Python also use MKL to speed up some computations.
Similarly, many Stata commands have been parallelized, as have some
Matlab algorithms. Note that for all these applications only some
computations use implicit parallelization and many computations will
only use a single CPU. To speed up other computations you may be able to
use explicit parallelization.

### Explicit Parallelism {#explicit-parallelism}

Explicit parallelism can be achieved using application or library
features to leverage multiple CPUs on a single compute node, or
using LSF job arrays to leverage multiple CPUs across multiple compute
nodes. For this to work, your script or code must be parallelizable \--
it can be broken into parts that can execute independently. This is
often the case with for loops or functions that can perform work
independently. A good example is the apply functions in R
(`apply()`, `lapply()`, etc.).

As when using implicit parallelism, you must request the number of
CPUs you will use when submitting a job. We also recommend that you do
not statically indicate ('hard code') the number of cores that you'll
be using in your code. Instead, set this value dynamically based on
job/runtime environment variables that are set as the job executes.
You'll see examples of this in the following sections.

Finally, one must also factor in memory requirements for explicit
parallelization. If the parallelization all happens within one job (e.g.
Python's `muliprocessing`, certain
approaches with `parallel` or `future` packages in R), one must
also determine how the memory will be consumed for each
fork/thread/process/branch of the code. If each has it's own copy of
the data and data structures, then memory requirements will increase
significantly based on the number of parallel executions. Conversely, if
each shares the data in memory with the parent program, then
significantly less memory will be needed. Each application/programming
framework works differently; consult the documentation and adjust the
memory requirement appropriately when submitting the job.

Explicit parallelism uses application-specific libraries and features,
and is described below for each of the most commonly used programs on
the HBSGrid cluster.

??? note "MATLAB"
    
    ### **Introduction**

    The following has been adapted from FAS RC's Parallel MATLAB page
    (<https://docs.rc.fas.harvard.edu/kb/parallel-matlab-pct-dcs/>). As
    the Odyssey cluster uses a different workload manager, the code has
    been adapted to the workload manager on the HBSGrid compute cluster.

    This page is intended to help you with running parallel MATLAB codes
    on HBSGrid. Parallel processing with MATLAB is
    performed with the help of two products, Parallel Computing Toolbox
    (PCT) and Distributed Computing Server (DCS). **HBS is licensed only
    for use of the PCT.**

    *Supported Versions*: On the HBSGrid cluster, all versions of MATLAB
    2018a 64-bit and greater are licensed and have been installed
    with the Parallel Computing Toolbox (PCT).
    
    *Maximum Workers*: PCT uses *workers*, MATLAB computational engines,
    to execute parallelized applications and their parts on CPU cores.
    Each compute node on the cluster has >= 32 physical cores; therefore (in
    theory) users should request no more than 32 cores when using MATLAB
    with PCT. However, due to current user resource limits, **you should
    request no more than 12 (interactive) or 16 (batch) cores**. If you
    request more than this, your job will not run – it will sit in a
    `PEND` state.

    ### **Code Example**

    The following simple code illustrates the use of PCT to calculate pi
    via a parallel Monte-Carlo method. This example also illustrates the
    use of `parfor` (parallel `for`) loops. In this scheme,
    suitable `for` loops could be
    simply replaced by parallel `parfor` loops without other changes to the
    code:

    ``` matlab
    hLog = fopen( [mfilename, '.log'] , 'w' ); % Create log file 
    
    % Launch parallel pool with as many workers as requested
    hPar = parpool( 'local' , str2num( getenv('LSB_DJOB_NUMPROC') ) ); 
    
    % Report number of workers
    fprintf( hLog , 'Number of workers = %d\n' , hPar.NumWorkers ) 
    
    % Main code
    R = 1; darts = 1e7; count = 0; % Prepare settings
    tic; % Start timer 
    
    parfor i = 1:darts 
      % Compute the X and Y coordinates of where the dart hit the
      % square using Uniform distribution
      x = R * rand(1); 
      y = R * rand(1); 
      if x^2 + y^2 <= R^2 
        % Increment the count of darts that fell inside of the.................
        % circle
        count = count + 1 % Count is a reduction variable.
      end
    end
    
    % Compute pi
    myPI = 4 * count / darts;
    
    T = toc; % Stop timer 
    % Log results
    fprintf( hLog , 'The computed value of pi is %2.7f\n' , myPI );
    fprintf( hLog , 'Executed in %8.2f seconds\n' , T ); 
    
    % shutdown pool, close log file, and exit
    delete(gcp); 
    fclose(hLog); 
    
    exit;
    ```
    
    ### **Code with Job Submission Script**

    To run the above code (named code.m) using **4 CPU cores** with the
    HBSGrid's default version of MATLAB, in the terminal use the following
    command:

    `bsub -q short -n4 matlab -r "code" `

    This will run and create a log file called `code.log` owing 
    to the first line in our MATLAB code, `hLog=fopen( [mfilename, '.log'] , 'w' );`

    If you do not use MATLAB's `mfilename` function, then you may also enter the
    following command to have output sent to an output/report file (often emailed):

    ``` bash
    bsub -q short -n 5 matlab \< code.m
    ```

    The `<` is escaped here so that it becomes part of the `MATLAB`
    command, not the `bsub` command.

    If you wish to use a submission script to run this code and include
    LSF job option parameters, create a text file named
    `code.sh` containing the
    following:
    
 
    ``` bash
    #!/bin/bash
    #
    #BSUB -q short
    #BSUB -n 4
    #BSUB -We 30
    #BSUB -R" rusage[mem=10G]"
    #BSUB -M 10G -hl
    
    # do a module load if needed, e.g.
    # module load rcs/rcs_2022.11 
    # OR
    # module load matlab/2023a
    
    matlab -nosplash -nodesktop  -r "code"
    ```

    Once your script is ready, make it executable via `chmod a+x ./code.sh`, and then
    submit/run the job run by entering:

    `bsub ./code.sh `

    Note: we don't need to include `-n 4` as it is embedded in the file. Also, the `<` 
    character often used here so that the `#BSUB` directives  in the script file are 
    parsed by LSF. This is now optional.

    ### **Explanation of Parallel Code**

    *Starting and stopping the parallel pool*

    The `parpool` function is used
    to initiate the parallel pool. To dynamically set the number of
    workers to the CPU cores you requested, we ask MATLAB to query the
    LSF environment variable `LSB_DJOB_NUMPROC`:

    `hPar = parpool( 'local', str2num( getenv( 'LSB_DJOB_NUMPROC' ) ) ); `

    Once the parallelized portion of your code has been run, you should
    explicitly close the parallel pool and release the workers as
    follows:

    `delete(gcp); % Shutdown parallel pool `

    *Parallelized portion of the code*

    The actual portion of the code that takes advantage of multiple CPUs
    is the `parfor` loop
    (<http://www.mathworks.com/help/distcomp/parfor.html>). A
    `parfor` loop behaves similarly
    to a `for` loop, though various
    iterations of the loop are passed to different workers. It is
    therefore important that iterations due not rely on the output of
    any other iteration in the same loop.

    ``` matlab
    parfor i = 1:darts
      x = R * rand(1);
      y = R * rand(1);
      if x^2 + y^2 <= R^2
        count = count + 1 
      end
    end
    
    ```
    
??? note "Python"
    
    ### **Introduction**

    This page is intended to help you with running parallel python codes
    on the HBSGrid cluster or on your local multicore machine. The
    version of python on the cluster [uses MKL to automatically
    parallelize some
    computations](https://docs.anaconda.com/mkl-optimizations/).
    Python started via a desktop menu will use the number of CPUs you
    specify when starting your application.

    In addition to the implicit parallelization provided by MKL, you can
    explicitly parallelize your own analysis code using the
    '[multiprocessing](https://docs.python.org/3/library/multiprocessing.html)'
    package. Instructions and examples are provided below. Note that
    this guide does NOT cover distributed computing, which distributes
    the workload over multiple machines.

    *Maximum Workers*: Most compute nodes on the cluster have at least
    32 physical cores; therefore (in theory) users should request no
    more than 32 cores. For short queue jobs, you may request the use of
    up to 16 cores, while the limit remains at 12 cores for long queue
    jobs. **Nota Bene!** The number of workers are dynamically
    determined by asking LSF (the scheduler) how many cores you have
    reserved via the `LSB_DJOB_NUMPROC` environment variable. **DO NOT** use
    `multiprocessing.cpu_count()`
    or similar; instead retrieve the values of this environment
    variable, e.g., `os.getenv("LSB_DJOB_NUMPROC")`.

    ### **Example: Parallel Processing Basics**

    This sample code will provide a basic introduction to parallel
    processing. You will be shown how to set up your parallel pool with
    the appropriate number of workers, how to define which function is
    to be run in parallel, and how to gather the results.

    For this example, we will calculate the square of a list of numbers
    in parallel.

    ``` py
    # file: fork_process.py
     
    # This code both defines the function (f) to run
    # and also (in __main__) forks a new process for each worker
     
    import sys
    import os
    import multiprocessing
    import time
     
    def f(x):
      pid=os.getpid()
      print("{}:{}".format(pid,x*x))
      return x*x
     
    if __name__ == "__main__":
      numList=range(1,100)
      procs = [multiprocessing.Process(target=f, args=(x,)) for x in numList]
     
      for p in procs:
        p.start()
        p.join()
    ```

    ### **Example: Parallel Processing with Pools**

    ```
    # File pool_process.py
     
    # This code assumes the same function (f) as above
    # but instead (in __main__) uses the requested cores to create
    # persistent workers (process pool) to handle the spread of work
     
    import sys
    import os
    import multiprocessing
    import time
     
    def f(x):
      pid=os.getpid()
      print("{}:{}".format(pid,x*x))
      return x*x
     
    if __name__ == '__main__':
     
      numList=range(1,100)
      num_workers = os.getenv("LSB_DJOB_NUMPROC")
     
      p = multiprocessing.Pool(num_workers)
      result = p.map(f,numList)
      p.close()
      p.join()
    ```
    
    ### **Code with Job Submission Script**

    To run the above code (named `test.py`)
    using **5 CPU cores** in the terminal use the following command:

    `bsub -q short n -n 5 python pool_process.py`

    If you wish to use a submission script to run this code and include
    LSF job option parameters, create a text file named
    `code.sh` containing the
    following:

    ```
    #!/bin/bash
    #
    #BSUB -q short
    #BSUB -W 10
    #BSUB -R" rusage[mem=1024]"
    #BSUB -M 1024 -hl 
     
    pool_process.py
    ```

    Once your script is ready, you may run it with **5 cores** by
    entering:

    `bsub -n 5 ./code.sh`

    Note, the `<` character is no
    longer needed when submitting jobs for LSF to parse `#BSUB`{.inline
    style="overflow-x: hidden;"} directives; this is done by default.

??? note "R"
    
    ### **Implicit Parallelization**

    The system-wide installation of Rstudio / [Microsoft R
    Open](https://mran.microsoft.com/open) on the Grid uses the Intel
    Math Kernel Lbrary (MKL) for [fast multithreaded
    computations](https://mran.microsoft.com/documents/rro/multithread).
    R started on the Grid via a [wrapper
    script](running-a-program-submitting-a-job.md#custom)
    will use the number of CPUs you specify when starting your
    application. For example, starting Rstudio from the desktop menu
    and selecting 5 CPUs from the drop-down menu will start R with
    MKL correctly configured to use 5 cores. You can set the number of
    cores used by MKL using the setMKLthreads function in the
    `RevoUtilsMath` package; [more
    information about MKL in R is
    available](https://mran.microsoft.com/documents/rro/multithread).
    Some popular R packages, including
    [data.table](https://cran.r-project.org/web/packages/data.table/index.html),
    also provide some degree of implicit parallelization. The number of
    threads used by data.table can be set using the setDTthreads
    function.

    ### **Explicit Parallelization**

    It is also possible to explicilty parallelize your own analysis
    code. There are a large number of R packages available for parallel
    computing.

    The [future
    package](https://cran.r-project.org/package=future)
    is simple, easy to use, and can make use of several backends to
    enable parallelization across CPUs, add-hoc clusters, HPC clusters
    (including LSF on the grid) via
    [future.batchtools](https://cran.r-project.org/web/packages/future.batchtools/index.html)
    and others. A number of front-ends are available, including
    [future.apply](https://cran.r-project.org/web/packages/future.apply/index.html)
    and
    [furrr.](https://cran.r-project.org/web/packages/furrr/index.html)

    The
    [foreach](https://cran.r-project.org/package=foreach) package is another popular option with a number of
    available backends, including
    [doFuture](https://cran.r-project.org/package=doFuture)
    that allows you to use foreach as a future frontend.

    For a more comprehensive survey of parallel computing in R refer to
    the [High Performance Computing Task
    View](https://cran.r-project.org/web/views/HighPerformanceComputing.html).

    ### **Code Examples**

    The following code examples were adapted from the Texas Advanced
    Computing Center (TACC) seminar [R for High Performance
    Computing](https://www.xsede.org/web/xup/course-calendar/-/training-user/class/511/session/1063 "R for High Performance Computing") given through XSEDE.

    Below are a number of very simple examples to highlight how the
    frameworks can be included in your code. **Nota Bene!** The number
    of workers are dynamically determined by asking LSF (the scheduler)
    how many cores you have reserved via the `LSB_DJOB_NUMPROC`
    environment variable. **DO NOT** use the `mc.detectcores()` routine or anything similar, as this
    will clobber your code as well as any other code running on the same
    compute node.

    All the following examples will use the following example function :

    ``` r 
    myProc <- function(size=10000000) {
    #Load a large vector 
    vec <- rnorm(size) 
    #Now sum the vec values 
    return(sum(vec)) 
    }
    ```

    It is important not to use more cores than we've reserved:

    ``` r
    ## detect the number of CPUs we are allowed to use 
    n_cores <- as.integer(Sys.getenv('LSB_DJOB_NUMPROC')) 
    ## use multiprocess backend 
    plan(multiprocess, workers = n_cores)
    ```

    The future.apply package provides `*apply` functions that use future
    backends.

    ``` r
    ## replicate in parallel 
    library(future.apply) 
    future_replicate(10, myProc())
    ```

    The doFuture package makes it easy to write parallel loops:

    ``` r
    library(doFuture) 
    registerDoFuture() 
    foreach (i = 1:10, .combine = c) %dopar% { myProc() }
    ```

    ### **Scheduler Submission (Job) Script**

    If submitted via the terminal, the following batch submission script
    will submit your R code to the compute grid and will allocate 4 CPU
    cores for the work (as well as 5 GB of RAM for a run time limit of
    12 hrs). If your code is written as above, using
    `LSB_DJOB_NUMPROC`, then
    your code will detect that 4 cores have been allocated.

    ```{bash}
    bsub -n 4 -q long -M 5G -hl Rscript my_parallel_code.R
    ```

??? note "Stata"
    
    ### **Introduction**

    StataMP provides implicilty parallel implementations of many
    functions, which are documented its [330 page Stata/MP Performance
    Report](https://www.stata.com/statamp/report.pdf), describing which functions are parallelized and
    each's efficiency (how perfectly parallelized a given function is):

    Stata/MP is the version of Stata that is programmed to take full
    advantage of multicore and multiprocessor computers. It is exactly
    like Stata/SE in all ways except that it distributes many of Stata's
    most computationally demanding tasks across all the cores in your
    computer and thereby runs faster---much faster.

    They could be impressive. But a caveat:

    ![](https://www.hbs.edu/research-computing-services/Shared%20Documents/Grid/stata_parallelization.png){style="max-width:400px;"}

    With multiple cores, one might expect to achieve the theoretical
    upper bound of doubling the speed by doubling the number of
    cores---2 cores run twice as fast as 1, 4 run twice as fast as 2,
    and so on. However, there are three reasons why such perfect
    scalability cannot be expected: 1) some calculations have parts that
    cannot be partitioned into parallel processes; 2) even when there
    are parts that can be partitioned, determining how to partition them
    takes computer time; and 3) multicore/multiprocessor systems only
    duplicate processors and cores, not all the other system resources.

    In general:

    Stata/MP achieved **75% parallelization efficiency overall** and
    **85% efficiency among estimation commands**\... Speed is more
    important for problems that are quantified as large in terms of the
    size of the dataset or some other aspect of the problem, such as the
    number of covariates. On large problems, Stata/MP with **2 cores
    runs half of Stata's commands at least 1.7 times faster** than on a
    single core. With **4 cores, the same commands run at least 2.4
    times faster** than on a single core. ***NOTE: This is already a
    drop to 60% efficiency on 4 cores.***

    ### **How to Utilize This?**

    This parallelization benefit is **mostly realized in running code in
    batch mode**. If using Stata interactively, Stata is predominantly
    waiting for user input, and so the parallelization gains diminish
    rapidly. If one intends to do intense, focused work for short
    periods of time (up to a few days) and subsequently exit the
    software, choosing multiple cores is fine. But **if you plan to run
    an interactive session over the course of the day or two, please
    select Stata-SE**, as the multiple cores that you have requested are
    reserved only for you and will sit idle during this time, decreasing
    the resources available to other people.

    No additional work is needed for you to utilize the multiple CPU
    cores in your code. Stata will handle this transparently for you.
    But you do need to ensure that you ask the compute grid to reserve
    the cores for your use:

    ### **Using NoMachine (interactive only):**

    From the Applications menu, select the Stata-SE menus for
    single-core or Stata-MP4 menus for 4-core Stata. Under each, select
    the appropriate memory footprint for your work (see [Choosing
    Resources](guidelines-for-choosing-resources.md) ).
    An example screenshot can be see
    [here](http://static.hwpi.harvard.edu/files/styles/os_files_xxlarge/public/hbs_test/files/image02.png).
    The wrapper scripts that drive these menu items include all the
    necessary commands to start Stata with the designated number of CPU
    cores within your session.

    ### **Using the command-line (interactive or batch):**

    Both interactive and batch jobs can started from the command line.

    ``` stata
    # interactive (GUI) Stata-MP4 with 5 GB footprint via the comand line
    bsub -q short_int -n4 -M5G -Is xstata-mp4
     
    # batch Stata-MP4, 35 GB, for 12 hours
    bsub -q long -n 4 -W 12:00 -M35G stata-mp4 -b do myfile.do 
    ```
    
    ### **Explicit Parallelization**

    Explicit parallelization in Stata can be achieved using the
    [parallel
    module](https://github.com/gvegayon/parallel).


For other environments, or if you have any questions, please [contact
RCS](mailto:research@hbs.edu).


## GPU Computing {#gpu-computing}

### About GPU Computing {#about}

A GPU (graphics processing unit) is a processor that is great at
handling specialized computations. We can contrast this to the Central
Processing Unit (CPU), which is great at handling general computations.
CPUs power most of the computations performed on the devices we use
daily.

GPU can be faster at completing tasks than CPU. However, it is not true
for every case. The performance hugely depends on the type of
computation being performed. GPUs are great at tasks that can be run in
parallel \....and are often used for Machine Learning types
of'embarrassingly parallel' tasks (== a huge task can be broken down
into many smaller ones that are completely independent of one another).

\-- Taken and adapted from [Why Deep Learning Uses
GPUs](https://towardsdatascience.com/why-deep-learning-uses-gpus-c61b399e93a0)

The HBSGrid cluster has five [NVIDIA Tesla V100 graphics processing
units
(GPUs)](https://www.nvidia.com/en-gb/data-center/tesla-v100/) attached to one compute node. Computational workflows
that make use of GPUs can see significant speedups in execution time,
though one's code must be written using frameworks that will leverage
these special resources (e.g.
[Tensorflow](https://tensorflow.org/),
[PyTorch](https://pytorch.org/), etc). The GPU node is available for both interactive
and batch sessions.

### Submitting Jobs {#submitting}

To request any GPU resources as a part of your job submission, you must
include the `-gpu` flag and options
and we recommend that you submit to the gpu queue (`-q gpu`). Your job can 
be either for interactive or batch sessions as your work requires.

The easiest route is to use the default GPU configuration,
`-gpu -`. For example:

``` sh
bsub -q gpu -gpu - -Is -M 5G -hl spyder
```

The default GPU options are
`"num=1:aff=no:mode=shared:mps=no:j_exclusive=no"`(with quotes). 
If you wish to do something other than the default, simply indicate the option name and its
preferred value, or supply the whole option string. For example,

``` sh 
# one parameter
bsub -q gpu -gpu "aff=yes" -Is -M 5G spyder
```
OR

``` sh 
# full parameter list
bsub -q gpu -gpu "num=1:aff=yes:mode=shared:mps=no:j_exclusive=no" -Is -M 5G spyder 
```

Again, as with all job submissions, one can specify the parameters on
the command line or include them in a job submission script.

### Common GPU Options and Their Definitions {#common}

The full range of options for use of the GPU resources are documented at
LSF's [Submitting Jobs that Require GPU
Resources](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_gpu/lsf_gpu_submit_jobs.html) page. These five options should handle most use cases
(defaults are in **boldface type**; text below is copied or paraphrased
from the LSF page):

**num= (**default =**1**): The number of GPUs to request. Note that
after your job is dispatched, no matter which GPU one is allocated, the
GPUs will be indexed starting from 0. And for security purposes, we are
enforcing GPU sandboxing via Linux CGROUPS so one cannot use an
incorrect index.

**aff**=**no** \| yes: CPU-GPU affinity. This indicates whether or not
the job should enforce strict GPU-CPU affinity binding. That is, the GPU
allocated is on the same socket (group of CPU cores) as the GPU. This
GPU-CPU affinity translates to higher communication rate, and thus
better performance. If set to no, LSF does not bind the job core on the
CPU socket to the GPU, but does ensure that the job is pinned to one or
more cores (it does not bounce around == less performance) and that
CGROUPs are active (job is sandboxed). NOTE: due to the unusual nature
of the compute node, if you request aff=yes and the node has filled the
lower 48 cores, your job will not dispatch until some of the lower cores
are released. This is due to the fact that the upper 16 cores do not
share the same CPU socket with any GPU. If you wish use
`aff=yes` and are submitting an
interactive job (concerned about immediate job dispatching), we advise
that you use `bhosts | grep -i nod12`{.inline
style="overflow-x: hidden;"} to see how busy the GPU node is.

**mode=shared** \| exclusive_process: The GPU mode when the job is
running, either `shared` or
`exclusive_process`. The
`shared` mode corresponds to the
NVIDIA `DEFAULT` compute mode \--
multiple processes can use the GPU simultaneously. Individual threads of
each process may submit work to the GPU simultaneously. The
`exclusive_process` mode
corresponds to the NVIDIA `EXCLUSIVE_PROCESS`{.inline
style="overflow-x: hidden;"} compute mode \-- the GPU is assigned to
only one process at a time, and individual process threads may submit
work to the GPU concurrently.

**mps=no** \| yes: Enables or disables the NVIDIA Multi-Process Service
(MPS) for the GPUs that are allocated to the job. We are not using this
service at this time. If you have a need for this or feel that it should
be in play, please [contact
RCS](mailto:mailto:research@hbs.edu?subject=gpu%20node%20MIPS%20service)
to consult with us on this.

**j_exclusive=no**\| yes: Specifies whether the allocated GPUs can be
used by other jobs. When the mode is set to `exclusive_process`{.inline
style="overflow-x: hidden;"}, the `j_exclusive=yes`{.inline
style="overflow-x: hidden;"} option is set automatically.

### Further Resources

For more information, please see:

-   [NVidia Telsa V100
    GPUs](https://www.nvidia.com/en-gb/data-center/tesla-v100/)
-   [LSF documentation on GPU resources and
    jobs](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_welcome/lsf_kc_gpu_resources.html)
-   [LSF example job submission
    commands](https://www.ibm.com/support/knowledgecenter/SSWRJV_10.1.0/lsf_gpu/lsf_gpu_example_jobs.html)
