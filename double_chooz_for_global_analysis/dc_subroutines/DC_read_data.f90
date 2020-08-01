subroutine DC_read_data()
    use types
    use DC_settings, only: NBIN
    use DC_data
    implicit none
    integer :: i,j,u

    !open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_bins.dat', status='old')
    !    read(u,*) ((bins(i,j), j=1,2), i=1,NBIN)
    !close(u)
    !open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_far_obs.dat', status='old')
    !    read(u,*) far_obs
    !close(u)
    !open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_far_exp.dat', status='old')
    !    read(u,*) far_exp
    !close(u)

    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_bines.dat', status='old')
        read(u,*) ((bines_p(i,j), j=1,2), i=1,NBIN)
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_length_d_r.dat', status='old')
        read(u,*) ((length_d_r(i,j), j=1,2), i=1,RCTRS)
    close(u)
    
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_N_n_obs.dat', status='old')
        read(u,*) N_n_obs
    close(u)    
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_N_f_obs.dat', status='old')
        read(u,*) N_f_obs
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_N_n_exp.dat', status='old')
        read(u,*) N_n_exp
    close(u)    
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_N_f_exp.dat', status='old')
        read(u,*) N_f_exp
    close(u)
    

    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_fast_neutron_n.dat', status='old')
        read(u,*) fast_neutron_n
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_9_Litio_n.dat', status='old')
        read(u,*) litio_n
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_accidental_n.dat', status='old')
        read(u,*) accidental_n
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_fast_neutron_f.dat', status='old')
        read(u,*) fast_neutron_f
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_9_Litio_f.dat', status='old')
        read(u,*) litio_f
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_accidental_f.dat', status='old')
        read(u,*) accidental_f
    close(u)


    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_spectrum.dat', status='old')
        read(u,*) spectrum
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_thermal_power.dat', status='old')
        read(u,*) thermal_power
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_fission_fractions.dat', status='old')
        read(u,*) fission_fractions
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_mean_energy_released_per_fission.dat', status='old')
        read(u,*) mean_energy_released_per_fission
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_mean_cross_section.dat', status='old')
        read(u,*) mean_cross_section
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_target_proton.dat', status='old')
        read(u,*) target_proton
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_efficiency.dat', status='old')
        read(u,*) efficiency
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_live_days.dat', status='old')
        read(u,*) live_days
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_calibration.dat', status='old')
        read(u,*) calibration
    close(u)
    

    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_fast_neutron_n.dat', status='old')
        read(u,*) sigma_fast_neutron_n
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_9_Litio_n.dat', status='old')
        read(u,*) sigma_litio_n
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_accidental_n.dat', status='old')
        read(u,*) sigma_accidental_n
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_fast_neutron_f.dat', status='old')
        read(u,*) sigma_fast_neutron_f
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_9_Litio_f.dat', status='old')
        read(u,*) sigma_litio_f
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_accidental_f.dat', status='old')
        read(u,*) sigma_accidental_f
    close(u)

    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_spectrum.dat', status='old')
        read(u,*) sigma_spectrum
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_thermal_power.dat', status='old')
        read(u,*) sigma_thermal_power
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_fission_fractions.dat', status='old')
        read(u,*) sigma_fission_fractions
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_mean_energy_released_per_fission.dat', status='old')
        read(u,*) sigma_mean_energy_released_per_fission
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_mean_cross_section.dat', status='old')
        read(u,*) sigma_mean_cross_section
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_target_proton.dat', status='old')
        read(u,*) sigma_target_proton
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_efficiency.dat', status='old')
        read(u,*) sigma_efficiency
    close(u)

    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_sigma_energy.dat', status='old')
        read(u,*) sigma_energy
    close(u)
    open(newunit=u, file='double_chooz_for_global_analysis/dc_data/DC_ro_energy.dat', status='old')
        read(u,*) ro_energy
    close(u)
    
    !DO i=1, 2
    !PRINT*,'sigma_energy',sigma_energy
    !PRINT*,'ro_energy',ro_energy
    !enddo    
    call DC_generate_MC_data()
    return
end subroutine DC_read_data