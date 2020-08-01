function DC_FUNC(t13,dmee,P)
    use types
    use DC_settings, only: NBIN,NDIM
    use DC_data, only: far_obs,far_exp,bins,bines_p,N_n_obs,N_f_obs,N_n_exp,N_f_exp
    implicit none
    real(dp) :: DC_FUNC
    real(dp) :: t13,dmee
    real(dp) :: averageProbability3f,probability
    real(dp) :: DC_prompt_to_antineutrino_energy
    real(dp) :: U(NBIN),V(NBIN,NBIN),chi(NBIN,NBIN)
    real(dp) :: newbin(2)
    real(dp) :: l
    integer  :: bin,i,j
    real(dp) :: P(NDIM)
    real(dp) :: e_a,e_b,e_c
    l=1056.0_dp
    e_a=P(1);    e_b=P(2);    e_c=P(3)
    call DC_create_M_stat_signal_bkg(t13,dmee,U,V,e_a,e_b,e_c)
    chi=0.0_dp
    DC_FUNC=0.0_dp
    do i=1,NBIN
        do j=1,NBIN
        chi(i,j)= U(j)*V(i,j)*U(i)
        DC_FUNC=DC_FUNC+chi(i,j)
        enddo
    enddo
    print*, 'func', DC_FUNC
end function DC_FUNC