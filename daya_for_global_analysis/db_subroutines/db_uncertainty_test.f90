subroutine db_uncertainty_test
    use db_data, only: NBIN, PD, num_experiments
    implicit none
    real(8) :: t13, dmee
    real(8) :: expectedNeutrinoSpectrum_d
    real(8) :: expectedNumberNeutrinosDetectorBin
    real(8) :: expectedNumberNeutrinoByHallPeriodBin
    real(8) :: db_chi_square_spectral_analysis2_period
    real(8) :: db_create_w_i
    real(8) :: product
    real(8) :: db_cov_M_total_antineutrino_flux
    real(8) :: db_cov_M_expected_antineutrino_spectrum_detector_reactor
    real(8) :: db_cov_M_expected_antineutrino_spectrum_detector
    real(8) :: db_cov_M_expected_antineutrino_spectrum_period_detector_bin
    real(8) :: db_cov_M_expected_antineutrino_number_hall_period_bin
    real(8) :: db_cov_M_expected_antineutrino_number_period_detector_bin
    real(8) :: db_cov_M_expected_antineutrino_number_near_bin
    real(8) :: db_cov_M_expected_antineutrino_number_far_bin
    real(8) :: db_expected_antineutrino_number_all_bin_n
    real(8) :: db_expected_antineutrino_number_all_bin_f
    real(8) :: db_M_Nsignal_ij    
    real(8) :: rand_W_k(156)
    real(8) :: rand_w_i(156,num_experiments)
    real(8) :: V(NBIN*2*PD,NBIN*2*PD)
    real(8) :: N_i(156)
    real(8) :: x
    integer :: d,r, P, H
    integer :: i,j,iso,n
    real(8) :: result, chi
    real :: t1,t2
    real(8) :: db_ji_cuadrada

    
    t13=0.0d0
    dmee=0.0d0 
    

    result=db_chi_square_spectral_analysis2_period(t13,dmee)

    print*, 'result', result

    stop

    call cpu_time(t1)
    call db_generate_weight_w_array(t13,dmee,rand_W_k)
    call cpu_time(t2)
    print*, 'db_generate_weight_w_array: ', t2-t1

    call cpu_time(t1)
    call db_create_M_stat_signal_bkg(t13,dmee,rand_W_k,V)
    call cpu_time(t2)
    print*, 'db_create_M_stat_signal_bkg: ', t2-t1
    stop






    call cpu_time(t1)
    call db_create_vectors_N(t13,dmee,rand_W_k,N_i)
    call cpu_time(t2)
    print*, 'db_create_vectors_N: ', t2-t1


    call cpu_time(t1)
    chi=0.0d0
    do i=1, NBIN*2*PD                                            ! (# de biines)*(# de combinaciones FAR/NEAR)*(# de periodos de colecta de datos)        
        do j=1,NBIN*2*PD                                        ! (# de biines)*(# de combinaciones FAR/NEAR)*(# de periodos de colecta de datos)            
            chi=chi+N_i(j)*V(i,j)*N_i(i)
        enddo
    enddo
    call cpu_time(t2)
    print*,'chi', chi
    print*, 'JI_cuadrada: ', t2-t1



    !call cpu_time(t1)
    !print*,'db_uncertainty_test'
    !print*, db_chi_square_spectral_analysis2_period(t13,dmee)
    !call cpu_time(t2)
    !print*, 'time: ', t2-t1
    return
end subroutine db_uncertainty_test