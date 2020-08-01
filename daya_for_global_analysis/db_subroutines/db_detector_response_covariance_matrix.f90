subroutine db_detector_response_covariance_matrix(n,data_near,data_far,Vdr,k)
    use db_data, only: NBIN
    implicit none
    integer :: n
    real(8) :: data_near(NBIN,n), data_far(NBIN,n)
    real(8) :: Vdr(NBIN,NBIN)
    integer :: k
    real(8) :: e_ij
    integer :: i, j

    do i=1,NBIN
        do j=1,NBIN
            call db_create_Vdr_ij_component(n,i,j,data_near,data_far,e_ij,k)
            Vdr(i,j)=e_ij
        enddo
    enddo
    return
end subroutine db_detector_response_covariance_matrix
