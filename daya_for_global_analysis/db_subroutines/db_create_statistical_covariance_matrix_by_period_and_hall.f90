subroutine db_create_statistical_covariance_matrix_by_period_and_hall(VP1H31,VP1H32,VP2H31,VP2H32,VP3H31,VP3H32)
    use db_data, only: NBIN
    implicit none
    real(8) :: VP1H31(NBIN,NBIN),VP1H32(NBIN,NBIN),VH13(NBIN,NBIN)
    real(8) :: VP2H31(NBIN,NBIN),VP2H32(NBIN,NBIN)
    real(8) :: VP3H31(NBIN,NBIN),VP3H32(NBIN,NBIN)
    !real(8) :: VP3H31(NBIN,NBIN),VP3H32(NBIN,NBIN),VH33(NBIN,NBIN)

    !call db_statistical_covariance_matrix_H1_6AD(VP1H31)
    !call db_statistical_covariance_matrix_H2_6AD(VP1H32)
    !VP1H31=0.2d0*VP1H31;
    !VP1H32=0.444d0*VP1H32;
    call db_statistical_covariance_matrix_H3_6AD(VP1H31)
    call db_statistical_covariance_matrix_H3_6AD(VP1H32)

    !call db_statistical_covariance_matrix_H1_8AD(VH12)
    !call db_statistical_covariance_matrix_H2_8AD(VH22)
    call db_statistical_covariance_matrix_H3_8AD(VP2H31)
    call db_statistical_covariance_matrix_H3_8AD(VP2H32)

    !call db_statistical_covariance_matrix_H1_7AD(VH13)
    !call db_statistical_covariance_matrix_H2_7AD(VH23)    
    !call db_statistical_covariance_matrix_H3_7AD(VH33)

    return
end subroutine db_create_statistical_covariance_matrix_by_period_and_hall