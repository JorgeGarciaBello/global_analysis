subroutine random_array_from_one_sigma_error(n,val,ra)
    implicit none
    integer :: n
    real(8) :: val    
    real(8) :: min,max,sigma_1
    real(8) :: r
    real(8) :: ra(n)
    real :: random_normal
    integer :: i   
    
    sigma_1=sqrt(val); min=val-sigma_1; max=val+sigma_1

    do i=1,n
        CALL RANDOM_NUMBER(r)
        ra(i)=min*(1.0d0-r) + max*r
    end do
    return
end subroutine random_array_from_one_sigma_error