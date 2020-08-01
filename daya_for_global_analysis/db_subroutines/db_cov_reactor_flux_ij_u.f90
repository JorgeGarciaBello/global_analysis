real(8) function db_cov_reactor_flux_ij_u(t13,dmee,i,j)
    use db_data, only: num_experiments, N_obs_n, N_obs_f
    implicit none    
    real(8) :: t13, dmee
    integer :: i,j
    real(8) :: db_S_n_i_Nrflux_u
    real(8) :: db_S_f_i_Nrflux_u
    real(8) :: db_create_w_i
    real(8) :: w_i,w_j
    real(8) :: result_i,result_j
    real(8) :: result
    real(8) :: dat_i(num_experiments), dat_j(num_experiments)
    integer :: k
    
    db_cov_reactor_flux_ij_u=0.0d0

    if(i==j) then
        w_i=db_create_w_i(t13,dmee,i)
        w_j=db_create_w_i(t13,dmee,j)
        do k=1,num_experiments
            dat_i(k)=(db_S_f_i_Nrflux_u(i)-w_i*db_S_n_i_Nrflux_u(i))
            dat_j(k)=(db_S_f_i_Nrflux_u(j)-w_j*db_S_n_i_Nrflux_u(j))
        enddo

        result_i=0.0d0
        result_j=0.0d0
        do k=1,num_experiments
            result_i=result_i+dat_i(k)
            result_j=result_j+dat_j(k)
        enddo
        result_i=result_i/real(num_experiments)
        result_j=result_j/real(num_experiments)

        result=0.0d0
        do k=1,num_experiments
            result=result+(dat_i(k)-result_i)*(dat_j(k)-result_j)
        enddo
        db_cov_reactor_flux_ij_u=result/real(num_experiments)
    end if

    return
end function db_cov_reactor_flux_ij_u