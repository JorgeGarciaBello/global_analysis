subroutine DC_create_M_stat_signal_bkg(t13,dmee,U,V,e_a,e_b,e_c,Li,Fast,Acc,Res)
    use types
    use DC_settings, only: NBIN,num_experiments
    use DC_data, only: 
    implicit none
    real(dp) :: t13,dmee    
    real(dp) :: U(NBIN),V(NBIN,NBIN)    
    real(dp) :: Nbar_i(NBIN,num_experiments)    
    real(dp) :: Vstat(NBIN,NBIN)
    real(dp) :: DC_M_Total_ij
    integer  :: i,j
    real(dp) :: e_a,e_b,e_c,Li,Fast,Acc,Res
    call DC_generate_vectors_U(t13,dmee,Nbar_i,U,e_a,e_b,e_c,Li,Fast,Acc,Res)
    do i=1,NBIN
        do j=1,NBIN
            V(i,j)=DC_M_Total_ij(i,j,Nbar_i,U)
        enddo
    enddo
    call DC_create_statistical_matrix(Vstat)
    V=V+Vstat
    !V=Vstat
    !call write_matrix(NBIN,V,'DC_M_stat_signal_bkg')
    !call write_matrix_m_n(NBIN,V,'DC_M_M_stat_signal_bkg')
    call db_get_inverse_covariance_matrix(NBIN,V)
    !call write_matrix(NBIN,V,"DC_M_inv_stat_signal_bkg")
    return
end subroutine DC_create_M_stat_signal_bkg