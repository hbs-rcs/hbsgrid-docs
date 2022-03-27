
## SAS/CONNECT


SAS/CONNECT is an application that allows you to connect a SAS session
running on your desktop to SAS on the HBSGrid.

SAS/CONNECT offers two types of services, which both use desktop SAS
Windows as the front end (note: the server has SAS 9.2, but users may
use either PC SAS version 9.3 or 9.4 to connect to SAS 9.2 on the
server):

  ------------------------------------------------------------------------ -----------------------------------------------------------------------
  Compute Services (CS)                                                    Remote Library Services (RLS)
  Give user access to all of the computing resources on the remote host.   Give user access to all the data regardless of where they are stored.
  Data processing takes place in the remote server                         Data processing takes place in the local desktop
  Best to use if the amount of data involved is large                      Best to use if the amount of data involved is small to medium
  ------------------------------------------------------------------------ -----------------------------------------------------------------------

??? note "How to Make a Connection with SAS/CONNECT"
    
    ###make_connection

    To make a CS connection to the HBSGrid, which allows you to conduct
    all computing on the cluster, it is most convenient to use a .scr
    script to start a link. The script is a file on the local system
    containing special SAS statements that control the connection. This
    script is called \'sasconnect.scr\' in SAS version 9.3, and
    \'tcpunix.scr\' in SAS version 9.4 and can be found in the following
    locations:

    `filename rlink "C:\Program Files\SASHome\SASFoundation\9.3\connect\saslink\sasconnect.scr";`

    `filename rlink "C:\Program Files\SASHome2\SASFoundation\9.4\connect\saslink\tcpunix.scr";`

    Once you have located the script file, the general steps to
    establish and terminate the link are as follows:

    -   Start a SAS session on your local operating system (desktop or
        laptop)
    -   In the PROGRAM EDITOR, type in the following:

    ``` sas
    %let rmt=sasconnect.hbs.edu 7550;
    options comamid=tcp remote=rmt;
    filename rlink "c:\xx\..\xx\sasconnect[or tcpunix].scr";
    signon connectstatus=yes script=rlink;
    ```

    Be sure to use the correct path for the version of SAS 9 you are
    using.

    When SAS reads the signon statement you will be asked for your
    username and password. Successful execution of the connection script
    will be indicated in the log window. You can now use SAS/CONNECT to
    remote submit SAS programs for execution on Unix or use RLS to
    access a file from Unix and process it locally. Before executing SAS
    code, you must submit the following command:

    `rsubmit;`

    When you have finished using SAS/CONNECT, end the remotely submitted
    SAS code and terminate the connection: while the editor window is
    active:

    ``` sas
    endrsubmit;
    signoff;
    ```

    After the SIGNOFF command executes successfully, a message in the
    LOG window will indicate that the link has been terminated.

??? note "SAS/CONNECT Examples"
    
    ### **Example 1. Compute Services: Submit program remotely to UNIX**
    ``` sas
    /**********************************************************************/;
    /* Compute Services: Sample script to submit program remotely to UNIX */;
    /**********************************************************************/;
     
    /* Set up the remote access environment: */
    /* - Define the remote session in UNIX (=> rmt); */
    /* - Specify the communication access method (=> comamid); */
    /* - Specify a login script (-> filename rlink); */
     
    %let rmt=sasconnect.hbs.edu 7550;
    options comamid=tcp remote=rmt;
     
    filename rlink "C:\Program Files\SASHome2\SASFoundation\9.4\connect\saslink\sasconnect.scr"
     
    /* If you use PC SAS 9.3, the above path will be: */
    * filename rlink "C:\Program Files\SASHome\SASFoundation\9.3\connect\saslink\sasconnect.scr"
     
    /* Establish the connection using the UNIXTCP.SCR script file */
    signon connectstatus=yes script=rlink;
     
    /* After SAS reads the signon statement and executes successfully, the LOG window will indicate that the link is established. You will be prompted for the UNIX username and password. The commands between rsubmit and endrsubmit are passed to UNIX and executed there. The libnames and datasets are all relative to the remote server. For example, if you want to define a new libname on the server, you must use syntax appropriate to the server. Data placed in the temporary work space reside in the remote library and will be lost after the endrsubmit statement. */
     
    rsubmit;
     
    libname rmtdata '/export/home/dor/jdoe'; * REPLACE PATH AND USERNAME WITH YOUR OWN ;
     
    data rmtdata.test;
    array x{125};
    do i=1 to 125;
    x{i}=ranuni(0);
    end;
    do i=1 to 1000;
    output;
    end;
    run;
     
    proc print data=rmtdata.test(obs=10);
    run;
     
    endrsubmit;
    signoff;
    ````

    ### **Example 2. Compute Services: Submit program remotely to WRDS**

    ``` sas
    /**********************************************************************/;
    /* Compute Services: Sample script to submit program remotely to WRDS */
    /**********************************************************************/;
     
    /* Set up the remote access environment: */
    /* - Define the remote session in WRDS (=> wrds); */
    /* - Specify the communication access method (=> comamid); */
     
    %let wrds=wrds.wharton.upenn.edu 4016;
    options comamid=TCP remote=WRDS;
    signon username=_prompt_;
     
    /* After SAS reads the signon statement and executes successfully, the LOG window will indicate that the link is established. You will be prompted for the WRDS username and password. The commands between rsubmit and endrsubmit are passed to WRDS and executed there. The libnames and datasets are all relative to the remote server. For example, if you want to define a new libname on the server, you must use syntax appropriate to the server. Data placed in the temporary work space reside in the remote library and will be lost after the endrsubmit statement.*/
     
    rsubmit;
     
    libname crsp '/wrds/crsp/sasdata';
     
    proc means data=crsp.dport1;
    run;
     
    proc freq data=crsp.dport2;
    tables permno / out=dport2;
    run;
     
    proc print data=dport2;
    run;
     
    endrsubmit;
    signoff; 
    ```
    
    ### **Example 3. Remote Library Services: Access remote data to process locally**
    ``` sas
    /*******************************************************************/;
    /* RLS: Sample script to access remote data and process it locally */
    /*******************************************************************/;
     
    /* Set up the remote access environment: */
    /* - Define the remote session in UNIX (=> rmt); */
    /* - Specify the communication access method (=> comamid); */
    /* - Specify a login script (-> filename rlink); */
     
    %let rmt=sasconnect.hbs.edu 7550;
    options comamid=tcp remote=rmt;
     
    filename rlink "C:\Program Files\SASHome2\SASFoundation\9.4\connect\saslink\tcpunix.scr"
     
    /* If you use PC SAS 9.3, the above path will be: */
    * filename rlink "C:\Program Files\SASHome\SASFoundation\9.3\connect\saslink\sasconnect.scr"
     
    /* Establish the connection using the UNIXTCP.SCR script file */
    signon connectstatus=yes script=rlink;
     
    /* After SAS reads the signon statement and executes successfully, the LOG window will indicate that the link is established. You will be prompted for the UNIX username and password*/
     
    /* Define remote library. The value for server is the same as the remote session id */
    * PUT IN YOUR HOME DIRECTORY AND LOGIN NAME ;
    libname rmtdata '/export/home/homedir/username' server=rmt;
     
    /* Define local drive location -- modify as necessary */
    libname lcldata 'C:\Documents and Settings\hbsuser\My Documents\My SAS Files\';
     
    /* Proc Freq on the remote data is processed locally */
    proc freq data=rmtdata.salesdat;
    tables type;
    run;
     
    /* The WHERE statement moves only the type BP observations and processes them locally. It avoids moving every observation from the remote host and filters out the the unneeded observations*/
    data lcldata.subsetdata;
    set rmtdata.salesdat;
    where type='BP';
    proc print;
    run;
     
    signoff; 
    ```
    If you would like assistance with SAS/CONNECT, please contact
    research@hbs.edu.
