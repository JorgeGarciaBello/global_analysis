subroutine db_create_reactor_cov_M(t13,dmee,Vrctr)
    use db_data, only: NBIN, PD
    implicit none    
    real(8) :: t13, dmee    
    real(8) :: Vrctr(NBIN*2*PD,NBIN*2*PD)
    real(8) :: db_cov_reactor_flux_ij
    integer :: i,j
    
    Vrctr=0.0D0
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD
            Vrctr(i,j)=db_cov_reactor_flux_ij(t13,dmee,i,j)
        enddo
    enddo
    call db_write_matrix(NBIN*2*PD,Vrctr,"reactor_flux_cov_M_c_new")
    return
end subroutine db_create_reactor_cov_M