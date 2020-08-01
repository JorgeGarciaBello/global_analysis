function DC_expected_antineutrino_number_detector_bin(d,bin,t13,dmee)
    use types
    implicit none
    real(dp) :: DC_expected_antineutrino_number_detector_bin
    integer  :: d,bin
    real(dp) :: t13,dmee
    real(dp) :: DC_expected_antineutrino_number_detector_reactor_bin
    real(dp) :: result

    result=0.0_dp
    result=DC_expected_antineutrino_number_detector_reactor_bin(d,1,bin,t13,dmee)+ &
           DC_expected_antineutrino_number_detector_reactor_bin(d,2,bin,t13,dmee)
           
    DC_expected_antineutrino_number_detector_bin=result
    return
end function DC_expected_antineutrino_number_detector_bin