subroutine db_create_efficiency_cov_M_u(t13,dmee,Veffu)
    use db_data, only: NBIN, PD
    implicit none    
    real(8) :: t13, dmee    
    real(8) :: Veffu(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_cov_efficiency_ij_u
    integer :: i,j
    
    Veffu=0.0D0
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD
            Veffu(i,j)=db_cov_efficiency_ij_u(t13,dmee,i,j)
        enddo
    enddo
    call db_write_matrix(NBIN*2*PD,Veffu,"efficiency_cov_M_u")
    return    
end subroutine db_create_efficiency_cov_M_u