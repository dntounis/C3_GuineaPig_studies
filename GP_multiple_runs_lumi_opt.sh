#!/bin/bash

# Rules for seeds: 6 numbers, don't start with zero!


random_seeds=(509004 184286 508563 124719 224495 512849 167645 391431 259414 419344)


collider=("ILC_250" "ILC_500")



for  element2 in "${collider[@]}"
do
    for element1 in "${random_seeds[@]}"
    do


    seed=$element1
    collider=$element2
    echo $seed
    echo $collider

    #sed -i ''  "s/rndm_seed=$seed_old/rndm_seed=$seed/g" testing/acc_lumi_opt.dat
    gsed -i  "s/rndm_seed=[0-9]\+/rndm_seed=$seed/g"  testing/acc_lumi_opt.dat	

    # sed needs single empty quotes for -i to work on mac, probably not the case in linux!

    ./build/bin/guinea   --acc_file testing/acc_ILC.dat  "$collider" Jim_pars_Aug2023 output/"$collider"/test_"$collider"_seed_"$seed".ref
 
    mv pairs.dat output/"$collider"/test"$collider"_pairs_rndm_seed_"$seed".dat
    mv lumi.ee.out output/"$collider"/lumi_ee_"$collider"_rndm_seed_"$seed".out


    done

    

done
