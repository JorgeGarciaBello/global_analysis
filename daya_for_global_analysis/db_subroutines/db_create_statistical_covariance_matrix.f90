subroutine db_create_statistical_covariance_matrix(t13,dmee,rand_W_k,Vstat)
    use db_data, only: NBIN,PD,statFarError,N_obs_n, N_obs_f, bkg_all_N_f
                       
    implicit none
    real(8) :: t13, dmee
    real(8) :: rand_W_k(156)    
    real(8) :: Vstat(NBIN*2*PD,NBIN*2*PD)    
    real(8) :: db_N_f_exp_i
    integer :: i, j, u
    real(8) :: db_expected_antineutrino_number_all_bin_f

    Vstat=0.0d0    
    do i=1,NBIN*2*PD        
        Vstat(i,i)=N_obs_f(i)
        !Vstat(i,i)=db_expected_antineutrino_number_all_bin_f(i,t13,dmee)!+bkg_all_N_f(i,1) &
                                                                        !+bkg_all_N_f(i,2) &
                                                                        !+bkg_all_N_f(i,3) &
                                                                        !+bkg_all_N_f(i,4) &
                                                                        !+bkg_all_N_f(i,5)
    enddo
    !call db_write_matrix(NBIN*2*PD,Vstat,'M_statistical_covariance_matrix')    
    !call db_write_matrix_m_n(NBIN*2*PD,Vstat,'M_M_statistical_covariance_matrix')
    return
end subroutine db_create_statistical_covariance_matrix