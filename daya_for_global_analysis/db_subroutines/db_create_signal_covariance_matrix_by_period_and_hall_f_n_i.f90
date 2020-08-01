
! i es el contador respecto al grid
! P es el número del periodo de colecta de datos (1,2,3)
! Hf es el número de la sala considerada como Far, debe ser 3
! Hn es el número de la sala considerada como Near, debe ser: 1 ó 2
! V es la matriz de covarianza entre salas experimentales

subroutine db_create_signal_covariance_matrix_by_period_and_hall_f_n_i(i,P,Hf,Hn,V)
    use db_data, only:NBIN,n=>num_experiments
    implicit none
    integer :: i,P,Hf,Hn,V(NBIN,NBIN)
    
    real(8) :: data_near(NBIN,n), data_far(NBIN,n)

    call db_creta_Vdr_data(n,Hn,Hf,P,data_near,data_far)      ! Obtine los datos en número de eventos por periodo y por sala experimental    
    call db_create_signal_covariance_matrix(V,Hn,Hf,P,data_far,i,data_near)
    return
end subroutine db_create_signal_covariance_matrix_by_period_and_hall_f_n_i