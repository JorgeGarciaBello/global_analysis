subroutine test()
    implicit none
    integer :: d
    real(8) :: t13, dm31
    real(8) :: expectedNumberNeutrinosDetectorFromSumOfBin
    real(8) :: expectedNumberNeutrinosDetector
    real(8) :: result1,result2
    print*, 'estas en el test'

    d=1
    t13=asin(sqrt(0.5d0))/2.0d0
    dm31=0.0025d0

    result1=expectedNumberNeutrinosDetectorFromSumOfBin(d,t13,dm31)
    result2=expectedNumberNeutrinosDetector(d,t13,dm31)

    print*,result1 , result2
            
    return
end subroutine test