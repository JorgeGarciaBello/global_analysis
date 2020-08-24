subroutine my()
    use types
    implicit none
    real(dp) :: data(80,80),min_ji
    integer :: i,j,u

    !open(newunit=u, file='data/reno_data_cov.dat')
    open(newunit=u, file='data/chi_matrix_reno_data_cov.dat',status='old')
        read(u,*) ((data(i,j),j=1,80),i=1,80)
    close(u)

    min_ji=minval(data)
    print*,'min_ji', min_ji
    data=data-min_ji

    open(newunit=u, file='data/chi_matrix_reno_data_cov_1.dat')
        do i=1,80            
            write(u,*) data(i,:)            
        enddo
    close(u)
end subroutine my