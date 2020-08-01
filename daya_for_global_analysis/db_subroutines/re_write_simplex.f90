subroutine reWriteSimplex(newSimplex)
    use db_data, only: NDIM
    implicit none
    real(8) :: newSimplex(NDIM+1,NDIM)
    integer :: i,u

    open(newunit=u,file='db_data/db_simplex.dat',status='old')
        do i=1,NDIM+1
            write(u,*) newSimplex(i,:)
        enddo
    close(u)

    return
end subroutine reWriteSimplex