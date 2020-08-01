subroutine db_test_simga_energy_per_bin_cr()
    use db_data, only: i_name,j_name,name_test,sigma_energy_bin,bin_name
    implicit none
    real(8) :: array_values(4)
    integer :: i,j,u
    
    print*, 'db_test_simga_energy_per_bin_cr'
    name_test='db_sigma_energy_test'
    array_values=(/1.0d0,3.0d0,5.0d0,8.0d0/)
    do bin_name=1,26
        do i_name=1,4
            open(newunit=u, file='db_data/db_sigma_energy_per_bin.dat', status='old')
                read(u,*) sigma_energy_bin
            close(u)
            print*, 'sigma_energy_bin', sigma_energy_bin

            sigma_energy_bin(bin_name)=array_values(i_name)
            open(newunit=u, file='db_data/db_sigma_energy_per_bin.dat', status='old')
                write(u,*) sigma_energy_bin
            close(u)
            print*, 'sigma_energy_bin', sigma_energy_bin
            call readDBData()      ! Lee datos de Dayabay
            call grid_setting()    ! Genera eventos asociados a los parámetros de oscilación
            call db_spectral_analysis()
        enddo
        sigma_energy_bin=0.5d0
        open(newunit=u, file='db_data/db_sigma_energy_per_bin.dat', status='old')
            write(u,*) sigma_energy_bin
        close(u)
    enddo
end subroutine db_test_simga_energy_per_bin_cr