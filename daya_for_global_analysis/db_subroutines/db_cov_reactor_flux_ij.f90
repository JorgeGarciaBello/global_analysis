real(8) function db_cov_reactor_flux_ij(t13,dmee,i,j)
    use db_data, only: num_experiments, N_obs_n, N_obs_f
    implicit none
    real(8) :: sigma_reactor_flux=3.0d0/100.0D0
    real(8) :: t13, dmee
    integer :: i,j
    real(8) :: db_S_n_i_Nrflux
    real(8) :: db_S_f_i_Nrflux
    real(8) :: db_create_w_i
    real(8) :: w_i,w_j
    real(8) :: result_i,result_j
    real(8) :: result
    real(8) :: dat_i(num_experiments), dat_j(num_experiments)
    integer :: k

    w_i=db_create_w_i(t13,dmee,i)
    w_j=db_create_w_i(t13,dmee,j)

    if((i.gt.52).and.(i.le.104)) then
        sigma_reactor_flux=5.01/100.d0
    end if
    if((j.gt.52).and.(j.le.104)) then
        sigma_reactor_flux=5.01/100.d0
    end if

    select case(3)
        case(1)
            db_cov_reactor_flux_ij=(sigma_reactor_flux**2)*(N_obs_f(i)*N_obs_f(j)) !+ &
                                  !(sigma_reactor_flux**2)*(w_i*N_obs_n(i))*(w_j*N_obs_n(j))
            
            !db_cov_reactor_flux_ij=(sigma_reactor_flux**2)*(  N_obs_f(i)-w_i*N_obs_n(i) )*( N_obs_f(j)-w_j*N_obs_n(j) )
        case(2)
            do k=1,num_experiments
                dat_i(k)=w_i*db_S_n_i_Nrflux(i)
                dat_j(k)=w_j*db_S_n_i_Nrflux(j)
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
            db_cov_reactor_flux_ij=result/real(num_experiments)
        case(3)
            do k=1,num_experiments
                dat_i(k)=(db_S_f_i_Nrflux(i)-w_i*db_S_n_i_Nrflux(i))
                dat_j(k)=(db_S_f_i_Nrflux(j)-w_j*db_S_n_i_Nrflux(j))
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
            db_cov_reactor_flux_ij=result/real(num_experiments)
    end select    
    return
end function db_cov_reactor_flux_ij