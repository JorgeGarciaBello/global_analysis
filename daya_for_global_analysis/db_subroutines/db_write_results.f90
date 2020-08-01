subroutine db_write_results(dim,V,name)
    use db_data, only: t13_M_data,dm_M_data
    implicit none
    integer :: dim
    real(8) :: V(dim,dim)
    real(8) :: t13, dmee
    Character(len = *) :: name
    Character(len = 200) :: filename
    integer :: i,j,u
    
    filename='db_data/db_chi_matrix_'//name
    open(newunit=u, file=filename)
        do i=1,dim
            write(u,*) V(i,:)
        enddo
    close(u)

    filename='db_data/'//name
    open(newunit=u, file=filename)
    do i=1,dim
        do j=1,dim
            t13=t13_M_data(i,j);dmee=dm_M_data(i,j)            
            write(u,*) sin(2.0d0*t13)**2, dmee, V(i,j)
        enddo
        write(u,*) ' '
    enddo
    close(u)
    return
end subroutine db_write_results