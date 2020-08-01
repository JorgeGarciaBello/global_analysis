real*8 function expectedNumberNeutrinoByBinFar(i,t13,dm31)
    use db_data, only: bines
    implicit none
    integer :: i                 ! is the number of energy bin
    real(8) :: t13, dm31
    real(8) :: expectedNumberNeutrinosDetectorBin !function that return the expected number of neutrinos by detector and bin    
     
    expectedNumberNeutrinoByBinFar=0.0d0
    expectedNumberNeutrinoByBinFar=expectedNumberNeutrinoByBinFar  &
                                       +expectedNumberNeutrinosDetectorBin(5,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(6,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(7,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(8,i,t13,dm31)    
    return
end function expectedNumberNeutrinoByBinFar
