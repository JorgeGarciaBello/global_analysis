real(8) function db_M_Total_ij(t13,dmee,i,j,Nbar_i,U)
!real(8) function db_M_Total_ij(t13,dmee,i,j,rand_w_i,Nbar_i,U)
    use db_data, only: num_experiments, N_obs_n, N_obs_f, bkg_t_N_n, bkg_t_N_f,  &
                       rand_Nacc_n, rand_Nacc_f, rand_Nalpha_n, rand_Nalpha_f, rand_Namc_n, rand_Namc_f, &
                       rand_NLiHe_n, rand_NLiHe_f, rand_Nfastn_n, rand_Nfastn_f
    implicit none
    real(8) :: t13,dmee    
    integer :: i,j
    real(8) :: rand_w_i(156,num_experiments)
    real(8) :: U(156)
    real(8) :: Nbar_i(156,num_experiments)
    integer :: k    
    ! Obtención de vectores Nbar
    !!$omp parallel do
    !do k=1,num_experiments        
    !    Nbar_i(k)= N_obs_f(i) - (  rand_w_i(i,k)*( N_obs_n(i)-(rand_Nacc_n(i,k)+rand_Nalpha_n(i,k)+rand_Namc_n(i,k)+ &
    !                                                           rand_NLiHe_n(i,k)+rand_Nfastn_n(i,k)                  &
    !                                                          )                                                      &
    !                                             )                                                                   &
    !                                             +                                                                   &
    !                                             ( rand_Nacc_f(i,k)+rand_Nalpha_f(i,k)+rand_Namc_f(i,k)+             &
    !                                               rand_NLiHe_f(i,k)+rand_Nfastn_f(i,k)                              &
    !                                             )                                                                   &
    !                            )  
    !    Nbar_j(k)= N_obs_f(j) - (  rand_w_i(j,k)*( N_obs_n(j)-(rand_Nacc_n(j,k)+rand_Nalpha_n(j,k)+rand_Namc_n(j,k)+ &
    !                                                           rand_NLiHe_n(j,k)+rand_Nfastn_n(j,k)                  &
    !                                                           )                                                     &
    !                                             )                                                                   &
    !                                             +                                                                   &
    !                                             ( rand_Nacc_f(j,k)+rand_Nalpha_f(j,k)+rand_Namc_f(j,k)+             &
    !                                               rand_NLiHe_f(j,k)+rand_Nfastn_f(j,k)                              &
    !                                             )                                                                   &
    !                            )
    !enddo
    !!$omp end parallel do
    ! OBtención del promedio de los vectores Nbar
    !Navg_i=sum(Nbar_i)/real(num_experiments)
    !Navg_j=sum(Nbar_j)/real(num_experiments)
    ! Obtención la entrada ij de la matriz M de la incertidumbre en Accidental-Background
    db_M_Total_ij=0.0d0
    do k=1,num_experiments
        db_M_Total_ij=db_M_Total_ij+(  Nbar_i(i,k) - U(i)  )  *  ( Nbar_i(j,k) - U(j) )
    enddo     

    db_M_Total_ij=db_M_Total_ij/real(num_experiments)
    return
end function db_M_Total_ij