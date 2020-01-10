!###################################################################################
!
!   Este análisis usa la estadística CHI con enfoque de pulls
!   empleada en los artículos de Daya Bay, por ejemplo la 
!   estadística de 2012. Este análisis dse basa en comparar el 
!  número de neutrinos detectados por detetor.
!
!####################################################################################
real(8)  function chiSquarePull1(P)
    use db_data, only:NDIM,NBIN,ADS,RCTS,gFactor,farObs,farExp,sigmaFarBkg,farBkg,pullEngy,Bd,cal, &
                      Md_2018,sigma_BKG,sigma_r,sigma_d
    use neu_osc_parameters
    implicit none
    real(8) :: P(NDIM)
    integer :: d,r
    integer :: i
    real(8) :: model
    real(8) :: mod
    real(8) :: eps                ! is the parameter of absolute normalization
    real(8) :: eps_d(ADS)         ! are the pull parameters for the uncertainty of detection efficiency    
    real(8) :: eta_d(ADS)         ! are the uncertainties of the background per detector    
    real(8) :: expectedNumberNeutrinosDetector
    real(8) :: sum_W_alp
    real(8) :: alphaR(6)          ! is an array with pull parameters reactor
    real(8) :: N_d_exp 
    real(8) :: OPT(ADS)

    eps=P(1)
    alphaR(1)=P(2); alphaR(2)=P(3); alphaR(3)=P(4); alphaR(4)=P(5); alphaR(5)=P(6); alphaR(6)=P(7);
    !eps_d=(/P(8), P(9), P(10), P(11), P(12), P(13), P(14), P(15)/)
    !eta_d=(/P(16), P(17), P(18), P(19), P(20), P(21), P(22), P(23)/)
    
    OPT=(/1.46659434019648d0,1.48407165123355d0,1.44869327343884d0,1.46078095122313d0, &
          1.40804288808937d0,1.42618536421602d0,1.40932607364135d0,1.43519286395241d0/)
    chiSquarePull1=0.0d0
      do d=1,ADS
        N_d_exp=expectedNumberNeutrinosDetector(d)
        chiSquarePull1 = chiSquarePull1 &
                                + (Md_2018(d)-N_d_exp*OPT(d)*(1.0d0+eps+sum_W_alp(d,alphaR)+eps_d(d))+eta_d(d))**2 &
                                / (Md_2018(d)+Bd(d))
      enddo
      do r=1,RCTS
        chiSquarePull1 = chiSquarePull1                    &
                            + (alphaR(r)/sigma_r(r))**2
      enddo
      do d=1,ADS
        chiSquarePull1 = chiSquarePull1                    &
                            + (eps_d(d)/sigma_d(d))**2     &
                            + (eta_d(d)/sigma_BKG(d))**2
      enddo
      
      !chiSquarePull1 = chiSquarePull1 + ( (dm31 - 2.68d-3) /0.14d-3 )**2
      !chiSquarePull1 = chiSquarePull1 + ( (dm31 - 2.5d-3) /0.14d-3 )**2
    return
end function chiSquarePull1