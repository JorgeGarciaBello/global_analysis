!##########################################################
!
!   expectedNumberNeutrinosDetectorFromSumOfBin is the function 
!       that return the number of expected neutrinos  
!       per detector
!
!##########################################################
real(8) function expectedNumberNeutrinosDetectorFromSumOfBin(d,t13,dm31)
    use db_data, only: NBIN
    implicit none     
    integer :: d                  ! is the number of detector   
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested
    real(8) :: expectedNumberNeutrinosDetectorBin    
    integer :: P                  ! P is the number of the period of data collected
    integer :: i    
    real(8) :: result
    
    result=0.0d0
    do i=1,NBIN
        result= result + expectedNumberNeutrinosDetectorBin(1,d,i,t13,dm31) &
                       + expectedNumberNeutrinosDetectorBin(2,d,i,t13,dm31) &
                       + expectedNumberNeutrinosDetectorBin(3,d,i,t13,dm31)
    enddo
    expectedNumberNeutrinosDetectorFromSumOfBin=result
    return
end function expectedNumberNeutrinosDetectorFromSumOfBin