!#################################################################################################################
!
!       expectedNeutrinoSpectrumByBinFar: is the function that return 
!           the expected neutirno spectrum bay energy-bin and by far-hall
!
!#################################################################################################################
real(8) function expectedNeutrinoSpectrumByBinFar(i,t13,dm31)
    use db_data, only: bines,NBIN
    implicit none   
    integer :: i                          ! is the number of energy bin
    real(8) :: t13, dm31
    real(8) :: expectedNumberNeutrinosDetectorBin !function that return the expected number of neutrinos by detector and bin
    real(8) :: a,b                        ! limits of the bin

    a=bines(i,1); b=bines(i,2);
    expectedNeutrinoSpectrumByBinFar=0.0d0
    expectedNeutrinoSpectrumByBinFar=expectedNeutrinoSpectrumByBinFar  &
                                       +expectedNumberNeutrinosDetectorBin(5,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(6,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(7,i,t13,dm31) &
                                       +expectedNumberNeutrinosDetectorBin(8,i,t13,dm31)

    expectedNeutrinoSpectrumByBinFar=expectedNeutrinoSpectrumByBinFar / (b-a)
    return
end function expectedNeutrinoSpectrumByBinFar