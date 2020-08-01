subroutine db_get_signal_covariance_matrix_by_period_and_hall(VSP1H1,VSP1H2,VSP1H3,VSP2H1,VSP2H2,VSP2H3,VSP3H1,VSP3H2,VSP3H3)
    use db_data, only:NBIN,n=>num_experiments
    implicit none
    real(8) :: VSP1H1(NBIN,NBIN),VSP1H2(NBIN,NBIN),VSP1H3(NBIN,NBIN)
    real(8) :: VSP2H1(NBIN,NBIN),VSP2H2(NBIN,NBIN),VSP2H3(NBIN,NBIN)
    real(8) :: VSP3H1(NBIN,NBIN),VSP3H2(NBIN,NBIN),VSP3H3(NBIN,NBIN)
    real(8) :: data(NBIN),data_out(NBIN,n)
    integer :: P,H
    ! 6AD-Period: Periodo 1 de toma de datos
    P=1    
    call db_create_signal_covariance_matrix_by_period_and_hall(P,1,VSP1H1)
    call db_create_signal_covariance_matrix_by_period_and_hall(P,2,VSP1H2)
    call db_create_signal_covariance_matrix_by_period_and_hall(P,3,VSP1H3)    
    call db_write_matrix(NBIN,VSP1H1,'signal_covariance_matrix_H1_6AD')
    call db_write_matrix(NBIN,VSP1H2,'signal_covariance_matrix_H2_6AD')
    call db_write_matrix(NBIN,VSP1H3,'signal_covariance_matrix_H3_6AD')
    ! 8AD-Period: Periodo 2 de toma de datos
    P=2
    call db_create_signal_covariance_matrix_by_period_and_hall(P,1,VSP2H1)
    call db_create_signal_covariance_matrix_by_period_and_hall(P,2,VSP2H2)
    call db_create_signal_covariance_matrix_by_period_and_hall(P,3,VSP2H3)
    call db_write_matrix(NBIN,VSP2H1,'signal_covariance_matrix_H1_8AD')
    call db_write_matrix(NBIN,VSP2H2,'signal_covariance_matrix_H2_8AD')
    call db_write_matrix(NBIN,VSP2H3,'signal_covariance_matrix_H3_8AD')    
    ! 7AD-Period: Periodo 3 de toma de datos
    P=3
    call db_create_signal_covariance_matrix_by_period_and_hall(P,1,VSP3H1)
    call db_create_signal_covariance_matrix_by_period_and_hall(P,2,VSP3H2)
    call db_create_signal_covariance_matrix_by_period_and_hall(P,3,VSP3H3)
    call db_write_matrix(NBIN,VSP3H1,'signal_covariance_matrix_H1_7AD')
    call db_write_matrix(NBIN,VSP3H2,'signal_covariance_matrix_H2_7AD')
    call db_write_matrix(NBIN,VSP3H3,'signal_covariance_matrix_H3_7AD')
    return
end subroutine db_get_signal_covariance_matrix_by_period_and_hall