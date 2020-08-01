real(8) function get_chi_square_from_a_set_of_pulls(X)
    use db_data, only: NDIM
    implicit none
    REAL*8     X(NDIM)
    real(8) :: FUNC

    get_chi_square_from_a_set_of_pulls=0.0d0
    get_chi_square_from_a_set_of_pulls=FUNC(X)
    return
end function get_chi_square_from_a_set_of_pulls