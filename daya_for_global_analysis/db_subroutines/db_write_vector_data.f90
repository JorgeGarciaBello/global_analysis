subroutine db_write_vector_data(dim,V,name)
    implicit none
    integer :: dim
    real(8) :: V(dim)
    Character(len = *) :: name
    Character(len = 60) :: filename
    integer :: i,u
    
    filename='db_data/db_'//name//'.dat'
    open(newunit=u, file=filename)
    do i=1,dim
            write(u,*) V(i)
    enddo
    close(u)
    return
end subroutine db_write_vector_data