subroutine db_chiDistributionDmee_log(n)
    implicit none
    integer :: n                        ! Number of partitions in the interest interval 
    integer :: i
    real(8) :: t_13
    real(8) :: chi_min,chi2_min
    real(8) :: t_jump
    real(8) :: t_0=asin(sqrt(0.0d0))/2.0d0
    real(8) :: t_1=asin(sqrt(1.0d0))/2.0d0
    real(8) :: min_parameters(3)
    real(8) :: dmee
    integer :: u
        
    print*,'You are running db_chiDistributionDmee_log_cut . . . '

    open(newunit=u, file='daya_for_global_analysis/db_data/analysis_1_a/db_data_min_parameters.dat', status='old')
        read(u,*) min_parameters
    close(u)    
    chi_min=min_parameters(1)
    dmee=min_parameters(3)

    print*,'dmee', dmee

    ! Generación del corte en el valor minimo de dmee    
    t_jump = (t_1 -t_0)/real(n)      ! 4.0d0 Es el exponente de la potencia de la grafica logaritmica
    open(newunit=u, file='daya_for_global_analysis/db_data/analysis_1_a/cut_in_dmee_minimum_1.dat')
        write(u,*)
    close(u)
    do i=1,n + 4
        call chi2_db((/0.0d0,t_jump*real(i-1),0.0d0,0.0d0,0.0d0, &
                       0.0d0,0.0d0,0.0d0,0.0d0,0.0d0, &
                       dmee,0.0d0/),chi2_min)
        open(newunit=u, file='daya_for_global_analysis/db_data/analysis_1_a/cut_in_dmee_minimum_1.dat',position='append')
            write(u,*)  0.0d0+t_jump*real(i-1), chi2_min
        close(u)
        print*, i
    enddo 
    
    return
end subroutine db_chiDistributionDmee_log