subroutine db_test_simga_TP_energy_cr()
    use db_data, only: i_name,j_name,name_test,TP_SIGMA,sigma_energy_bin!,ENERGY_SIGMA
    implicit none
    real(8) :: array_values_TP(6)
    real(8) :: array_values_E(8)
    real(8) :: A(26)
    integer :: u

    !array_values_TP=(/6.0D0,6.5d0,7.0D0,7.5d0,8.0D0/)
    array_values_TP=(/6.5d0,6.6d0,6.7d0,6.8d0,6.9d0,7.0D0/)
    array_values_E=(/3.0d0,5.0d0,6.0d0,7.0d0,8.0d0,9.0d0,10.0d0,15.0d0/)
    print*, 'db_test_simga_TPWR_energy_cr'
    name_test='db_sigma_TPWR_energy_test_M_fine'
    !do i_name=1,6 ! thermal power
        !TP_SIGMA=array_values_TP(i_name)
        TP_SIGMA=array_values_TP(1)
     !   do j_name=8,8 ! energy            
        A=1.0d0
        A(11)=0.0d0
        A(18)=0.0d0
        A(21)=0.0d0
        A(22)=0.0d0
        A(25)=0.0d0
            print*, i_name,  j_name
            open(newunit=u, file='db_data/db_sigma_energy_per_bin.dat', status='old')
                read(u,*) sigma_energy_bin
            close(u)
            print*, 'sigma_energy_bin', sigma_energy_bin
            A=array_values_E(8)*A
            A(11)=0.5d0
            A(18)=0.5d0
            A(21)=0.5d0
            A(22)=0.5d0
            A(25)=0.5d0
            sigma_energy_bin=A
            open(newunit=u, file='db_data/db_sigma_energy_per_bin.dat', status='old')
                write(u,*) sigma_energy_bin
            close(u)
            print*, 'sigma_energy_bin', sigma_energy_bin            
            call readDBData()      ! Lee datos de Dayabay
            call grid_setting()    ! Genera eventos asociados a los parámetros de oscilación
            call db_spectral_analysis()
            sigma_energy_bin=0.5d0
        open(newunit=u, file='db_data/db_sigma_energy_per_bin.dat', status='old')
            write(u,*) sigma_energy_bin
        close(u)
     !   enddo
    !enddo
end subroutine db_test_simga_TP_energy_cr