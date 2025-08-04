---
tags:
    - unzip
    - gunzip
    - uncompress
---

# Extracting Archived/Compressed Files {#uncompress}
On the Grid, there are two sets of system-wide tools for extracting files from an archive/compressed file: `unzip` and `gunzip`.

## unzip
The `unzip` command can be used to extract from common archive formats such as ZIP and RAR. 

To extract all contents to the **current directory**:

| Command        | Example                |
| -----------    | ---------------------- |
| `unzip FILE`   | `unzip data.zip`       |

To only extract all contents to the current directory within a specific subfolder of the archive:

| Command                                    | Example                            |
| ---------------------------------------    | ---------------------------------- |
| `unzip FILE FILENOEXTENSION/SUBFOLDER/*`   | `unzip data.zip data/2005/*`       |

To extract contents to a specific folder: 

| Command                      | Example                                                  |
| ---------------------------- | -------------------------------------------------------- |
| `unzip FILE -d DESTINATION`  | `unzip ziptest.zip -d '/export/home/dor/jharvard'`       |


Full documentation can be found here: <https://linux.die.net/man/1/unzip>

## gunzip
`gunzip` is meant to be used on files ending with .gz or .z. <br>

To extract a file into the current directory and **not save the original compressed file**:

| Command        | Example                             |
| -----------    | ----------------------------------- |
| `gunzip FILE`   | `gunzip yourdocument.docx.gz`      |


To extract a file into the current directory and **keep both the compressed and decompressed file**:

| Command                                  | Example                                                  |
| -------------------------------------    | -------------------------------------------------------- |
| `gunzip < ORIGINALFILE > EXTRACTEDFILE`  | `gunzip < yourdocument.docx.gz > yourdocument.docx`      |


Full documentation can be found here: <https://linux.die.net/man/1/gunzip>
