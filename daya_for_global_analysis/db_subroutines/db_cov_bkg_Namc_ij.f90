real(8) function db_cov_bkg_Namc_ij(t13,dmee,i,j)
    use db_data, only: num_experiments,bkg_all_N_n, bkg_all_N_f
    implicit none
    real(8) :: t13, dmee
    integer :: i,j
    real(8) :: db_S_n_i_Namc
    real(8) :: db_S_f_i_Namc
    real(8) :: db_create_w_i
    real(8) :: w_i,w_j
    real(8) :: dat_i(num_experiments), dat_j(num_experiments)
    real(8) :: result
    real(8) :: result_i, result_j
    integer :: k

    
    w_i=db_create_w_i(t13,dmee,i)
    w_j=db_create_w_i(t13,dmee,j)
    select case(4)
        case(1)
            !result=0.0d0
            !do k=1,num_experiments
            !    result=result+(db_S_f_i_Namc(i)-w_i*db_S_n_i_Namc(i))* &
            !                  (db_S_f_i_Namc(j)-w_j*db_S_n_i_Namc(j))
            !enddo
            db_cov_bkg_Namc_ij=result/real(num_experiments)
        case(2)    
            do k=1,num_experiments
                dat_i(k)=(db_S_f_i_Namc(i)-w_i*db_S_n_i_Namc(i))
                dat_j(k)=(db_S_f_i_Namc(j)-w_j*db_S_n_i_Namc(j))
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
            db_cov_bkg_Namc_ij=result/real(num_experiments)
        case(3)
        case(4)
            !db_cov_bkg_Namc_ij=((0.45d0)**2)*(bkg_all_N_f(i,3))*(bkg_all_N_f(j,3))
            !db_cov_bkg_Namc_ij=((0.45d0)**2)*(w_i*bkg_all_N_n(i,3))*(w_j*bkg_all_N_n(j,3))  &
            !+  ((0.45d0)**2)*bkg_all_N_f(i,3)*bkg_all_N_f(j,3)
            db_cov_bkg_Namc_ij=((0.45d0)**2)*(bkg_all_N_f(i,3)-w_i*bkg_all_N_n(i,3))*(bkg_all_N_f(j,3)-w_j*bkg_all_N_n(j,3))
    end select
    return
end function db_cov_bkg_Namc_ij