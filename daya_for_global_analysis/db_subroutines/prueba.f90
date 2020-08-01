subroutine prueba(r)
    implicit none
    real(8) :: r
    call prueba_1()
    print*, 'r', r
    call prueba_2()
    return
end subroutine prueba