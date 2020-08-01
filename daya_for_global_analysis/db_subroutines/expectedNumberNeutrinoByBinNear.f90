real*8 function expectedNumberNeutrinoByBinNear(i,t13,dm31)
    implicit none
    integer :: i                 ! is the number of energy bin
    real(8) :: t13, dm31
    real(8) :: expectedNumberNeutrinosDetectorBin !function that return the expected number of neutrinos by detector and bin        ]
    
    expectedNumberNeutrinoByBinNear=0.0d0
    expectedNumberNeutrinoByBinNear=expectedNumberNeutrinoByBinNear  &
                                       +expectedNumberNeutrinosDetectorBin(1,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(2,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(3,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(4,i,t13,dm31)    
    return
end function expectedNumberNeutrinoByBinNear
