program main_global
    use types
    use data_settings, only: n,t13_M_data,dm_M_data    
    implicit none
    real(dp) :: RENO_data(n,n),DC_data(n,n),DB_data(n,n)    
    real(dp) :: chi_dayabay, chi_reno, chi_doubleCHOOZ, chi_min_global
    real(dp) :: db_chi_square_spectral_analysis2_period
    real(dp) :: DC_FUNC    
    real(dp) :: reno_chi_square_spectral_analysis
    real(dp) :: Y(12)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )        
    real(dp) :: val(3)
    integer  :: i,j

    call grid_setting()
    !call DC_grid_setting()
    
    call readDBData()      ! Lee datos de Dayabay
    call readRENOData()    ! Lee datos de RENO
    call ReadDC()          ! Lee datos de Double CHOOZ
    call DC_read_data()    

  
    
    !open(newunit=u, file='reno_data_cov.dat')
    Y=0.0    
    do i=1,n
        do j=1,n
          Y(2)=t13_M_data(i,j); Y(11)=dm_M_data(i,j)

            !####################################################################################################
            !
            !                                         DAYA BAY
            !
            !#####################################################################################################

            !DB_data(i,j)  = db_chi_square_spectral_analysis2_period(t13_M_data(i,j),dm_M_data(i,j))
            !call chi2_db(Y,chi_dayabay)
            !DB_data(i,j)=chi_dayabay
            
            

            
            !####################################################################################################
            !
            !                                         DOUBLE CHOOZ 
            !
            !#####################################################################################################
            !call chi2_D_C(Y,chi_doubleCHOOZ) ! Subroutina que dado Y, regresa el valor de la chi-cuadrada para Double CHOOZ            
            !chi_doubleCHOOZ=DC_FUNC(Y(2),Y(11),0.0_dp,0.0_dp,0.0_dp)

            !call DC_double_chooz(Y,chi_doubleCHOOZ)
            !DC_data(i,j)=chi_doubleCHOOZ
            
            !DC_data(i,j)=DC_FUNC(Y(2),Y(11),(/0.0_dp,0.0_dp,0.0_dp/))           

            
            !####################################################################################################
            !
            !                                         RENO
            !
            !#####################################################################################################
            !
            call renoChi2(Y,chi_reno)        ! RENO pull analysis
            !write(u,*) sin(2.0d0*Y(2))**2, Y(11), chi_reno
            RENO_data(i,j) = chi_reno            
       enddo
        !write(u,*) ' '
        print*, i
    enddo
    !close(u)
    !###################################################
    !
    !           DAYA BAY
    !
    !###################################################
    !call write_results(n,DB_data,'db_data.dat')
    !call get_min_from_data(n,'db_data.dat',val)    
    !call get_parabola_from_data(n,'db_data.dat')

    !call write_results(n,DB_data,'db_data_rate_pull.dat')
    !call get_min_from_data(n,'db_data_rate_pull.dat',val)    
    !call get_parabola_from_data(n,'db_data_rate_pull.dat')

    !###################################################
    !
    !           Double Choo
    !
    !###################################################    
    !call write_results(n,DC_data,'DC_data.dat')
    !call get_min_from_data(n,'DC_data.dat',val)
    !call DC_exclution_region(n,DC_data)
    !!call get_parabola_from_data(n,DC_data,'DC_data.dat')
    !call reno_confidenceRegions(n,val,DC_data,'DC_data.dat')
    !###################################################
    !
    !           RENO
    !
    !###################################################
    call write_results(n,RENO_data,             'reno_data_far_approach.dat')
    call get_min_from_data(n,                   'reno_data_far_approach.dat',val)
    call reno_confidenceRegions(n,val,RENO_data,'reno_data_far_approach.dat')

    !call write_results(n,RENO_data,'reno_data_cov_1.dat')
    !call get_min_from_data(n,'reno_data_cov_1.dat',val)
    !call reno_confidenceRegions(n,val,RENO_data,'reno_data_cov_1.dat')
end program main_global