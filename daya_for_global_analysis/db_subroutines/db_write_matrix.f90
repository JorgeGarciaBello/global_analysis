subroutine db_write_matrix(dim,V,name)
    implicit none
    integer :: dim
    real(8) :: V(dim,dim)
    Character(len = *) :: name
    Character(len = 60) :: filename
    integer :: i,j,u
    
    filename='db_data/db_'//name//'.dat'
    open(newunit=u, file=filename)
        do i=1,dim
            do j=1,dim
                write(u,*) i,j,V(i,j)
            enddo
            write(u,*) ''
        enddo
    close(u)
    return
end subroutine db_write_matrix