subroutine db_create_efficiency_cov_M_c(t13,dmee,Veff)
    use db_data, only: NBIN, PD
    implicit none    
    real(8) :: t13, dmee    
    real(8) :: Veff(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_cov_efficiency_ij
    integer :: i,j
    
    Veff=0.0D0
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD
            Veff(i,j)=db_cov_efficiency_ij(t13,dmee,i,j)
        enddo
    enddo
    call db_write_matrix(NBIN*2*PD,Veff,"efficiency_cov_M_c")
    return
end subroutine db_create_efficiency_cov_M_c