subroutine db_background_covariance_matrix(n,data,values,Vbkg)
    use db_data, only: NBIN
    implicit none
    integer :: n
    real(8) :: data(NBIN,n)
    real(8) :: values(NBIN)
    real(8) :: Vbkg(NBIN,NBIN)
    real(8) :: e_ij
    integer :: i, j

    do i=1,NBIN
        do j=1,NBIN
            call db_create_Vbkg_ij_component(n,i,j,data,values,e_ij)
            Vbkg(i,j)=e_ij
        enddo
    enddo
    return
end subroutine db_background_covariance_matrix