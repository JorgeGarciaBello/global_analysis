real(8) function db_probability_for_Etrue_bin(t13,dmee,d,r,j)
    use db_data, only: p_bines,length_d_r
    implicit none
    real(8) :: t13,dmee         ! are the neutrino oscillation parameters we are interested
    integer :: d,r,j
    real(8) :: probability
    real(8) :: a,b,h,x
    integer :: i,n=5
    real(8) :: result

    a=p_bines(i,1); b=p_bines(i,2)
    h=(b-a)/real(n)
    result=0.0d0
    do i=1,n
        x=a+h*real(i-1)
        result=result + h*(probability(t13,dmee,length_d_r(d,r),x)+probability(t13,dmee,length_d_r(d,r),x+h))/2.0d0
    enddo
    return
end function db_probability_for_Etrue_bin