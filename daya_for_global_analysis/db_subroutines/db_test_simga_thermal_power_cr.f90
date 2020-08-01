subroutine db_test_simga_thermal_power_cr()
    use db_data, only: i_name,j_name,name_test,TP_SIGMA
    implicit none
    real(8) :: array_values(8)
    array_values=(/1.0d0,3.0d0,5.0d0,8.0D0,10.0d0,13.0D0,15.0d0,20.0d0/)
    print*, 'db_test_simga_thermal_power_cr'
    name_test='db_sigma_Tpower_test'
    do i_name=1,6
        TP_SIGMA=array_values(i_name)
        call readDBData()      ! Lee datos de Dayabay
        call grid_setting()    ! Genera eventos asociados a los parámetros de oscilación
        call db_spectral_analysis()
    enddo
end subroutine db_test_simga_thermal_power_cr