subroutine create_data_base_by_detector_from_osc_parameters()
    use db_data, only:  ADS, grid_data_points, grid_events_data_points,delta_chi_db!,n
    use data_settings, only: n,t13_M_data,dm_M_data    
    implicit none    
    integer :: d                            ! d is the detector number
    real(8) :: t13,dm31                     ! are the neutrino oscillation parameters we are interested
    real(8) :: get_number_of_neutrinos_by_detector_from_oscillation_parameters  ! is the function that return the number of neutrinos by detector from fixed neutrino oscillation parameters
    real(8) :: neuN(ADS)    
    integer :: i,j,u
    !$omp parallel do private(dm31,t13,neuN)
    do i=1,n**2
        dm31=grid_data_points(i,1); t13=grid_data_points(i,2);         
        neuN(1)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(1,t13,dm31)
        neuN(2)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(2,t13,dm31)
        neuN(3)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(3,t13,dm31)
        neuN(4)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(4,t13,dm31)
        neuN(5)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(5,t13,dm31)
        neuN(6)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(6,t13,dm31)
        neuN(7)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(7,t13,dm31)
        neuN(8)=get_number_of_neutrinos_by_detector_from_oscillation_parameters(8,t13,dm31)
        grid_events_data_points(i,:)= &
        (/sin(2.0d0*t13)**2, dm31, neuN(1), neuN(2), neuN(3), neuN(4), neuN(5), neuN(6), neuN(7), neuN(8)/)
    enddo
    !$omp end parallel do
    !open(newunit=u,file='data_base_by_detector_from_osc_parameters.dat')
    !    do i=1,n**2
    !    write(u,*) grid_events_data_points(i,:)
    !    enddo
    !close(u)    
    return
end subroutine create_data_base_by_detector_from_osc_parameters