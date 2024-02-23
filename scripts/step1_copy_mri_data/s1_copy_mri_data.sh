#! /bin/bash

## This script copies initial mri data for each study from the specific NiChart folder in prj dir

in_list='../../input/lists/nichart_studies_cbica_path_v1.1.csv'
out_dir='../../output/mri_data'

for ll in `sed 1d $in_list`; do
    std=`echo $ll | cut -d, -f1`
    prjpath=`echo $ll | cut -d, -f2`
    nichartpath=`echo $ll | cut -d, -f3`
    
    echo; echo "Copying data for project: ${std}"

    
    out_std=${out_dir}/${std}
        
    if [ -e ${out_std} ]; then
            echo "Study already copied, skip ..."
            echo "WARNING: Remove folder and rerun to update data: $out_std"            
    else
        mkdir -pv $out_std
        if [ -e $nichartpath ]; then
            for fname in `find $nichartpath -name "*.csv"`; do
                cp -v $fname ${out_std}/
            done
        fi
    fi
done
        
