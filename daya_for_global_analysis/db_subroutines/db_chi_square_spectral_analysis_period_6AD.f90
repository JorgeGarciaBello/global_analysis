real(8) function db_chi_square_spectral_analysis_period_6AD(k,V6AD_H31,V6AD_H32)
    use db_data, only: NBIN,N_obs_H1_6AD,N_obs_H2_6AD,N_obs_H3_6AD, &
                       w_6AD_H3_H1,w_6AD_H2_H1,w_6AD_H3_H2,w_6AD_H1_H2
    implicit none
    integer :: k
    real(8) :: V6AD_H31(NBIN,NBIN),V6AD_H32(NBIN,NBIN)                          ! V is the inversed covariance matrix of V    
    real(8) :: chi
    integer :: i,j
   
    chi=0.0d0
    do i=1,NBIN
        do j=1,NBIN            
            chi=chi+(N_obs_H3_6AD(j)-w_6AD_H3_H1(k,j)*N_obs_H1_6AD(j))*  &
                    V6AD_H31(i,j)*                                        &
                    (N_obs_H3_6AD(i)-w_6AD_H3_H1(k,i)*N_obs_H1_6AD(i))                   
        enddo
    enddo
    do i=1,NBIN
        do j=1,NBIN
            chi=chi+(N_obs_H3_6AD(j)-w_6AD_H3_H2(k,j)*N_obs_H2_6AD(j))*  &
                    V6AD_H32(i,j)*                                          &
                    (N_obs_H3_6AD(i)-w_6AD_H3_H2(k,i)*N_obs_H2_6AD(i))
        enddo
    enddo
    db_chi_square_spectral_analysis_period_6AD=chi
    return
end function db_chi_square_spectral_analysis_period_6AD