#!/bin/bash -x
# 3D interpolate downloaded merra2 data to ICS
#module purge  # need gfortran for xesmf interpolation
#conda activate my_3.11
init_folder=$1

PDY=$2  #YYYYMMDDHH
nowdate=${PDY:0:8}
utc=${PDY:8:2}
for i in {1..6}; do
./merra2_to_ufs_cubesphere.py -m MERRA2_400.inst3_3d_aer_Nv.$nowdate.nc4 \
  -c $init_folder/gfs_ctrl.nc \
  -t $init_folder/gfs_data.tile$i.nc \
  -utc $utc -r C96
done
