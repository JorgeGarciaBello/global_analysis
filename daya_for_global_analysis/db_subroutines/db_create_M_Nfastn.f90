subroutine db_create_M_Nfastn(t13,dmee,VNfastn)
    use db_data, only: NBIN, PD
    implicit none
    real(8) :: t13,dmee
    real(8) :: VNfastn(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_M_Nfastn_ij
    integer :: i,j,u

    !call db_generate_B_Nfastn()
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD            
            VNfastn(i,j)=db_M_Nfastn_ij(t13,dmee,i,j)            
        enddo       
    enddo
!    call db_write_matrix(NBIN*2*PD,VNfastn,'M_Nfastn')
!    call db_write_matrix_m_n(NBIN*2*PD,VNfastn,'M_M_Nfastn')
    return
end subroutine db_create_M_Nfastn