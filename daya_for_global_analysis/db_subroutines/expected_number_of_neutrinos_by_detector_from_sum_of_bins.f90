!#################################################################################################################
!
!       expectedNumberOfNeutrinosByDetectorFromSumOfBins: is the function that return 
!           the expected NUMBER of neutirnos by detector calculated from the sum of number per 
!           energy-bin
!
!#################################################################################################################
real(8) function expectedNumberOfNeutrinosByDetectorFromSumOfBins(d)
    use db_data, only: bines,NBIN,ADS
    implicit none   
    integer :: i                          ! is the number of energy bin
    integer :: d                          ! is the number of antineutrino detector
    real(8) :: expectedNumberOfNeutrinosByDetectorBin !function that return the expected number of neutirnos by detector per bin
    real(8) :: calibration_by_detector(ADS)

    calibration_by_detector=(/1.05763125311351,1.07023633605271,1.04472389069699,1.0534395684608, &
                              1.01468527197059,1.0277577834984,1.01560776705091,1.03424665810169/)

    expectedNumberOfNeutrinosByDetectorFromSumOfBins=0.0d0    
    do i=1,NBIN
        expectedNumberOfNeutrinosByDetectorFromSumOfBins =  expectedNumberOfNeutrinosByDetectorFromSumOfBins &
                                                          + expectedNumberOfNeutrinosByDetectorBin(d,i)
    enddo
    expectedNumberOfNeutrinosByDetectorFromSumOfBins=calibration_by_detector(d)*expectedNumberOfNeutrinosByDetectorFromSumOfBins

    return
end function expectedNumberOfNeutrinosByDetectorFromSumOfBins