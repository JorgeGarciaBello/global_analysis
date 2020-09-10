function DC_FUNC(t13,dmee,P)
    use types
    use DC_settings, only: NBIN,NDIM
    use DC_data, only: far_obs,far_exp,bins,bines_p,N_n_obs,N_f_obs,N_n_exp,N_f_exp,live_days, &
                       Li_per_day,Fast_per_day,Acc_per_day,Res_per_day,                        &
                       sigma_Li_per_day,sigma_Fast_per_day,sigma_Acc_per_day,sigma_Res_per_day
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
    real(dp) :: e_a,e_b,e_c,Li,Fast,Acc,Res
    real(dp) :: bkg_pull(4),bkg_pull_day(4),sigma_bkg_pull_day(4)
    e_a=P(1);    e_b=P(2);    e_c=P(3); 

    Li=P(4); Fast=P(5); Acc=P(6); Res=P(7);
    bkg_pull=(/Li,Fast,Acc,Res/)
    bkg_pull_day=(/Li_per_day,Fast_per_day,Acc_per_day,Res_per_day/)
    sigma_bkg_pull_day=(/sigma_Li_per_day,sigma_Fast_per_day,sigma_Acc_per_day,sigma_Res_per_day/)

    call DC_create_M_stat_signal_bkg(t13,dmee,U,V,e_a,e_b,e_c,Li,Fast,Acc,Res)
    chi=0.0_dp
    DC_FUNC=0.0_dp
    do i=1,NBIN
        do j=1,NBIN        
            chi(i,j)= U(j)*V(j,i)*U(i)            
            DC_FUNC=DC_FUNC+chi(i,j)
         if(isnan(DC_FUNC)) stop 'nana in DC_FUNC'
        enddo
    enddo
    do i=1,4
        DC_FUNC=DC_FUNC+((bkg_pull_day(i)-bkg_pull(i))/sigma_bkg_pull_day(i))**2
    enddo

    DC_FUNC=DC_FUNC+((2.484D-3-dmee)/0.036d-3)**2
    !print*,'IN FUNC e_a, e_b, e_c, dmee: ', e_a, e_b, e_c, dmee,DC_FUNC
    print*, 'DC_FUNC: ', DC_FUNC
end function DC_FUNC