program main_random
    implicit none
    integer, parameter :: seed = 123456789
    real(8) :: r8_normal_01, r
    integer :: i


    do i = 1, 10
        r = r8_normal_01 ( seed )
        write ( *, '(2x,i8,2x,g14.6)' ) i, r
    end do
end program main_random