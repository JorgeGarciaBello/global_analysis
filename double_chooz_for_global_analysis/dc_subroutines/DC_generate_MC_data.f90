subroutine DC_generate_MC_data()
    implicit none
    call DC_generate_spectrum()
    call DC_generate_thermal_power()
    call DC_generate_fission_fraction()
    call DC_generate_mean_energy_released_per_fission()
    call DC_generate_cross_section()
    call DC_generate_efficiency()
    call DC_generate_total_Bkg()
    return
end subroutine DC_generate_MC_data