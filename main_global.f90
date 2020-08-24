program main_global
    use types
    use data_settings, only: n,t13_M_data,dm_M_data    
    implicit none
    real(dp) :: chi_dayabay, chi_reno, chi_doubleCHOOZ, chi_min_global
    real(dp) :: Y(12)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )    
    real(dp) :: dm_min,dm_max    
    real(dp) :: db_chi_square_spectral_analysis2_period
    real(dp) :: DC_FUNC
    real(dp) :: RENO_data(n,n),DC_data(n,n),DB_data(n,n)
    REAL(DP) :: dmee,t13,P(11)
    real(dp) :: reno_FUNC,hola
    real(dp) :: reno_chi_square_spectral_analysis
    real(dp) :: val(3),data(n**2,3)
    integer :: i,j,u 
    real(dp) :: e_a,e_b,e_c

    call grid_setting()
    !call DC_grid_setting()
    
    call readDBData()      ! Lee datos de Dayabay
    call readRENOData()    ! Lee datos de RENO
    call ReadDC()          ! Lee datos de Double CHOOZ
    call DC_read_data()    

    !call DC_test()
    !stop
    !call reno_generate_MC()
    !dmee=0.0d0
    !t13=0.0d0

    !open(newunit=u, file='reno_data_cov.dat')
    Y=0.0    
    do i=1,n
        do j=1,n
          Y(2)=t13_M_data(i,j); Y(11)=dm_M_data(i,j)
            !call chi2_D_C(Y,chi_doubleCHOOZ) ! Subroutina que dado Y, regresa el valor de la chi-cuadrada para Double CHOOZ            
            !chi_doubleCHOOZ=DC_FUNC(Y(2),Y(11),0.0_dp,0.0_dp,0.0_dp)            
            

            !####################################################################################################
            !
            !                                         DAYA BAYDB READ 
            !
            !#####################################################################################################

            !DB_data(i,j)  = db_chi_square_spectral_analysis2_period(t13_M_data(i,j),dm_M_data(i,j))
            
            

            !######################################  DOUBLE CHOOZ  ###################################################

            !call DC_double_chooz(Y,chi_doubleCHOOZ)
            !DC_data(i,j)=chi_doubleCHOOZ
            
            !DC_data(i,j)=DC_FUNC(Y(2),Y(11),(/0.0_dp,0.0_dp,0.0_dp/))

            

            
            !######################################   RENO  ##########################################################
            !
            !call renoChi2(Y,chi_reno)        ! Subroutina que dado Y, regresa el valor de la chi-cuadrada para RENO}           
            chi_reno=reno_chi_square_spectral_analysis(Y(2),Y(11))
            !write(u,*) sin(2.0d0*Y(2))**2, Y(11), chi_reno
            RENO_data(i,j) = chi_reno
            !RENO_data = chi_reno          
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

    !call write_results(n,RENO_data,'reno_data_cov.dat')
    !call get_min_from_data(n,'reno_data_cov.dat',val)
    !call reno_confidenceRegions(n,val,RENO_data,'reno_data_cov.dat')
end program main_global