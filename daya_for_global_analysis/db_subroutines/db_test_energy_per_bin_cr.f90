subroutine db_test_energy_per_bin_cr()
    use db_data, only: i_name,j_name,name_test,bin_var,bin_name
    implicit none
    real(8) :: array_values(8)
    integer :: i,j,u
    
    print*, 'db_test_energy_per_bin_cr'
    name_test='db_energy_test_mod'
    array_values=(/0.97d0,0.99d0,0.995d0,0.999d0,1.001d0,1.005d0,1.01d0,1.03d0/)    
    
    do bin_name=1,26
        do i_name=1,8
            open(newunit=u, file='db_data/db_bines_variations.dat', status='old')
                read(u,*) bin_var
            close(u)
            print*, 'bin_var', bin_var

            bin_var(bin_name)=array_values(i_name)
            open(newunit=u, file='db_data/db_bines_variations.dat', status='old')
                write(u,*) bin_var
            close(u)
            print*, 'bin_var', bin_var

            call readDBData()      ! Lee datos de Dayabay
            call grid_setting()    ! Genera eventos asociados a los parámetros de oscilación
            call db_spectral_analysis()
        enddo
        bin_var=1.0d0
        open(newunit=u, file='db_data/db_bines_variations.dat', status='old')
            write(u,*) bin_var
        close(u)
    enddo
end subroutine db_test_energy_per_bin_cr