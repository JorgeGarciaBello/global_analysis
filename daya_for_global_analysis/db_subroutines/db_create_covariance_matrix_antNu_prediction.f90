subroutine db_create_covariance_matrix_antNu_prediction()
    implicit none
    integer :: n=10000
    integer :: k
    real(8) :: result

    result=0.0d0
    do k=1,n
        !call db_create_covariance_matrix_prompt_spectrum()
        !n
    enddo

    result=result/real(n)

    return
end subroutine db_create_covariance_matrix_antNu_prediction