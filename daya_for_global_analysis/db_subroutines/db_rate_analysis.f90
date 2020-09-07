!################################################
!
!   En el siguiente proceso de evalua cada punto 
!   del grid en la chi de Daya Bay, se minimiza la 
!   estadística internamente y como resultado final 
!   se entrega el valor minimo de chi => chi_dayabay
!
!##################################################  
subroutine db_rate_analysis()
    use types
    use db_data, only: ADS,grid_events_data_points,far_bin_events
    use data_settings, only: n,t13_M_data,dm_M_data
    implicit none
    real(8) :: chi_dayabay
    real(8) :: Y(12)                           !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )    
    real(8) :: dm_min,dm_max
    real(8) :: t13_min,t13_max
    real(8) :: dm_jump,t13_jump
    integer :: i,j,u
    real(8) :: time_0, time_1 
    real(8) :: start, end
    Y=0.0
    print*, 'Iniciando minimización'    
    open(newunit=u,file='db_data.dat')
        write(u,*) ''
    close(u)
    do i=1,n*n
        Y(2)=grid_events_data_points(i,1)     ! s22t13        
        Y(11)=grid_events_data_points(i,2)    ! dm31 [eV^2]
        call chi2_db(Y,chi_dayabay)
            open(337,file='db_data.dat',position='append',status='old')
                write (337,*)  Y(2), Y(11), chi_dayabay
            close(337)
        print*,i
    enddo
    call cpu_time(time_1)

    print*,'Time: ', time_1-time_0
    print*,'Fin'
    call get_chi_min_from_data_grid(n)
    !call confidenceRegions(n)
    !call db_chiDistributionT13(200)
    !call db_chiDistributionDmee(200)

    return
end subroutine db_rate_analysis