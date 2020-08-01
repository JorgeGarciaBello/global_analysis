!##########################################################
!
!   expectedNumberNeutrinosHall is the function 
!       that return the number of expected neutrinos  
!       per experimental hall
!
!##########################################################
real(8) function expectedNumberNeutrinosHall(hall,t13,dm31)
    use db_data, only: NBIN    
    implicit none    
    integer :: hall                               ! is the number of experimental hall    
    real(8) :: t13,dm31
    real(8) :: expectedNumberNeutrinoByHallAndBin !is the function that return the expected number of neutirnos by detector and energy-bin    
    integer :: i

    expectedNumberNeutrinosHall=0.0d0
    do i=1,NBIN    
        expectedNumberNeutrinosHall=expectedNumberNeutrinosHall+expectedNumberNeutrinoByHallAndBin(hall,i,t13,dm31)
    enddo
    return
end function expectedNumberNeutrinosHall