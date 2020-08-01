real(8) function db_chi_square_spectral_analysis_period_8AD(k,V8AD_H31,V8AD_H32)
    use db_data, only: NBIN,N_obs_H1_8AD,N_obs_H2_8AD,N_obs_H3_8AD, &
                       w_8AD_H3_H1,w_8AD_H2_H1,w_8AD_H3_H2,w_8AD_H1_H2
    implicit none
    integer :: k
    real(8) :: V8AD_H31(NBIN,NBIN),V8AD_H32(NBIN,NBIN)                          ! V is the inversed covariance matrix of V    
    real(8) :: chi
    integer :: i,j
   
    chi=0.0d0
    do i=1,NBIN
        do j=1,NBIN
            chi=chi+(N_obs_H3_8AD(j)-w_8AD_H3_H1(k,j)*N_obs_H1_8AD(j))*  &
                    V8AD_H31(i,j)*                                       &
                    (N_obs_H3_8AD(i)-w_8AD_H3_H1(k,i)*N_obs_H1_8AD(i))   !&
                    !+                                                         &
                    !(N_obs_H2_8AD(j)-w_8AD_H2_H1(k,j)*N_obs_H1_8AD(j))*  &
                    !V8AD_H2(i,j)*                                          &
                    !(N_obs_H2_8AD(i)-w_8AD_H2_H1(k,i)*N_obs_H1_8AD(i))
        enddo
    enddo
    do i=1,NBIN
        do j=1,NBIN
            chi=chi+(N_obs_H3_8AD(j)-w_8AD_H3_H2(k,j)*N_obs_H2_8AD(j))*  &
                    V8AD_H32(i,j)*                                       &
                    (N_obs_H3_8AD(i)-w_8AD_H3_H2(k,i)*N_obs_H2_8AD(i))   !&
                    !+                                                         &
                    !(N_obs_H1_8AD(j)-w_8AD_H1_H2(k,j)*N_obs_H2_8AD(j))*  &
                    !V8AD_H31(i,j)*                                          &
                    !(N_obs_H1_8AD(i)-w_8AD_H1_H2(k,i)*N_obs_H2_8AD(i))
        enddo
    enddo
    db_chi_square_spectral_analysis_period_8AD=chi
    return
end function db_chi_square_spectral_analysis_period_8AD