subroutine db_create_bkg_covM_Namc(t13,dmee,VNamc)
    use db_data, only: NBIN, PD                       
    implicit none
    real(8) :: t13,dmee
    real(8) :: VNamc(NBIN*2*PD,NBIN*2*PD)

    real(8) :: db_cov_bkg_Namc_ij
    integer :: i,j,u

    open(newunit=u, file='db_data/db_bkg_covM_Namc_new.dat')
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD
            VNamc(i,j)=db_cov_bkg_Namc_ij(t13,dmee,i,j)
            write(u,*) i, j, VNamc(i,j)
        enddo
        write(u,*) ' '
    enddo
    close(u)
    return
end subroutine db_create_bkg_covM_Namc