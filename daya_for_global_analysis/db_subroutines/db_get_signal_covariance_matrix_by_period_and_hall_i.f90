subroutine db_get_signal_covariance_matrix_by_period_and_hall_i(i,VSP1H31,VSP1H32,VSP2H31,VSP2H32,VSP3H31,VSP3H32)
    use db_data, only:NBIN,n=>num_experiments
    implicit none
    integer :: i
    real(8) :: VSP1H31(NBIN,NBIN),VSP1H32(NBIN,NBIN)
    real(8) :: VSP2H31(NBIN,NBIN),VSP2H32(NBIN,NBIN)
    real(8) :: VSP3H31(NBIN,NBIN),VSP3H32(NBIN,NBIN)    

    integer :: P
    ! 6AD-Period: Periodo 1 de toma de datos
    P=1    
    call db_create_signal_covariance_matrix_by_period_and_hall_f_n_i(i,P,3,1,VSP1H31)
    call db_create_signal_covariance_matrix_by_period_and_hall_f_n_i(i,P,3,2,VSP1H32)
    call db_write_matrix(NBIN,VSP1H31,'signal_covariance_matrix_H31_6AD_fardata')
    call db_write_matrix(NBIN,VSP1H31,'signal_covariance_matrix_H32_6AD_fardata')
    ! 8AD-Period: Periodo 2 de toma de datos
    !P=2
    !call db_create_signal_covariance_matrix_by_period_and_hall_f_n_i(i,P,3,1,VSP2H31)
    !call db_create_signal_covariance_matrix_by_period_and_hall_f_n_i(i,P,3,2,VSP2H32)
    
   
    ! 7AD-Period: Periodo 3 de toma de datos
    !P=3
    !call db_create_signal_covariance_matrix_by_period_and_hall_f_n_i(i,P,3,1,VSP3H31)
    !call db_create_signal_covariance_matrix_by_period_and_hall_f_n_i(i,P,3,2,VSP3H32)
    return
end subroutine db_get_signal_covariance_matrix_by_period_and_hall_i