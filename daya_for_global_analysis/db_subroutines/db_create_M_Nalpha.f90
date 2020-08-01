subroutine db_create_M_Nalpha(t13,dmee,VNalpha)
    use db_data, only: NBIN, PD                       
    implicit none
    real(8) :: t13,dmee
    real(8) :: VNalpha(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_M_Nalpha_ij
    integer :: i,j,u

    !call db_generate_B_Nalpha()
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD            
            VNalpha(i,j)=db_M_Nalpha_ij(t13,dmee,i,j)            
        enddo       
    enddo
    !call db_write_matrix(NBIN*2*PD,VNalpha,'M_Nalpha')
    !call db_write_matrix_m_n(NBIN*2*PD,VNalpha,'M_M_Nalpha')
    return
end subroutine db_create_M_Nalpha