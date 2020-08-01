subroutine db_create_statistical_covariance_matrix_by_period_and_hall_i(i,VP1H31,VP1H32,VP2H31,VP2H32,VP3H31,VP3H32)
    use db_data, only: NBIN
    implicit none
    integer :: i
    integer :: P,H
    real(8) :: VP1H31(NBIN,NBIN),VP1H32(NBIN,NBIN)
    real(8) :: VP2H31(NBIN,NBIN),VP2H32(NBIN,NBIN)
    real(8) :: VP3H31(NBIN,NBIN),VP3H32(NBIN,NBIN)
    P=1
        H=1
        call db_statistical_covariance_matrix_P_H_i(i,P,H,VP1H31)
        H=2
        call db_statistical_covariance_matrix_P_H_i(i,P,H,VP1H32)


    P=2
        H=1
        call db_statistical_covariance_matrix_P_H_i(i,P,H,VP2H31)
        H=2
        call db_statistical_covariance_matrix_P_H_i(i,P,H,VP2H32)
    return
end subroutine db_create_statistical_covariance_matrix_by_period_and_hall_i