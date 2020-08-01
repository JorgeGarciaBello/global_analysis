real(8) function get_number_of_neutrinos_by_detector_from_oscillation_parameters(d,t13,dm31)
    implicit none
    integer :: d                                ! d is the detector number
    real(8) :: t13, dm31                        ! are the neutrino oscillation parameters we are interested
    real(8) :: expectedNumberNeutrinosDetector  ! is the functions that return the neutrino number by detector    
    real(8) :: expectedNumberNeutrinosDetectorFromSumOfBin ! is the functions that return the neutrino number by detector form the sum of the bines    
    
    get_number_of_neutrinos_by_detector_from_oscillation_parameters=0.0d0
    !get_number_of_neutrinos_by_detector_from_oscillation_parameters=expectedNumberNeutrinosDetector(d,t13,dm31)   ! Función que regresa el número de eventos al integrar sobre el rango de enerǵia completo [1.80001- 12.0 MeV]
    get_number_of_neutrinos_by_detector_from_oscillation_parameters=expectedNumberNeutrinosDetectorFromSumOfBin(d,t13,dm31) ! Función que regresa el número de eventos al sumar las eventos que resultan de integrar por cada bin de energía en el rango de [1.80001- 12.0 MeV]
    return
end function get_number_of_neutrinos_by_detector_from_oscillation_parameters