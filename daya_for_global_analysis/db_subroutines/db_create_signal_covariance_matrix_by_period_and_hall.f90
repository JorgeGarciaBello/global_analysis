subroutine db_create_signal_covariance_matrix_by_period_and_hall(P,H,V)
    use db_data, only:NBIN,n=>num_experiments
    implicit none
    integer :: P,H
    real(8) :: V(NBIN,NBIN)

    real(8) :: data(NBIN)
    real(8) :: data_out(NBIN,n)
    real(8) :: data_near(NBIN,n) ! Este arreglo no se utiliza, pero hay que mandarlo.
    integer :: m
    
    call db_initial_data_for_signal_matrix(P,H,data)
    call db_create_signal_data(n,data,data_out)    
    call db_create_signal_covariance_matrix(V,data_out,m,data_near)
    return
end subroutine db_create_signal_covariance_matrix_by_period_and_hall