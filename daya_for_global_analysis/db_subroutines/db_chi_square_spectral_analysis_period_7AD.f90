real(8) function db_chi_square_spectral_analysis_period_7AD(k,V7AD_H31,V7AD_H32)
    use db_data, only: NBIN,N_obs_H1_7AD,N_obs_H2_7AD,N_obs_H3_7AD, &
                       w_7AD_H3_H1,w_7AD_H2_H1,w_7AD_H3_H2,w_7AD_H1_H2
    implicit none
    integer :: k
    real(8) :: V7AD_H31(NBIN,NBIN),V7AD_H32(NBIN,NBIN)                          ! V is the inversed covariance matrix of V    
    real(8) :: chi
    integer :: i,j
   
    chi=0.0d0
    do i=1,NBIN
        do j=1,NBIN
            chi=chi+(N_obs_H3_7AD(j)-w_7AD_H3_H1(k,j)*N_obs_H1_7AD(j))*  &
                    V7AD_H31(i,j)*                                       &
                    (N_obs_H3_7AD(i)-w_7AD_H3_H1(k,i)*N_obs_H1_7AD(i))!   &
                    !+                                                         &
                    !(N_obs_H2_7AD(j)-w_7AD_H2_H1(k,j)*N_obs_H1_7AD(j))*  &
                    !V7AD_H2(i,j)*                                          &
                    !(N_obs_H2_7AD(i)-w_7AD_H2_H1(k,i)*N_obs_H1_7AD(i))
        enddo
    enddo
    do i=1,NBIN
        do j=1,NBIN
            chi=chi+(N_obs_H3_7AD(j)-w_7AD_H3_H2(k,j)*N_obs_H2_7AD(j))*  &
                    V7AD_H32(i,j)*                                          &
                    (N_obs_H3_7AD(i)-w_7AD_H3_H2(k,i)*N_obs_H2_7AD(i))!   &
                    !+                                                         &
                    !(N_obs_H1_7AD(j)-w_7AD_H1_H2(k,j)*N_obs_H2_7AD(j))*  &
                    !V7AD_H32(i,j)*                                          &
                    !(N_obs_H1_7AD(i)-w_7AD_H1_H2(k,i)*N_obs_H2_7AD(i))
        enddo
    enddo
    db_chi_square_spectral_analysis_period_7AD=chi
    return
end function db_chi_square_spectral_analysis_period_7AD