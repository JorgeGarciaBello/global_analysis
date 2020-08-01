function DC_M_expected_antineutrino_number_detector_bin(d,bin,k_rand,t13,dmee,e_a,e_b,e_c)
    use types
    implicit none
    real(dp) :: DC_M_expected_antineutrino_number_detector_bin
    integer  :: d,bin,k_rand
    real(dp) :: t13,dmee
    real(dp) :: DC_M_expected_antineutrino_number_detector_reactor_bin
    real(dp) :: result
    real(dp) :: e_a,e_b,e_c

    result=0.0_dp
    result=DC_M_expected_antineutrino_number_detector_reactor_bin(d,1,bin,k_rand,t13,dmee,e_a,e_b,e_c)+ &
           DC_M_expected_antineutrino_number_detector_reactor_bin(d,2,bin,k_rand,t13,dmee,e_a,e_b,e_c)
           
    DC_M_expected_antineutrino_number_detector_bin=result
    return
end function DC_M_expected_antineutrino_number_detector_bin