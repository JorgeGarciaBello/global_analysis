subroutine db_chi_square_covariance_approach_analysis_2()
    use db_data, only: n,PD,grid_data_points,t13_M_data,dm_M_data,i_name,j_name,bin_name,name_test,num_experiments
    implicit none
    real(8) :: chi_square,dmee, t13    
    character(len=200) :: filename,count_bin,count_perc,count_perc1,format_string,format_string_2,format_string_3
    real(8) :: db_chi_square_spectral_analysis2_period
    real(8) :: resul_M(n,n)
    integer :: i,j,u
    print*, 'Analysing data . . .'
    print*, 'n', n
    print*, 'num_experiments', num_experiments

     select case(PD)
        case(1)
            filename='db_spectral_analysis2_6_AD_resulted_data_.dat'
        case(2)
            filename='db_spectral_analysis2_8_6_AD_resulted_data_.dat'
        case(3)            
            if (i_name < 10) then
                format_string = "(I1)"
            else
                format_string = "(I2)"
            endif
            if (j_name < 10) then
                format_string_2 = "(I1)"
            else
                format_string_2 = "(I2)"
            endif
            if (bin_name < 10) then
                format_string_3 = "(I1)"
            else
                format_string_3 = "(I2)"
            endif
            write (count_perc, format_string)  i_name
            write (count_perc1, format_string_2)  j_name
            write (count_bin, format_string_3)  bin_name
            !filename='db_spectral_analysis2_3P_ractor_flux_perc_'//trim(count_perc)//'_all_bin_.dat'
            !filename='db_spectral_analysis2_3P_EWTP_AD_1_perc_'//trim(count_perc)//'_all_bin_.dat'
            !filename='db_spectral_analysis2_3P_ractor_flux_'//trim(count_perc)//'_bin_'//trim(count_bin)//'.dat'

            !filename=trim(name_test)//'_percentage_'//trim(count_perc)//'_all_bin.dat'            
            !filename=trim(name_test)//'_bin_'//trim(count_bin)//'_percentage_'//trim(count_perc)//'.dat'
            !filename=trim(name_test)//'_TP_'//trim(count_perc)//'_E_'//trim(count_perc1)//'.dat'
            !filename='db_spectral_analysis2_3P.dat'
            filename='db_spectral_analysis2.dat'
            print*,'************     ', filename
    end select
    ! Loop sobre la matriz del grid de parámetros de oscilación
    !do i=1,n
    !    do j=1,n
    !        t13=t13_M_data(i,j);dmee=dm_M_data(i,j)
            t13 =asin(sqrt(8.7420106766696259E-002))/(2.0d0);  dmee=2.5199999999999997E-003            
            !resul_M(i,j) = db_chi_square_spectral_analysis2_period(t13,dmee)
            resul_M = db_chi_square_spectral_analysis2_period(t13,dmee)
    !   enddo
    !    print*, i
    !enddo 

    call db_write_results(n,resul_M,filename)
    call db_get_chi_min_from_spectral_analysis(n,filename)
    call confidenceRegions(n,filename)
    return
end subroutine db_chi_square_covariance_approach_analysis_2