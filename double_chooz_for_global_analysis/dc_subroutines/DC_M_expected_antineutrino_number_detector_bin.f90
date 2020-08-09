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
           !print*,'d,bin,k_rand,t13,dmee,e_a,e_b,e_c: ',d,bin,k_rand,t13,dmee,e_a,e_b,e_c,result
    DC_M_expected_antineutrino_number_detector_bin=result
    !if(DC_M_expected_antineutrino_number_detector_bin==0) then
    !    print*,DC_M_expected_antineutrino_number_detector_reactor_bin(1,1,bin,k_rand,t13,dmee,e_a,e_b,e_c)+ &
    !       DC_M_expected_antineutrino_number_detector_reactor_bin(1,2,bin,k_rand,t13,dmee,e_a,e_b,e_c)
    !    pause
    !end if
    return
end function DC_M_expected_antineutrino_number_detector_bin