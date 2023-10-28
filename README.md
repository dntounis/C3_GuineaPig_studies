# C3_GuineaPig_studies
Simulations of beam-beam interactions for the Cool Copper Collider using GuineaPig

This repository contains the steering files with the ILC-250 and ILC-500 beam configuration as well as 90 bunch crossings worth of output files.


## GuineaPig Installation and Running 

Instructions for installing GuineaPig are in the [official GuineaPig repository](https://gitlab.cern.ch/clic-software/guinea-pig)

The basic commands are also given below: 

    git clone ssh://git@gitlab.cern.ch:7999/clic-software/guinea-pig.git .
    ./configure -prefix=[path_to_your_build_directory]
    make
    make install


Run GP like this:

    ./build/bin/guinea --acc_file testing/acc_ILC.dat ILC_250 Jim_pars_Aug2023 output/test_ILC_250.ref


You can also use the GP_multiple_runs_lumi_opt.sh script to run multiple runs with different seeds and/or for different colliders:

    source GP_multiple_runs_lumi_opt.sh


## Files for ILC



Output files for ILC:



- **lumi_ee_ILC_250_rndm_seed_\*.out** : output file for luminosity spectrum
- **test_ILC_250_seed_\*.ref  : output** summary file with information on luminosity, coherent & incoherent pair production  etc.
- **testILC_250_pairs_rndm_seed_\*.dat** : output file with  produced incoherent pairs

More information on the structure of those files in the GuineaPig manual [here](https://gitlab.cern.ch/clic-software/guinea-pig/-/blob/master/doc/GuineaPigManual.pdf?ref_type=heads).


