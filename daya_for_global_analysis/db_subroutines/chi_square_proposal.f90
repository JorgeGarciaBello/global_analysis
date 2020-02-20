real(8) function chiSquareProposal(P)
    use db_data, only:NDIM,NBIN,ADS,RCTS,gFactor,farObs,farExp,sigmaFarBkg,farBkg,pullEngy,Bd,cal, &
                      Md_2018,sigma_BKG,sigma_r,sigma_d
    !use neu_osc_parameters, only: dm31
    implicit none
    real(8) :: P(NDIM)
    integer :: d,r
    integer :: i
    real(8) :: model
    real(8) :: mod

    real(8) :: eps                ! is the parameter of absolute normalization
    real(8) :: etaBkg(5)          ! is the pull parameter for the uncertainty of total background
    real(8) :: etaBkg26(26)       ! is the pull parameter for the uncertainty of total background by bin
    real(8) :: epsD               ! is the pull parameter for the uncertainty of detection efficiency
    real(8) :: eps_d(ADS)         ! are the pull parameters for the uncertainty of detection efficiency
    real(8) :: epsR               ! is the pull parameter for the uncertainty of neutrinos from the reactors

    real(8) :: sigmaBkg(5)        ! is the uncertainty of the total background
    real(8) :: sigmaBkg26(26)     ! is the uncertainty of the total background by bin
    real(8) :: sigmaD             ! is the uncertainty of the detection efficiency
    real(8) :: sigmaR             ! is the uncertainty of the production of neutrinos from the reactors
    real(8) :: eta_d(ADS)         ! are the uncertainties of the background per detector

    real(8) :: expectedNeutrinoSpectrumByBinFar
    real(8) :: expectedNumberNeutrinoByBinFar
    real(8) :: expectedNumberNeutrinosDetector
    real(8) :: sum_W_alp
    real(8) :: alphaR(6)          ! is an array with pull parameters reactor

    real(8) :: N_d_exp

    !sigmaBkg=294.0d0
    sigmaBkg=(/33.8928791591803,33.8928791591803,271.143033273443,78.1539010315909,67.7857583183607/)

    sigmaD=0.004d0
    sigmaR=0.016d0

    eps=P(1)
    epsD=P(2)
    epsR=P(3)
    etaBkg=(/P(4),P(5),P(6),P(7),P(8)/)
    chiSquareProposal=0.0d0
    select case(1)
        case(1)
            pullEngy=P(9)
            do i=1,NBIN                
                mod=expectedNeutrinoSpectrumByBinFar(i)
                chiSquareProposal = chiSquareProposal &
                                  !+ (farObs(i)-farExp(i)*corrections(i)*mod*(1.0d0+eps+epsD+epsR)+etaBkg(1) &
                                  + (farObs(i)-mod*(1.0d0+eps+epsD+epsR)          +etaBkg(1) &
                                                                                  +etaBkg(2) &
                                                                                  +etaBkg(3) &
                                                                                  +etaBkg(4) &
                                                                                  +etaBkg(5))**2 &
                                  / sigmaFarBkg(i)!*(1.0d0+0.1d0))!(farObs(i)+farBkg(i))
                                  !  sigmaFarBkg
            end do
            chiSquareProposal = chiSquareProposal        &
                              + (   epsD/sigmaD   )**2   &
                              + (   epsR/sigmaR   )**2
            
            do i=1,5
                chiSquareProposal = chiSquareProposal        &
                                  + ( etaBkg(i)/sigmaBkg(i) )**2
            end do

            chiSquareProposal = chiSquareProposal        &
                                  + ( pullEngy/0.002d0 )**2

            !hiSquareProposal = chiSquareProposal        &
             !                     + ( (dm31 - 2.68d-3) /0.14d-3 )**2
        case(2)
        !###################################################################################
        !
        !   Este análisis usa la misma chi que el case(1). Sin embargo, toma el
        !   espectro esperado sin oscilaciones directamente del publicado en 
        !   gráficas  de la colaboración Daya Bay. Además tienen la calibración
        !   del espectro a los mejores valores del FIT en Daya Bay
        !
        !####################################################################################  
            pullEngy=P(9)            
            do i=1,NBIN
              mod=model(i)               
              chiSquareProposal = chiSquareProposal &                                  
                                  + (farObs(i)-farExp(i)*cal(i)*mod*(1.0d0+eps+epsD+epsR)          &
                                                +etaBkg(1)                                  &
                                                +etaBkg(2)                                  &
                                                +etaBkg(3)                                  &
                                                +etaBkg(4)                                  &
                                                +etaBkg(5))**2                              &
                                  / sigmaFarBkg(i)
            end do
            chiSquareProposal = chiSquareProposal        &
                              + (   epsD/sigmaD   )**2   &
                              + (   epsR/sigmaR   )**2
            
            do i=1,5
                chiSquareProposal = chiSquareProposal        &
                                  + ( etaBkg(i)/sigmaBkg(i) )**2
            end do

            chiSquareProposal = chiSquareProposal        &
                                  + ( pullEngy/0.002d0 )**2

            !hiSquareProposal = chiSquareProposal        &
             !                     + ( (dm31 - 2.68d-3) /0.14d-3 )**2             
        case(3) !Análisis de X bines 
        !###################################################################################
        !
        !   Este análisis usa la estadística CHI con enfoque de pulls
        !   empleada en los artículos de Daya Bay, por ejemplo la 
        !   estadística de 2012. Este análisis dse basa en comparar el 
        !  número de neutrinos detectados por detetor.
        !
        !####################################################################################  

          !alphaR(1)=P();alphaR(2)=P();alphaR(3)=P();alphaR(4)=P();alphaR(5)=P();alphaR(6)=P();

          do d=1,ADS
            N_d_exp=expectedNumberNeutrinosDetector(d)
            chiSquareProposal = chiSquareProposal &
                                    + (Md_2018(d)-N_d_exp*(1.0d0+eps+sum_W_alp(d,alphaR)+eps_d(d))+eta_d(d))**2 &
                                    / (Md_2018(d)+Bd(d))
          enddo
          do r=1,RCTS
            chiSquareProposal = chiSquareProposal              &
                                + (alphaR(r)/sigma_r(r))**2
          enddo
          do d=1,ADS
            chiSquareProposal = chiSquareProposal              &
                                + (eps_d(d)/sigma_d(d))**2     &
                                + (eta_d(d)/sigma_BKG(d))**2
          enddo
        case(4)
            do i=1,NBIN
                mod=model(i)
                chiSquareProposal = chiSquareProposal &
                                  + (farObs(i)-farExp(i)*mod*(1.0d0+eps+epsD+epsR)+etaBkg26(i))**2 &
                                  / (farObs(i))
            end do
            chiSquareProposal = chiSquareProposal        &
                              + (   epsD/sigmaD   )**2   &
                              + (   epsR/sigmaR)**2
            do i=1,NBIN
                chiSquareProposal = chiSquareProposal        &
                                  + ( etaBkg26(i)/sigmaFarBkg(i) )**2
            end do
        case(5)
            print*, 'opcion incorrecta en chi_square_proposal'
    end select 
    
    !print*,chiSquareProposal
    return
end function chiSquareProposal