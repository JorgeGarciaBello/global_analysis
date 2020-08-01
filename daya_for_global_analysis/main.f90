program main_global
    implicit none
    print*,'### Daya Bays statistical analysis ###'
    print*,' '

    !call readDBData()      ! Lee datos de Dayabay
    !call db_testing_ji_by_inputs()
    !stop

    !call db_confidence_regions_from_octave_data()
    !stop   
    call readDBData()      ! Lee datos de Dayabay
    call grid_setting()    ! Genera eventos asociados a los parámetros de oscilación
    !############################################
    !
    !   Selección de análisis a realizarv
    !
    !############################################
    call db_spectral_analysis()
    !call db_rate_analysis()
    !call db_test()
    
    return
end program main_global