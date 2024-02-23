#! /bin/bash

## This script copies initial mri data for each study from the specific NiChart folder in prj dir

in_dir='../../input/data/NiChart_Studies_Clinical_Data'
out_dir='../../output/clinical_data'

mkdir -pv $out_dir

for ll in `ls -1 ${in_dir} | cut -d/ -f1`; do
  if [ -d ${out_dir}/${ll} ]; then
    echo "Study already copied, skip ..."
    echo "WARNING: Remove folder and rerun to update data: ${out_dir}/${ll}"
  else
    echo "Copy data for: $ll"
    cp -r ${in_dir}/${ll} ${out_dir}/
  fi
done

	       
