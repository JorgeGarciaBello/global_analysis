subroutine db_create_M_Namc(t13,dmee,VNamc)
    use db_data, only: NBIN, PD
    implicit none
    real(8) :: t13,dmee
    real(8) :: VNamc(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_M_Namc_ij
    integer :: i,j,u

    !call db_generate_B_Namc()
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD            
            VNamc(i,j)=db_M_Namc_ij(t13,dmee,i,j)            
        enddo       
    enddo
    !call db_write_matrix(NBIN*2*PD,VNamc,'M_Namc')
    !call db_write_matrix_m_n(NBIN*2*PD,VNamc,'M_M_Namc')
    return
end subroutine db_create_M_Namc