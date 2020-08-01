subroutine DC_generate_vectors_U(t13,dmee,Nbar_i,U,e_a,e_b,e_c)
    use types
    use DC_settings, only: NBIN, num_experiments
    use DC_data, only: N_n_obs,N_f_obs,rand_Nbkgtotal
    implicit none
    real(8) :: t13,dmee
    real(8) :: rand_w_i(NBIN,num_experiments)    
    real(8) :: Nbar_i(NBIN,num_experiments)
    real(8) :: U(NBIN)
    integer :: i,k
    real(dp) :: e_a,e_b,e_c
    ! Obtención de vectores Ubar
    call DC_generate_weight_w_systematic_array(t13,dmee,rand_w_i,e_a,e_b,e_c)
    do i=1,NBIN
        !!$omp parallel do
        do k=1,num_experiments
            !Nbar_i(i,k)= N_f_obs(i) - (  rand_w_i(i,k)*N_n_obs(i)  )
            Nbar_i(i,k)= N_f_obs(i) - (  rand_w_i(i,k)*( N_n_obs(i) + rand_Nbkgtotal(i,1,1,k)   &
                                                                    + rand_Nbkgtotal(i,1,2,k)   &
                                                                    + rand_Nbkgtotal(i,1,3,k) ) &
                                       + rand_Nbkgtotal(i,2,1,k)+rand_Nbkgtotal(i,2,2,k)+rand_Nbkgtotal(i,2,3,k) )
        enddo
        !!$omp end parallel do
        ! OBtención del promedio de los vectores Nbar
        U(i)=sum(Nbar_i(i,:))/real(num_experiments)
    enddo    
    return
end subroutine DC_generate_vectors_U