subroutine db_statistical_covariance_matrix_H2_7AD(V)
    use db_data, only: NBIN,N_obs_H2_7AD
    implicit none
    real(8) :: V(NBIN,NBIN)
    integer :: i,j,u

    call db_set_diagonal_matrix_elemets(V,NBIN,N_obs_H2_7AD)
    open(newunit=u, file='db_data/db_statistical_covariance_matrix_H2_7AD.dat')
         do i=1,NBIN
            do j=1,NBIN
                write(u,*) i,j,V(i,j)
            enddo
            write(u,*) ''
        enddo
    close(u)
    return
end subroutine db_statistical_covariance_matrix_H2_7AD