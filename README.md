# C3_GuineaPig_studies
Simulations of beam-beam interactions for the Cool Copper Collider using GUINEA-PIG

This repository contains steering files and shell scripts for multiple GUINEA-PIG runs, as well as 90 bunch crossings worth of output files for ILC-250 and ILC-500.


## GuineaPig Installation and Running 

Instructions for installing GuineaPig are in the [official GuineaPig repository](https://gitlab.cern.ch/clic-software/guinea-pig)

The basic commands are also given below: 

    git clone ssh://git@gitlab.cern.ch:7999/clic-software/guinea-pig.git .
    ./configure -prefix=[path_to_your_build_directory]
    make
    make install


Run GP like this:

    ./build/bin/guinea --acc_file testing/acc_ILC.dat ILC_250 Jim_pars_Aug2023 output/test_ILC_250.ref


You can also use the GP_multiple_runs_lumi_opt.sh script to run multiple runs with different seeds and/or for different colliders (always from the top directory):

    source scripts/GP_multiple_runs_lumi_opt.sh

### Tips for shell scripts

- The shell scripts work by modifying the input .dat files and rerunning GUINEA-PIG for different accelerator and/or simulation parameters.
- The scripts have been written for macOS systems. If you are using Linux, you probably have to modify the sed commands. Take a look at the shell scripts to see if you can do it.
- Make sure the output folders you are pointing to inside the shell scripts have been created before running the scripts.



## Files for ILC



Output files for ILC:



- **lumi_ee_ILC_250_rndm_seed_\*.out** : output file for luminosity spectrum
- **test_ILC_250_seed_\*.ref  : output** summary file with information on luminosity, coherent & incoherent pair production  etc.
- **testILC_250_pairs_rndm_seed_\*.dat** : output file with  produced incoherent pairs

More information on the structure of those files in the GuineaPig manual [here](https://gitlab.cern.ch/clic-software/guinea-pig/-/blob/master/doc/GuineaPigManual.pdf?ref_type=heads).


