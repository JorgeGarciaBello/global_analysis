subroutine DC_create_statistical_matrix(M_stat)
    use types
    use DC_settings, only: NBIN
    use DC_data, only : N_n_obs,N_f_obs,N_n_exp,N_f_exp
    implicit none
    real(dp) :: M_stat(NBIN,NBIN)
    integer  :: i,j 

    M_stat=0.0_dp
    do i=1,NBIN        
        M_stat(i,i)=N_f_obs(i)
    enddo
    call write_matrix(NBIN,M_stat,'DC_M_stat')
    return
end subroutine DC_create_statistical_matrix