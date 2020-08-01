subroutine db_create_M_NLiHe(t13,dmee,VNLiHe)
    use db_data, only: NBIN, PD
    implicit none
    real(8) :: t13,dmee
    real(8) :: VNLiHe(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_M_NLiHe_ij
    integer :: i,j,u

    !call db_generate_B_NLiHe()
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD            
            VNLiHe(i,j)=db_M_NLiHe_ij(t13,dmee,i,j)            
        enddo       
    enddo
!    call db_write_matrix(NBIN*2*PD,VNLiHe,'M_NLiHe')
!    call db_write_matrix_m_n(NBIN*2*PD,VNLiHe,'M_M_NLiHe')
    return
end subroutine db_create_M_NLiHe