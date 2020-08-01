subroutine db_create_M_Nacc(t13,dmee,VNacc)
    use db_data, only: NBIN, PD                       
    implicit none
    real(8) :: t13,dmee
    real(8) :: VNacc(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_M_Nacc_ij
    integer :: i,j,u

    !call db_generate_B_Nacc()
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD
            VNacc(i,j)=db_M_Nacc_ij(t13,dmee,i,j)            
        enddo       
    enddo
    !call db_write_matrix(NBIN*2*PD,VNacc,'M_Nacc')
    !call db_write_matrix_m_n(NBIN*2*PD,VNacc,'M_M_Nacc')
    return
end subroutine db_create_M_Nacc