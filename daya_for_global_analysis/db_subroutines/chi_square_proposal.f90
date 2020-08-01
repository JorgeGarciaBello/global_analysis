real(8) function chiSquareProposal(P)
    use db_data, only:n,NDIM,NBIN,ADS,RCTS,gFactor,farObs,farExp,sigmaFarBkg,farBkg,pullEngy,far_bin_events
    use neu_osc_parameters, only: t13, dm31
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
    real(8) :: epsR               ! is the pull parameter for the uncertainty of neutrinos from the reactors

    real(8) :: sigmaBkg(5)        ! is the uncertainty of the total background
    real(8) :: sigmaBkg26(26)     ! is the uncertainty of the total background by bin
    real(8) :: sigmaD             ! is the uncertainty of the detection efficiency
    real(8) :: sigmaR             ! is the uncertainty of the production of neutrinos from the reactors

    real(8) :: expectedNeutrinoSpectrumByBinFar
    real(8) :: expectedNumberNeutrinoByBinFar
    real(8) :: expectedNeutrinoSpectrumByHallAndBin
    real(8) :: neutrinos(NBIN)
    
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
            do i=1,n*n
                if((far_bin_events(i,1)==t13).and.(far_bin_events(i,2)==dm31)) then            
                    neutrinos=far_bin_events(i,3:)            
                end if
            enddo
            do i=1,NBIN
                !mod=model(i)
                !mod=expectedNeutrinoSpectrumByBinFar(i)
                !mod=expectedNumberNeutrinoByBinFar(i)
                !mod=expectedNeutrinoSpectrumByHallAndBin(3,i,t13,dm31)
                mod=neutrinos(i)
                chiSquareProposal = chiSquareProposal &
                                  !+ (farObs(i)-farExp(i)*corrections(i)*mod*(1.0d0+eps+epsD+epsR)+etaBkg(1) &
                                  + (farObs(i)-mod*(1.0d0+eps+epsD+epsR)+etaBkg(1) &
                                                                        +etaBkg(2) &
                                                                        +etaBkg(3) &
                                                                        +etaBkg(4) &
                                                                        +etaBkg(5))**2 &
                                  / sigmaFarBkg(i)
                                  ! farObs(i)
                                  ! *(1.0d0+0.1d0))!(farObs(i)+farBkg(i))
                                  ! sigmaFarBkg
            end do
            chiSquareProposal = chiSquareProposal        &
                              + (   epsD/sigmaD   )**2   &
                              + (   epsR/sigmaR   )**2
            
            do i=1,5
                chiSquareProposal = chiSquareProposal        &
                                  + ( etaBkg(i)/sigmaBkg(i) )**2
            end do

            !chiSquareProposal = chiSquareProposal        &
            !                      + ( pullEngy/0.002d0 )**2

            !hiSquareProposal = chiSquareProposal        &
             !                     + ( (dm31 - 2.68d-3) /0.14d-3 )**2
        case(2) !Análisis de 26 bines adicionales, uno por cada bin de bkg
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
        case(3)
            print*, 'opcion incorrecta en chi_square_proposal'
    end select 
    
    !print*,chiSquareProposal
    return
end function chiSquareProposal