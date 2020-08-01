!####################################################################
!
!   DC_M_expected_neutrino_spectrum_dr is the function that return the
!       expected neutirno spectrum in the detector "d" from the
!       reactor "r"
!
!####################################################################
function DC_M_expected_neutrino_spectrum_dr(x,d,r,bin,k_rand,t13,dmee) ![#/MeV]
    use types
    use DC_data, only: length_d_r,target_proton,rand_Ncrosssection
    implicit none    
    real(dp) :: DC_M_expected_neutrino_spectrum_dr
    real(dp) :: x,t13,dmee                  ! Neutrino energy in [MeV]
    integer  :: d,r,bin,k_rand              ! the number ot detector and reactor respectively            
    real(dp) :: DC_probability_of_survival
    real(dp) :: crossSection       ! Is the cross section for the inverse beta decay [m^2]
    real(dp) :: DC_M_reactor_spectrum    ! Is the spectrum of the reactors
    real(dp) :: val1,val2,val3,val4,val5,val6
    !Datos tomados de: Daya Bay Reactor Neutrino Experiment
    !Supplemental Material
    !March 2016
    DC_M_expected_neutrino_spectrum_dr = (1.0D0 / (4.0D0*3.1415D0*length_d_r(d,r)**2))*  &    ![1/m^2]                            
                    DC_probability_of_survival(x,length_d_r(d,r),t13,dmee)*            &
                    DC_M_reactor_spectrum(x,r,bin,k_rand)*                               &    ![#/MeV]                            
                    rand_Ncrosssection(bin,k_rand)*crossSection(x)*                    &    ![m^2]                            
                    target_proton(d)                                                        ![#ofProtons]
    return
end function DC_M_expected_neutrino_spectrum_dr