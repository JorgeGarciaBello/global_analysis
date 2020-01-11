!#################################################################################################################
!
!       expectedNumberOfNeutrinosByDetectorFromSumOfBins: is the function that return 
!           the expected NUMBER of neutirnos by detector calculated from the sum of number per 
!           energy-bin
!
!#################################################################################################################
real(8) function expectedNumberOfNeutrinosByDetectorFromSumOfBins(d)
    use db_data, only: bines,NBIN
    implicit none   
    integer :: i                          ! is the number of energy bin
    integer :: d                          ! is the number of antineutrino detector
    real(8) :: expectedNumberOfNeutrinosByDetectorBin !function that return the expected number of neutirnos by detector per bin

    expectedNumberOfNeutrinosByDetectorFromSumOfBins=0.0d0    
    do i=1,NBIN
        expectedNumberOfNeutrinosByDetectorFromSumOfBins =  expectedNumberOfNeutrinosByDetectorFromSumOfBins &
                                                          + expectedNumberOfNeutrinosByDetectorBin(d,i)
    enddo

    return
end function expectedNumberOfNeutrinosByDetectorFromSumOfBins