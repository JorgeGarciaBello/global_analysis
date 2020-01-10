subroutine db_chiDistributionT13_log(n)
    implicit none
    integer :: n                        ! Number of partitions in the interest interval 
    integer :: i
    real(8) :: t_13
    real(8) :: chi_min,chi2_min
    real(8) :: m_jump
    real(8) :: exp_m_0=-4.d0
    real(8) :: exp_m_1=0.d0
    real(8) :: min_parameters(3)
    real(8) :: s22t12_min
    integer :: u
        
    print*,'You are running db_chiDistributionT13_log_cut . . . '

    open(newunit=u, file='daya_for_global_analysis/db_data/analysis_1_a/db_data_min_parameters.dat', status='old')
        read(u,*) min_parameters
    close(u)    
    chi_min=min_parameters(1)
    s22t12_min=min_parameters(2)

    print*,'s22t12_min', s22t12_min

    ! Generación del corte en el valor minimo de sen^2(2t_13)
    t_13=asin(sqrt(s22t12_min))/2.0d0
    m_jump = (exp_m_1-exp_m_0)/real(n)      ! 4.0d0 Es el exponente de la potencia de la grafica logaritmica
    open(newunit=u, file='daya_for_global_analysis/db_data/analysis_1_a/cut_in_t13_minimum_1.dat')
        write(u,*)
    close(u)
    do i=1,n+1
        call chi2_db((/0.0d0,t_13,0.0d0,0.0d0,0.0d0, &
                       0.0d0,0.0d0,0.0d0,0.0d0,0.0d0, &
                       exp(2.302585d0*(exp_m_0 + m_jump*real(i-1))),0.0d0/),chi2_min)
        open(newunit=u, file='daya_for_global_analysis/db_data/analysis_1_a/cut_in_t13_minimum_1.dat',position='append')
            write(u,*)  exp(2.302585d0*(exp_m_0 + m_jump*real(i-1))), chi2_min
        close(u)
        print*, i
    enddo 
    
    return
end subroutine db_chiDistributionT13_log