subroutine db_create_detector_response_covariance_matrix(Vdr,k)
    use db_data, only: NBIN,num_experiments,data_near,data_far
    implicit none
    integer :: k    
    real(8) :: Vdr(NBIN,NBIN)
    integer :: i, j, u

    
    call db_detector_response_covariance_matrix(num_experiments,data_near,data_far,Vdr,k)
    !open(newunit=u,file='db_data/db_detector_response_covariance_matrix.dat')
    !    do i=1,NBIN
    !        do j=1,NBIN
    !            write(u,*) i,j,Vdr(i,j)
    !        enddo
    !        write(u,*) ''
    !    enddo
    !close(u)
    return
end subroutine db_create_detector_response_covariance_matrix