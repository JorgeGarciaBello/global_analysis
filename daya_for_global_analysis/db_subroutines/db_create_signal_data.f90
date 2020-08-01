subroutine db_create_signal_data(n,data,data_out)
    use db_data, only: NBIN
    implicit none    
    integer :: n
    real(8) :: data(NBIN)
    real(8) :: data_out(NBIN,n)    
    real(8) :: ra(n)
    integer :: i
    
    do i=1,NBIN
        call random_array_from_one_sigma_error(n,data(i),ra)        
        data_out(i,:)=ra
    enddo
    return
end subroutine db_create_signal_data