subroutine db_create_bkg_covM_Nacc(t13,dmee,VNacc)
    use db_data, only: NBIN, PD                       
    implicit none
    real(8) :: t13,dmee
    real(8) :: VNacc(NBIN*2*PD,NBIN*2*PD)

    real(8) :: db_cov_bkg_Nacc_ij
    integer :: i,j,u

    open(newunit=u, file='db_data/db_bkg_covM_Nacc_new.dat')
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD
            VNacc(i,j)=db_cov_bkg_Nacc_ij(t13,dmee,i,j)
            !VNacc(i,i)=db_cov_bkg_Nacc_ij(t13,dmee,i,i)
            write(u,*) i,j,VNacc(i,j)
        enddo
        write(u,*) ' '
    enddo
    close(u)
    return
end subroutine db_create_bkg_covM_Nacc
