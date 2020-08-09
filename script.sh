#!/bin/bash

#gfortran	settings/*.f90 daya_for_global_analysis/db_subroutines/*.f90 daya_for_global_analysis/*.f90 double_chooz_for_global_analysis/dc_subroutines/*.f90 double_chooz_for_global_analysis/*.f90 reno_for_global_analysis/reno_subroutines/*.f90 reno_for_global_analysis/*.f90  main_global.f90 
#gfortran	-O3 -w  -fopenmp settings/*.f90 daya_for_global_analysis/db_subroutines/*.f90  tools/*.f* double_chooz_for_global_analysis/dc_subroutines/*.f90 double_chooz_for_global_analysis/*.f90 reno_for_global_analysis/reno_subroutines/*.f90 reno_for_global_analysis/*.f90  main_global.f90  -L /usr/local/lib -llapack -lblas
gfortran	-O3 -w   settings/*.f90 daya_for_global_analysis/db_subroutines/*.f90  tools/*.f* double_chooz_for_global_analysis/dc_subroutines/*.f90 double_chooz_for_global_analysis/*.f90 reno_for_global_analysis/reno_subroutines/*.f90 reno_for_global_analysis/*.f90  main_global.f90  -L /usr/local/lib -llapack -lblas