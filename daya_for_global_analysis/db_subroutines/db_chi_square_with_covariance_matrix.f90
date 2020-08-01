real(8) function db_chi_square_with_covariance_matrix(V,k)
    use db_data, only: NBIN,N_obs_near,N_obs_far,results_w    
    implicit none
    integer :: k
    real(8) :: V(NBIN,NBIN)                          ! V is the inversed covariance matrix of V    
    real(8) :: chi
    integer :: i,j
   
    chi=0.0d0
    do i=1,NBIN
        do j=1,NBIN
            chi=chi+(N_obs_far(j)-results_w(k,j)*N_obs_near(j))* &
                     V(i,j)*                                     &
                    (N_obs_far(i)-results_w(k,i)*N_obs_near(i))
        enddo
    enddo    
    db_chi_square_with_covariance_matrix=chi
    return
end function db_chi_square_with_covariance_matrix