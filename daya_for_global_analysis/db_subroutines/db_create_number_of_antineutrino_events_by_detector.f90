subroutine db_create_number_of_antineutrino_events_by_detector(t13,dm31)
    use types
    use data_settings, only: n,t13_M_data,dm_M_data
    use db_data, only: neuN
    implicit none    
    real(dp) :: t13,dm31                     ! are the neutrino oscillation parameters we are interested    
    real(dp) :: get_number_of_neutrinos_by_detector_from_oscillation_parameters  ! is the function that return the number of neutrinos by detector from fixed neutrino oscillation parameters        
    integer :: i,j,u
    !print*, 'you are here'
    !do i=1,n
        !!$omp parallel do private(dm31,t13,neuN)
    !    do j=1,n
            !t13=t13_M_data(i,j);  dm31=dm_M_data(i,j);                        
            !neuN(1)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(1,t13,dm31)
            !neuN(2)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(2,t13,dm31)
            !neuN(3)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(3,t13,dm31)
            !neuN(4)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(4,t13,dm31)
            !neuN(5)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(5,t13,dm31)
            !neuN(6)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(6,t13,dm31)
            !neuN(7)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(7,t13,dm31)
            !neuN(8)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(8,t13,dm31)            
    !    enddo
        !!$omp end parallel do
    !enddo
    !$omp parallel do
    do i=1,8
        neuN(i)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(i,t13,dm31)
    enddo
    !$omp end parallel do

    open(newunit=u,file='daya_for_global_analysis/db_data/db_number_of_antineutrino_events_by_detector.dat')
        write(u,*) neuN
    close(u)    
end subroutine db_create_number_of_antineutrino_events_by_detector
