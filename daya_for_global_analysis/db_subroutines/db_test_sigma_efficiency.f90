subroutine db_test_sigma_efficiency()
    use db_data, only: i_name,j_name,name_test,sigma_efficiency,bin_name
    implicit none
    real(8) :: array_values(5)
    integer :: i,j,u
    
    print*, 'db_test_sigma_efficiency'
    name_test='db_sigma_efficiency_test'
    array_values=(/2.0d0,2.3d0,2.5d0,2.8d0,3.0d0/)    
    do i_name=1,5
        open(newunit=u, file='db_data/db_sigma_efficiency.dat', status='old')
            read(u,*) sigma_efficiency
        close(u)
        print*, 'sigma_efficiency', sigma_efficiency

        sigma_efficiency=array_values(i_name)
        open(newunit=u, file='db_data/db_sigma_efficiency.dat', status='old')
            write(u,*) sigma_efficiency
        close(u)
        print*, 'sigma_efficiency', sigma_efficiency
        call readDBData()      ! Lee datos de Dayabay
        call grid_setting()    ! Genera eventos asociados a los parámetros de oscilación
        call db_spectral_analysis()
    enddo
    sigma_efficiency=1.93d0
    open(newunit=u, file='db_data/db_sigma_efficiency.dat', status='old')
        write(u,*) sigma_efficiency
    close(u)

end subroutine db_test_sigma_efficiency