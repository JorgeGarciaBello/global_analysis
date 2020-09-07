function reno_far_partial_derivative_reactor_flux(idx,b_f,fr,eps,eta)
    use  types
    use reno_data, only: NBIN,ADS,RCTS,nearObs,farObs,bkg,sigma_reactor_flux,data
    implicit none
    real(dp) :: reno_far_partial_derivative_reactor_flux
    real(dp) :: b_f                        ! b_f are the pulls associated to sigma_background_d respectively    
    real(dp) :: fr(RCTS)                   ! fr are the pulls associated to sigma_background_d respectively    
    real(dp) :: eps                        ! eps are the pulls associated to sigma_detection efficiencys    
    real(dp) :: eta                        ! eta are the pulls associated to sigma energy scale    
    real(dp) :: result
    integer  :: i,r,idx
    real(dp) :: nearExpC,farExpC 
    real(dp) :: N_near
    real(dp) :: N_far


    reno_far_partial_derivative_reactor_flux= fr(idx)/(sigma_reactor_flux(idx)/100.0d0)**2
    result=0.0_dp
    do i=1,NBIN
      N_far=0.0d0;
      do r=1,RCTS
        N_far =N_far +(1.0d0 + fr(r))*data(i,2,r)
      enddo        
      farExpC  = (1.0d0+eps+eta)*N_far + bkg(i,2)*(b_f)
      result=result + ( (farObs(i) - farExpC) /farObs(i) )*(1.0d0+eps+eta)*data(i,2,idx)
    enddo
    reno_far_partial_derivative_reactor_flux=2.0_dp*(reno_far_partial_derivative_reactor_flux + result)
end function reno_far_partial_derivative_reactor_flux