subroutine db_get_inverse_covariance_matrix(dim,V)
    implicit none
    integer :: dim
    real(8) :: V(dim,dim)
    integer :: i,j
    ! Inputs for DGETRI 
    integer :: N
    integer :: LDA
    integer :: IPIV(dim)
    integer :: LWORK
    
    !Outputs for DGETRI
    real(8) :: WORK(dim)
    integer :: INFO,u

    N=dim
    LDA=dim
    LWORK=dim
    
    CALL DGETRF( dim , dim , V,  dim , IPIV, INFO )
    !PRINT*, 'INFO', INFO
    
    call DGETRI( N, V, LDA, IPIV, WORK, LWORK, INFO )
    
    !PRINT*, 'INFO', INFO
    !open(newunit=u, file='db_data/db_inverse_covariance_matrix.dat')
    !do i=1,dim
    !    do j=1,dim
    !        write(u,*) i,j,V(i,j)
    !    enddo
    !    write(u,*) ' '
    !enddo
    !close(u)
    return
end subroutine db_get_inverse_covariance_matrix