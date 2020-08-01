subroutine DC_generate_weight_w_systematic_array(t13,dmee,rand_w_i,e_a,e_b,e_c)
    use types
    use DC_settings, only: NBIN,num_experiments    
    implicit none
    real(dp) :: t13,dmee
    real(dp) :: rand_w_i(NBIN,num_experiments)
    real(dp) :: DC_M_expected_antineutrino_number_detector_bin
    integer  :: bin,k
    real(dp) :: e_a,e_b,e_c

    rand_w_i=0.0_dp    
    !!$omp parallel do
    do bin=1,NBIN
        do k=1,num_experiments            
            rand_w_i(bin,k)=DC_M_expected_antineutrino_number_detector_bin(2,bin,k,t13,dmee,e_a,e_b,e_c)/ &
                            DC_M_expected_antineutrino_number_detector_bin(1,bin,k,t13,dmee,e_a,e_b,e_c)
        enddo
    enddo
    !!$omp end parallel do
    return
end subroutine DC_generate_weight_w_systematic_array