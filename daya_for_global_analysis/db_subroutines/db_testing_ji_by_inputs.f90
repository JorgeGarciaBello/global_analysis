subroutine db_testing_ji_by_inputs()
    !################################
    !
    !   CAMBIO EN ENERGÍA
    !
    !################################
    !call db_test_energy_per_bin_cr()
    !call db_test_simga_energy_per_bin_cr()   ! bin 13porcentaje 6
    !call db_test_simga_energy_cr()
    !################################
    !
    !   CAMBIO EN THERMAL POWER
    !
    !################################
    !call db_test_simga_thermal_power_cr()
    !################################
    !
    !   CAMBIO EN EFICIENCIA
    !
    !################################
    !call db_test_sigma_efficiency()
    !################################
    !
    !   CAMBIO EN THEMAL POWER Y ENERGÍA
    !
    !################################
    call db_test_simga_TP_energy_cr()

    return
end subroutine db_testing_ji_by_inputs