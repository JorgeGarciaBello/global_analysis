real(8) function expectedNeutrinoSpectrumByDetectorBin(d,j,t13,dm31)
    use db_data, only: bines,NBIN
    implicit none
    integer :: d                  ! is the number of detector
    integer :: j                  ! is the number of bin
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested

    real(8) :: expectedNumberNeutrinosDetectorBin
    real(8) :: a,b

    a=bines(j,1);    b=bines(j,2)
    expectedNeutrinoSpectrumByDetectorBin=expectedNumberNeutrinosDetectorBin(d,j,t13,dm31)/(b-a)
    return
end function expectedNeutrinoSpectrumByDetectorBin