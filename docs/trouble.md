## Stata Temporary Files and Stata Tmp {#stata-temporary-files-and-stata-tmp}

If there is not enough disk space available in `/tmp` *Stata* may give you an error message that looks like this:

```
insufficient disk space
r(699);
```

As a first step you can try deleting any files you have in `/tmp` and see if that gives you enough space.
You may also be able to change your *Stata* code to reduce the amount of temp space needed -- `preserve` 
and `restore` commands are often the cause.

If you cannot get enough space on `/tmp` you can tell *Stata* to store temporary files in a 
[Scratch storage](storage.md#scratch-storage) directory on the HBS Grid.

!!! example "Use scratch storage for *Stata* temp files"

    1. Create a directory under `/export/scratch` and ensure that the 
       [permissions are set correctly](worksafe.md).
    2. Set the `STATATMP` environment variable to the directory you created
       in step one. Use [launcher options](menulaunch.md#pre-submission-command)
       if running from the destkop, or [set this variable from the command line](https://man.archlinux.org/man/export.1p).
    3. Start *Stata* as usual after setting the `STATATMP` environment variable as described in steps 1-2 above.

More details about this issue can be found in the [Stata FAQ](https://www.stata.com/support/faqs/data-management/statatmp-environment-variable/).
