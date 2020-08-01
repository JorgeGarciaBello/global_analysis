subroutine db_create_M_Signal(t13,dmee,Vsignal)
    use db_data, only: NBIN, PD
    implicit none
    real(8) :: t13,dmee
    real(8) :: Vsignal(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_M_Nsignal_ij
    integer :: i,j,u

    !call db_generate_B_Nsignal()
    call db_generate_weight_w_systematic_array(t13,dmee)    
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD            
            Vsignal(i,j)=db_M_Nsignal_ij(t13,dmee,i,j)            
        enddo       
    enddo
    !call db_write_matrix(NBIN*2*PD,Vsignal,'M_Nsignal_plus_bkg')
    !call db_write_matrix_m_n(NBIN*2*PD,Vsignal,'M_M_Nsignal_plus_bkg')
    return
end subroutine db_create_M_Signal