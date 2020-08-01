module DC_data
    use types
    use DC_settings
    implicit none
    real(dp) :: bins(NBIN,2)
    real(dp) :: far_obs(NBIN)
    real(dp) :: far_exp(NBIN)

    real(dp) :: bines_p(NBIN,2)
    real(dp) :: length_d_r(ADS,RCTRS)
    
    real(dp) :: N_n_obs(NBIN)
    real(dp) :: N_f_obs(NBIN)
    real(dp) :: N_n_exp(NBIN)
    real(dp) :: N_f_exp(NBIN)

    real(dp) :: fast_neutron_n(NBIN)
    real(dp) :: litio_n(NBIN)
    real(dp) :: accidental_n(NBIN)
    real(dp) :: fast_neutron_f(NBIN)
    real(dp) :: litio_f(NBIN)
    real(dp) :: accidental_f(NBIN)

    real(dp) :: spectrum(NBIN)
    real(dp) :: thermal_power(ADS)
    real(dp) :: fission_fractions(4)
    real(dp) :: mean_energy_released_per_fission
    real(dp) :: mean_cross_section(NBIN)
    real(dp) :: target_proton(ADS)
    real(dp) :: efficiency(ADS)

    real(dp) :: live_days(ADS)
    real(dp) :: calibration(ADS)

    real(dp) :: sigma_fast_neutron_n(NBIN)
    real(dp) :: sigma_litio_n(NBIN)
    real(dp) :: sigma_accidental_n(NBIN)
    real(dp) :: sigma_fast_neutron_f(NBIN)
    real(dp) :: sigma_litio_f(NBIN)
    real(dp) :: sigma_accidental_f(NBIN)

    real(dp) :: sigma_spectrum(NBIN)
    real(dp) :: sigma_thermal_power(ADS)
    real(dp) :: sigma_fission_fractions(4)
    real(dp) :: sigma_mean_energy_released_per_fission
    real(dp) :: sigma_mean_cross_section(NBIN) 
    real(dp) :: sigma_target_proton(ADS)    
    real(dp) :: sigma_efficiency(ADS)

    real(dp) :: rand_Nspectrum_R1(NBIN,num_experiments)
    real(dp) :: rand_Nspectrum_R2(NBIN,num_experiments)
    real(dp) :: rand_Nthermalpower(NBIN,RCTRS,num_experiments)
    real(dp) :: rand_Nfissionfraction(NBIN,RIR,num_experiments)
    real(dp) :: rand_Navrgenergyperfission(NBIN,num_experiments)
    real(dp) :: rand_Ncrosssection(NBIN,num_experiments)
    real(dp) :: rand_Nefficiency(NBIN,ADS,num_experiments)
    real(dp) :: rand_Nbkgtotal(NBIN,ADS,3,num_experiments)

    real(dp) :: sigma_energy(3)
    real(dp) :: ro_energy(3)
           

end module DC_data