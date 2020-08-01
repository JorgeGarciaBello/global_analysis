subroutine db_read_matrix(t13,dmee,dim,V,name)
    use db_data, only: NBIN, PD
    implicit none
    real(8) :: t13,dmee
    integer :: dim    
    real(8) :: V(dim,dim)
    Character(len = *) :: name
    Character(len = 60) :: filename    
    integer :: i,j,u

    filename='db_data/'//name
    open(newunit=u, file=filename)
    do i=1,dim
            read(u,*) V(i,:)
    enddo
    close(u)
    return
 end subroutine db_read_matrix