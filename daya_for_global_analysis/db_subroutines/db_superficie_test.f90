subroutine db_superficie_test()
    use db_data
    implicit none
    real(8) :: Y(12)                           !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )    
    real(8) :: t13, dm31, chi_data
    real(8) :: chi_dayabay
    integer :: i

    call create_data_base_by_detector_from_osc_parameters()

    Y=0.0d0
    do i=1,1
        k=i        
        Y(2)=grid_events_data_points(i,1)     ! s22t13
        Y(11)=grid_events_data_points(i,2)    ! dm31 [eV^2]
        call chi2_db(Y,chi_dayabay)
    enddo



    return
end subroutine db_superficie_test