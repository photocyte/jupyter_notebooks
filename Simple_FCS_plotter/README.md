## Simple FCS plotter
This is a Jupyter notebook intended to take one or more .FCS flow cytometry files, and produce a 2D histogram from them.

It is largely just a wrapper around fcsparser https://github.com/eyurtsev/fcsparser

### Author(s): 
Timothy R. Fallon
https://orcid.org/0000-0002-3048-7679

### Version:
2021-07-07, Draft 1

### Confirmed instruments it works with:
- Luminex Muse - https://www.luminexcorp.com/muse-cell-analyzer/ 

### Dependencies
They (and more) are all within the Vagrantfile, but if you'd like to run standalone:
- fcsparser (https://github.com/eyurtsev/fcsparser)
- numpy
- matplotlib
- seaborn

### How to use:
1. Put your .FCS files and the Jupyter notebook in a subordinate directory, e.g. 20210707_Genome_sizing_QC
2. Produce the `Vagrantfile` and spin up the VM with all the dependencies to run the Notebook (See code blocks below, in short: `vagrant up`). 
    - Note: This expects the Vagrantfile to be in the parent directory of the subordinate directory made in step (1)
3. Enter the VM (via `vagrant ssh`), 
4. Startup the `Simple_FCS_plotter.ipynb` Jupyter notebook via Jupyter lab using the `run_jupyter.sh` script. (See 2 code blocks below)
5. Use the Jupyter produced link at 127.0.0.1 (localhost) and port 13337. Should be something like ' http://127.0.0.1:13337/lab?token=400cd49f901b668534443b7bf2a453c36754ee677ebf7c02 '

In short, once you have Vagrant installed, execute:
```
vagrant up ##This will take awhile, as all the dependencies have to get installed
vagrant ssh
cd /vagrant
run_jupyter.sh
```

