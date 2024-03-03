#!/bin/bash

# Rules for seeds: 6 numbers, don't start with zero!

#random_seeds=(509004 184286 508563 124719 224495 512849 167645 391431 259414 419344)
random_seeds=(509004 184286)

collider=("C3_250_PS1" "C3_250_PS2")

n_m=("1000" "10000" "100000" "300000")
n_x=("128" "256" "512" "1024")
n_y=("128" "256" "512" "1024")


for element5 in "${n_y[@]}"
do
    for element4 in "${n_x[@]}"
    do
    for element3 in "${n_m[@]}"
    do
        for  element2 in "${collider[@]}"
        do
            for element1 in "${random_seeds[@]}"
            do

                seed=$element1
                collider=$element2
                n_m=$element3
                n_x=$element4
                n_y=$element5

                echo $seed
                echo $collider
                echo $n_m
                echo $n_x
                echo $n_y

                # sed needs single empty quotes for -i to work on mac, typically not the case in linux!

                #sed -i ''  "s/rndm_seed=$seed_old/rndm_seed=$seed/g" testing/acc_lumi_opt.dat  #for linux
                gsed -i  "s/rndm_seed=[0-9]\+/rndm_seed=$seed/g"  testing/acc_lumi_opt.dat	    #for mac
                gsed -i  "s/n_m=[0-9]\+/n_m=$n_m/g"  testing/acc_lumi_opt.dat
                gsed -i  "s/n_x=[0-9]\+/n_x=$n_x/g"  testing/acc_lumi_opt.dat
                gsed -i  "s/n_y=[0-9]\+/n_y=$n_y/g"  testing/acc_lumi_opt.dat
                
                
                ./build/bin/guinea   --acc_file testing/acc_lumi_opt.dat  "$collider" Jim_pars_Aug2023 output/"$collider"/test_"$collider"_seed_"$seed"_nm_"$n_m"_nx_"$n_x"_ny_"$n_y".ref
            
                mv pairs.dat output/"$collider"/test"$collider"_pairs_rndm_seed_"$seed"_nm_"$n_m"_nx_"$n_x"_ny_"$n_y".dat
                mv lumi.ee.out output/"$collider"/lumi_ee_"$collider"_rndm_seed_"$seed"_nm_"$n_m"_nx_"$n_x"_ny_"$n_y".out


            done
        done
    done
done