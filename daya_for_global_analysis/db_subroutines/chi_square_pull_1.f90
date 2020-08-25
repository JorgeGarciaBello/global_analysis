real(8)  function chiSquarePull1(P)
    use db_data, only: n,NDIM,ADS,RCTS,Md=>Md_1607,Bd,grid_events_data_points,delta_chi_db,k,neuN
    !use neu_osc_parameters, only: t13,dm31
    implicit none
    real(8) :: P(NDIM)
    real(8) :: sigmaR             ! us the uncorrelated reactor uncertainty
    real(8) :: sigmaD             ! us the uncrrelated detectiono uncertainty
    real(8) :: sigmaB(ADS)        ! us the uncorrelated background uncertainty
    real(8) :: sigmaBB(ADS)       ! us the uncorrelated background uncertainty calculado por mi como la suma de los cuadrados
    
    real(8) :: eps                ! is the parameter of absolute normalization
    real(8) :: alphaR(RCTS)       ! is an array with pull parameters reactor
    real(8) :: epsD(ADS)          ! is an array with pull parameters detector
    real(8) :: etaD(ADS)          ! is an array with pull parameters background-detector

    real(8) :: expectedNumberNeutrinosDetector
    real(8) :: expectedNumberNeutrinosDetectorFromSumOfBin
    real(8) :: sum_W_alp
    integer :: d,r,i
    real(8) :: Td
    real(8) :: neutrinos(ADS)    

    eps=P(1)
    alphaR=(/P(2),P(3),P(4),P(5),P(6),P(7)/)
    epsD=(/P(8),P(9),P(10),P(11),P(12),P(13),P(14),P(15)/)
    etaD=(/P(16),P(17),P(18),P(19),P(20),P(21),P(22),P(23)/)

    chiSquarePull1=0.0d0
    sigmaR=0.008D0
    sigmaD=0.002D0
    sigmaB=(/1040,1176,875,782,155,150,150,133/);

    !do i=1,n*n
    !    if((grid_events_data_points(i,1)==t13).and.(grid_events_data_points(i,2)==dm31)) then            
    !        neutrinos=grid_events_data_points(i,3:)            
    !    end if
    !enddo
    
    do d=1,ADS        
        !Td=neutrinos(d)
        Td=neuN(d)
        chiSquarePull1=chiSquarePull1   &                        
                       +(Md(d)-Td*(1.0d0+eps+sum_W_alp(d,alphaR)+epsD(d))+etaD(d))**2/(Md(d)+Bd(d))                       
    enddo
    do r=1,RCTS
        chiSquarePull1=chiSquarePull1+(alphaR(r)/sigmaR)**2
    enddo
    do d=1,ADS
        chiSquarePull1=chiSquarePull1+(epsD(d)/sigmaD)**2
    enddo
    do d=1,ADS
        chiSquarePull1=chiSquarePull1+(etaD(d)/sigmaB(d))**2
    enddo 
    return
end function chiSquarePull1