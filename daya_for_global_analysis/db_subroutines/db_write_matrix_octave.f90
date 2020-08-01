subroutine db_write_matrix_octave(dim,V,name)
    use db_data, only: n
    implicit none
    integer :: dim
    real(8) :: V(dim)
    Character(len = *) :: name
    Character(len = 60) :: filename
    integer :: i,j,u
    real(8) :: vector(n,n)
    
    filename='db_data/db_'//name//'.dat'
    !open(newunit=u, file=filename)
    !    do i=1,n            
            !vector(i)=V(j)            
    !    enddo
    !    write()
   ! close(u)
    return
end subroutine db_write_matrix_octave