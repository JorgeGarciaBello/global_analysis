real(8) function expectedSpectrumNeutrinoByHallPeriodBin(H,period,j,t13,dm31)
    use db_data, only: NBIN,bines
    implicit none
    integer :: H                  ! is the number of the experimental hall
    integer :: period
    integer :: j                  ! is the number of bin
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested    

    real(8) :: expectedNumberNeutrinoByHallPeriodBin
    real(8) :: a,b
    
    a=bines(j,1);    b=bines(j,2);
    expectedSpectrumNeutrinoByHallPeriodBin=0.0d0
    expectedSpectrumNeutrinoByHallPeriodBin=expectedNumberNeutrinoByHallPeriodBin(H,period,j,t13,dm31)/(b-a)
   
    return
end function expectedSpectrumNeutrinoByHallPeriodBin