#!/usr/bin/env python3

import click
import os
import subprocess

#If a line has been removed, then remove that file

#The issue is that when removing a line, the editor doesn't add a new line to the end of the file
#What ends up happening is that all the filenames get shifted by 1 :/
#HOW TO FIX?

ls = os.listdir()
# get the list of files

edited = click.edit("\n".join(ls))
# add filenames to the text buffer

if edited is not None:
    out = edited.split("\n")
    quoted = []
    cmd = []

    for f1,f2 in zip(ls, out):
        #validating spaces for printing
        orig = f"\"{f1}\""
        new  = f"\"{f2}\""
        
        if f2 == "" or f2 == None:
            quoted.append(["rm", "-irv", orig])
            cmd.append(["rm", "-irv", f1])
        elif f1 != f2:
        # transform into mv commands
            quoted.append(["mv", "-iv", orig, new])
            cmd.append(["mv", "-iv", f1, f2])

    click.echo("\n".join([" ".join(l) for l in quoted]))
    click.echo("Continue [yn]", nl=False)
    c = click.getchar()
    click.echo()
    
    if c == "y":
        for line in cmd:
            subprocess.run(line)
    elif c == "n":
        click.echo("Aborted!")
    else:
        click.echo("Invalid input :(")

else:
    click.echo("No changes.")


