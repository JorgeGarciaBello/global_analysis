subroutine db_set_diagonal_matrix_elemets(V,dim,data)
    implicit none
    integer :: dim
    real(8) :: V(dim,dim)
    real(8) :: data(dim)
    integer :: i
    V=0.0d0
    do i=1,dim
        V(i,i)=data(i)
    enddo
    return
end subroutine db_set_diagonal_matrix_elemets