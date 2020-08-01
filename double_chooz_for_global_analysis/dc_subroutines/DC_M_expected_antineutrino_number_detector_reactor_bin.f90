!####################################################################
!
!   DC_M_expected_antineutrino_number_detector_reactor_bin 
!       is the function that return the
!       expected neutirno spectrum by hall
!
!####################################################################
function DC_M_expected_antineutrino_number_detector_reactor_bin(d,r,bin,k_rand,t13,dmee,e_a,e_b,e_c)
    use types
    use DC_settings, only: NBIN
    use DC_data, only: bines_p,rand_Nefficiency,live_days,calibration!,neutrino_energy
                         
    implicit none    
    real(dp) :: DC_M_expected_antineutrino_number_detector_reactor_bin
    integer  :: d,r,bin,k_rand
    real(dp) :: t13,dmee
    real(dp) :: DC_M_expected_neutrino_spectrum_dr !is the expected neutirno spectrum in the detector "d" from all reactors
    real(dp) :: DC_prompt_to_antineutrino_energy
    real(dp) :: a,b,h                              ! limits of the bin    
    integer  :: k,n=5
    real(dp) :: x,result
    real(dp) :: e_a,e_b,e_c

    a=bines_p(bin,1); b=bines_p(bin,2); h=(b-a)/real(n)
    result=0.0d0
    do k=1,n
        x=a+h*real(k-1)
        !x=neutrino_energy(bin)*x
        !x=DC_prompt_to_antineutrino_energy(1,x)
        x=DC_prompt_to_antineutrino_energy(x,e_a,e_b,e_c)
        result=result+h*(DC_M_expected_neutrino_spectrum_dr(x,   d,r,bin,k_rand,t13,dmee)+     & 
                         DC_M_expected_neutrino_spectrum_dr(x+h, d,r,bin,k_rand,t13,dmee))/2.0d0
    enddo
    select case(d)
        case(1) ! Near detector
            DC_M_expected_antineutrino_number_detector_reactor_bin=rand_Nefficiency(bin,d,k_rand)* &
                                                                 (86400.0d0*live_days(d))*         &
                                                                 0.25d0*(result/(b-a))*            &
                                                                 calibration(d)
                                                                                      
        case(2) ! Far detector
            DC_M_expected_antineutrino_number_detector_reactor_bin=rand_Nefficiency(bin,d,k_rand)*  &
                                                                  (86400.0d0*live_days(d))*         &
                                                                  0.25d0*(result/(b-a))*            &
                                                                  calibration(d)                                                                                      
    end select
    return
end function DC_M_expected_antineutrino_number_detector_reactor_bin