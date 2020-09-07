!#################################################################
!
!       FUNC: es el nombre la función en la que se define 
!             la estadística CHI^{2} únicamente los datos
!             FAR del experimento RENO
!
!##################################################################                 
function reno_FUNC_3(P)
    use  types
    use neu_osc_parameters
    use reno_data, only: NDIM,NBIN,ADS,RCTS,nearObs,farObs,bkg, &
                         sigma_background_d,sigma_reactor_flux,sigma_detection_efficiency,sigma_energy_scale, &
                         data
    implicit none    
    real(dp) :: reno_FUNC_3
    real(dp) :: P(NDIM-1)                    ! Parámetros de oscilacióna determinar
    
    real(dp) :: b_f                        ! b_f IS the pull associated to sigma_background_d respectively    
    real(dp) :: fr(RCTS)                   ! fr are the pulls associated to sigma_background_d respectively    
    real(dp) :: eps                        ! eps are the pulls associated to sigma_detection efficiencys    
    real(dp) :: eta                        ! eps are the pulls associated to sigma energy scale   

    real(dp) :: chi_2
    integer  :: i,j    
    real(dp) :: farExpC
    integer  :: d,r    
    real(dp) :: N_far
       
    reno_FUNC_3=0.0d0    
    
    b_f=P(1)
    fr=(/P(2),P(3),P(4),P(5),P(6),P(7)/)
    eps=P(8)
    eta=P(9)

    chi_2=0.0_dp
    do i=1,NBIN    
      N_far=0.0d0;
      do r=1,RCTS    
        N_far =N_far +(1.0d0 + fr(r))*data(i,2,r)                  
      enddo      
      farExpC  = (1.0d0+eps+eta)*N_far + bkg(i,2)*(b_f)
      chi_2=chi_2 + ( farObs(i) - farExpC )**2/(farObs(i)+bkg(i,2))
    enddo
    do r=1,RCTS
      chi_2=chi_2 + (fr(r)/(sigma_reactor_flux(r)/100.0d0))**2
    enddo
    chi_2=chi_2 + (b_f/(sigma_background_d(2)/100.0d0))**2    
    chi_2=chi_2 + (eps/(sigma_detection_efficiency/100.0d0))**2 &
                + (eta/(sigma_energy_scale/100.0d0))**2    
    reno_FUNC_3=chi_2    
    return
end function reno_FUNC_3