!#################################################################################################################
!
!       expectedNeutrinoSpectrumByBinNear: is the function that return 
!           the expected neutirno spectrum bay energy-bin and by near-hall
!
!#################################################################################################################
real(8) function expectedNeutrinoSpectrumByBinNear(i,t13,dm31)
    use db_data, only: bines
    implicit none
    integer :: i                 ! is the number of energy bin
    real(8) :: t13, dm31
    real(8) :: expectedNumberNeutrinosDetectorBin !function that return the expected number of neutrinos by detector and bin        ]
    real(8) :: a,b               ! limits of the bin    
    
    a=bines(i,1); b=bines(i,2);    
    expectedNeutrinoSpectrumByBinNear=0.0d0
    expectedNeutrinoSpectrumByBinNear=expectedNeutrinoSpectrumByBinNear  &
                                       +expectedNumberNeutrinosDetectorBin(1,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(2,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(3,i,t13,dm31)                                       

    expectedNeutrinoSpectrumByBinNear=expectedNeutrinoSpectrumByBinNear / (b-a)
    return
end function expectedNeutrinoSpectrumByBinNear