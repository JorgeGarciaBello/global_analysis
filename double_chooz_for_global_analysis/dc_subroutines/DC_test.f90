subroutine DC_test()
    use types
    use DC_settings, only: NBIN,num_experiments
    implicit none
    real(dp) :: DC_reactor_spectrum
    real(dp) :: DC_expected_neutrino_spectrum_dr
    real(dp) :: DC_expected_antineutrino_number_detector_reactor_bin
    real(dp) :: DC_expected_antineutrino_number_detector_bin
    real(dp) :: DC_M_reactor_spectrum
    real(dp) :: DC_M_expected_neutrino_spectrum_dr
    real(dp) :: DC_M_expected_antineutrino_number_detector_reactor_bin
    real(dp) :: DC_M_expected_antineutrino_number_detector_bin
    real(dp) :: x
    real(dp) :: t13,dmee
    real(dp) :: M_stat(NBIN,NBIN),M_acc(NBIN,NBIN)
    integer  :: i,j,d,r,bin,k_rand
    real(dp) :: rand_w_i(NBIN,num_experiments),DC_energy_product
    real(dp) :: U(NBIN),Nbar_i(NBIN,num_experiments),V(NBIN,NBIN),V_e(3,3)
    real(dp) :: DC_prompt_to_antineutrino_energy
    real(dp) :: result,e_a,e_b,e_c

    call DC_generate_MC_data()
    t13=0.0_dp
    dmee=0.0_dp
    !d=2
    !r=2
    !k_rand=1
    !do i=1,38
        !x=1.81_dp+(12.0_dp/50)*i
    !    print*, i, DC_expected_antineutrino_number_detector_bin(d,i,t13,dmee), &
    !               DC_M_expected_antineutrino_number_detector_bin(d,i,k_rand,t13,dmee)
    !enddo
    !call DC_generate_weight_w_systematic_array(t13,dmee,rand_w_i)
    !call DC_generate_vectors_U(t13,dmee,Nbar_i,U)
    !call DC_create_statistical_matrix(M_stat)
    !call DC_create_accidental_matrix(M_acc)
    !do i=1,38
        !print*, 'hola',rand_w_i(i,1),rand_w_i(i,2),rand_w_i(i,3),rand_w_i(i,4),rand_w_i(i,5)
        !print*, Nbar_i(i,1)
    !    print*,U(i)
    !enddo
    e_a=0.010_dp
    e_b=0.010_dp
    e_c=0.010_dp
    result=DC_prompt_to_antineutrino_energy(2.0_dp,e_a,e_b,e_c)
    print*,result
    !call DC_create_M_stat_signal_bkg(t13,dmee,U,V)    
    return
end subroutine DC_test
