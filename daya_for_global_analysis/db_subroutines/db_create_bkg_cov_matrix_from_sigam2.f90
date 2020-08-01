subroutine db_create_bkg_cov_matrix_from_sigam2(Vbkg,values)
    use db_data, only: NBIN, N_i
    implicit none
    real(8) :: Vbkg(NBIN,NBIN)
    real(8) :: values(NBIN,5)
    integer :: i
    Vbkg=0.0d0
    ! Accidental background
    do i=1,NBIN
        Vbkg(i,i)=values(i,1)
    enddo
    ! Alpha-N background
    do i=1,NBIN
        Vbkg(i,i)=Vbkg(i,i)+values(i,2)
    enddo
    ! AmC background
    do i=1,NBIN
        Vbkg(i,i)=Vbkg(i,i)+values(i,3)
    enddo
    ! 8Li/9He background
    do i=1,NBIN
        Vbkg(i,i)=Vbkg(i,i)+values(i,4)
    enddo
    ! fast Neutron background
    do i=1,NBIN
        Vbkg(i,i)=Vbkg(i,i)+values(i,5)
    enddo
    return
end subroutine db_create_bkg_cov_matrix_from_sigam2
