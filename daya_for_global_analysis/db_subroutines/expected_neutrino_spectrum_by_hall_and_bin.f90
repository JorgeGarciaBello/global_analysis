real(8) function expectedNeutrinoSpectrumByHallAndBin(H,j,t13,dm31)
    use db_data, only: bines, NBIN
    implicit none
    integer :: H                  ! is the number of the experimental hall
    integer :: j                  ! is the number of bin
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested

    real(8) :: expectedNumberNeutrinoByHallAndBin
    real(8) :: a,b

    a=bines(j,1); b=bines(j,2)
    expectedNeutrinoSpectrumByHallAndBin=expectedNumberNeutrinoByHallAndBin(H,j,t13,dm31)/(b-a)

    return
end function expectedNeutrinoSpectrumByHallAndBin