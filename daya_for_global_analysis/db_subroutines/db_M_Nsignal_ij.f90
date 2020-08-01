real(8) function db_M_Nsignal_ij(t13,dmee,i,j)
    use db_data, only: num_experiments, N_obs_n, N_obs_f, bkg_t_N_n, bkg_t_N_f, rand_w_i
    implicit none
    real(8) :: t13, dmee    
    integer :: i,j    
    real(8) :: Nbar_i(num_experiments)
    real(8) :: Nbar_j(num_experiments)    
    real(8) :: Navg_i,Navg_j
    integer :: k    
    ! Obtención de vectores Nbar
    do k=1,num_experiments        
        Nbar_i(k)= N_obs_f(i)- (  rand_w_i(i,k)*(N_obs_n(i)-bkg_t_N_n(i)) + bkg_t_N_f(i)  )
        Nbar_j(k)= N_obs_f(j)- (  rand_w_i(j,k)*(N_obs_n(j)-bkg_t_N_n(j)) + bkg_t_N_f(j)  )
    enddo
    ! OBtención del promedio de los vectores Nbar
    Navg_i=sum(Nbar_i)/real(num_experiments)
    Navg_j=sum(Nbar_j)/real(num_experiments)
    ! Obtención la entrada ij de la matriz M de la incertidumbre en Accidental-Background
    db_M_Nsignal_ij=0.0d0
    do k=1,num_experiments
        db_M_Nsignal_ij=db_M_Nsignal_ij+(Nbar_i(k)-Navg_i)*(Nbar_j(k)-Navg_j)
    enddo     

    db_M_Nsignal_ij=db_M_Nsignal_ij/real(num_experiments)
    return
end function db_M_Nsignal_ij