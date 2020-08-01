real(8) function db_ji_cuadrada(t13,dmee)
    use db_data, only: NBIN, PD
    implicit none
    real(8) :: t13, dmee    
    real(8) :: V(NBIN*2*PD,NBIN*2*PD)
    real(8) :: rand_W_k(156)
    real(8) :: N_i(156)
    integer :: i,j
    real(8) :: chi
    real ::    t1,t2

    db_ji_cuadrada=0.0
    print*, 'You are in db_ji_cuadrada'
    call cpu_time(t1)
    call db_generate_weight_w_array(t13,dmee,rand_W_k)
    call cpu_time(t2)
    print*, 'db_generate_weight_w_array: ', t2-t1

    call cpu_time(t1)
    call db_create_M_stat_signal_bkg(t13,dmee,rand_W_k,V)
    call cpu_time(t2)
    print*, 'db_create_M_stat_signal_bkg: ', t2-t1

    call cpu_time(t1)
    call db_create_vectors_N(t13,dmee,rand_W_k,N_i)
    call cpu_time(t2)
    print*, 'db_create_vectors_N: ', t2-t1


    call cpu_time(t1)
    chi=0.0d0
    do i=1, NBIN*2*PD                                            ! (# de biines)*(# de combinaciones FAR/NEAR)*(# de periodos de colecta de datos)        
        do j=1,NBIN*2*PD                                        ! (# de biines)*(# de combinaciones FAR/NEAR)*(# de periodos de colecta de datos)            
            chi=chi+N_i(j)*V(i,j)*N_i(i)
        enddo
    enddo
    call cpu_time(t2)
    print*,'chi', chi
    print*, 'JI_cuadrada: ', t2-t1

    return
end function db_ji_cuadrada