subroutine db_test_simga_energy_cr()
    use db_data, only: i_name,j_name,name_test,sigma_energy_bin
    implicit none
    real(8) :: array_values(9)
    integer :: u
    array_values=(/10.0d0,13.0d0,15.0d0,18.0d0,20.0d0,23.0d0,25.0d0,28.0d0,30.0d0/)
    print*, 'db_test_simga_energy_cr'
    name_test='db_sigma_energy_test'
    do i_name=8,16
            open(newunit=u, file='db_data/db_sigma_energy_per_bin.dat', status='old')
                read(u,*) sigma_energy_bin
            close(u)
            print*, 'sigma_energy_bin', sigma_energy_bin

            sigma_energy_bin=array_values(i_name-7)
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
end subroutine db_test_simga_energy_cr