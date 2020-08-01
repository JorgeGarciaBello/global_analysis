subroutine calibration_by_hall_and_bin()
    use db_data, only: NBIN
    implicit none
    integer :: d,i,H,period
    real(8) :: t13,dm31
    real(8) :: t13_my,dm31_my
    real(8) :: expectedNumberNeutrinosDetectorBin
    real(8) :: expectedNumberNeutrinoByHallPeriodBin
    real(8) :: result

    t13_my=asin(sqrt(0.0d0))/2.0d0; dm31_my=0.0d0
    !t13_my=asin(sqrt(0.0856d0))/2.0d0; dm31_my=2.522d-003
    print*, '6AD-Period','8AD-Period','7AD-Period'
    print*,''   
    !print*, 'Hall-1'
    H=1
    do i=1,NBIN        
        print*, expectedNumberNeutrinoByHallPeriodBin(H,1,i,t13_my,dm31_my), &
                  expectedNumberNeutrinoByHallPeriodBin(H,2,i,t13_my,dm31_my), &
                  expectedNumberNeutrinoByHallPeriodBin(H,3,i,t13_my,dm31_my)
    enddo
    print*, ''
    !print*, 'Hall-2'
    H=2
    do i=1,NBIN
        print*, expectedNumberNeutrinoByHallPeriodBin(H,1,i,t13_my,dm31_my), &
                  expectedNumberNeutrinoByHallPeriodBin(H,2,i,t13_my,dm31_my), &
                  expectedNumberNeutrinoByHallPeriodBin(H,3,i,t13_my,dm31_my)
    enddo
    print*, ''
    !print*, 'Hall-3'
    H=3
    do i=1,NBIN
        print*, expectedNumberNeutrinoByHallPeriodBin(H,1,i,t13_my,dm31_my), &
                  expectedNumberNeutrinoByHallPeriodBin(H,2,i,t13_my,dm31_my), &
                  expectedNumberNeutrinoByHallPeriodBin(H,3,i,t13_my,dm31_my)
    enddo

    return
end subroutine calibration_by_hall_and_bin