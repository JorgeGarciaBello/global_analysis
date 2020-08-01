real(8) function db_M_Namc_ij(t13,dmee,i,j)
    use db_data, only: num_experiments, N_obs_n, N_obs_f, rand_Namc_n, rand_Namc_f, rand_W_k
    implicit none
    real(8) :: t13, dmee    
    integer :: i,j
    real(8) :: Nbar_i(num_experiments)
    real(8) :: Nbar_j(num_experiments)
    real(8) :: db_create_w_i
    real(8) :: w_i, w_j
    real(8) :: Navg_i,Navg_j
    integer :: k

    db_M_Namc_ij=0.0d0
    !w_i = db_create_w_i(t13,dmee,i)
    !w_j = db_create_w_i(t13,dmee,j)
    w_i = rand_W_k(i)
    w_j = rand_W_k(j)
    ! Obtención de vectores Nbar
    do k=1,num_experiments
        Nbar_i(k)= N_obs_f(i)-(w_i*(N_obs_n(i)-rand_Namc_n(i,k)) + rand_Namc_f(i,k))
        Nbar_j(k)= N_obs_f(j)-(w_j*(N_obs_n(j)-rand_Namc_n(j,k)) + rand_Namc_f(j,k))
    enddo
    ! OBtención del promedio de los vectores Nbar
    Navg_i=sum(Nbar_i)/real(num_experiments)
    Navg_j=sum(Nbar_j)/real(num_experiments)
    ! Obtención la entrada ij de la matriz M de la incertidumbre en Accidental-Background
    do k=1,num_experiments
        db_M_Namc_ij=db_M_Namc_ij+(Nbar_i(k)-Navg_i)*(Nbar_j(k)-Navg_j)
    enddo
    db_M_Namc_ij=db_M_Namc_ij/real(num_experiments)
    return
end function db_M_Namc_ij