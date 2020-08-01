real(8) function expectedNumberNeutrinoByHallAndBin(H,j,t13,dm31)
    use db_data, only: NBIN
    implicit none
    integer :: H                  ! is the number of the experimental hall
    integer :: j                  ! is the number of bin
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested
    integer :: d                  ! is the number of detector       

    real(8) :: expectedNumberNeutrinosDetectorBin
    real(8) :: a,b

    expectedNumberNeutrinoByHallAndBin=0.0d0
    select case(H)
        case(1)            
            expectedNumberNeutrinoByHallAndBin= expectedNumberNeutrinoByHallAndBin &
                                                 +expectedNumberNeutrinosDetectorBin(1,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(2,j,t13,dm31)
        case(2)
            expectedNumberNeutrinoByHallAndBin= expectedNumberNeutrinoByHallAndBin &
                                                 +expectedNumberNeutrinosDetectorBin(3,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(4,j,t13,dm31)
        case(3)
            expectedNumberNeutrinoByHallAndBin= expectedNumberNeutrinoByHallAndBin &
                                                 +expectedNumberNeutrinosDetectorBin(5,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(6,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(7,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(8,j,t13,dm31) 
    end select
    return
end function expectedNumberNeutrinoByHallAndBin