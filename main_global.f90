program main_global
    use types
    use data_settings, only: n,t13_M_data,dm_M_data    
    implicit none
    real(dp) :: RENO_data(n,n),DC_data(n,n),DB_data(n,n)    
    real(dp) :: chi_dayabay, chi_reno, chi_doubleCHOOZ, chi_min_global,db_chi_min
    real(dp) :: db_chi_square_spectral_analysis2_period
    real(dp) :: DC_FUNC    
    real(dp) :: reno_chi_square_spectral_analysis
    real(dp) :: Y(13)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )        
    real(dp) :: val(3)
    integer  :: i,j

    call grid_setting()
    !call DC_grid_setting()
    
    call readDBData()      ! Lee datos de Dayabay
    call readRENOData()    ! Lee datos de RENO    
    call DC_read_data()    
    ! Info obtained from: https://pdg.lbl.gov/2019/reviews/rpp2018-rev-neutrino-mixing.pdf
    Y(1)=0.5905000152_dp    ! t12=Y(1)
    !Y(2)=                  ! t13=Y(2)
    Y(3)=0.0_dp             ! t14=Y(3)
    Y(4)= 0.8435290321_dp   ! t23=Y(4)
    Y(5)=0.0_dp             ! t24=Y(5)
    Y(6)=0.0_dp             ! t34=Y(6)
    Y(7)=0.0_dp             ! delta1=Y(7)
    Y(8)=0.0_dp             ! delta2=Y(8)
    Y(9)=0.0_dp             ! delta3=Y(9)
    Y(10)=7.39d-5           ! dm21 = Y(10)
    !Y(11)=                 ! dm31 = Y(11)
    Y(12)=0.0_dp                 !  dm41 = Y(12)
    !Y(13)=                  ! dm32=Y(13)
    
    !open(newunit=u, file='reno_data_cov.dat')
    Y=0.0    
    do i=1,n
        do j=1,n
          !Y(2)=t13_M_data(i,j); Y(11)=dm_M_data(i,j)
          Y(2)=t13_M_data(i,j); Y(13)=dm_M_data(i,j)

            !####################################################################################################
            !
            !                                         DAYA BAY
            !
            !#####################################################################################################
            !
            !   Covariance Matrix Approach
            !
            !#################################            
            !call daya_bay_cov(Y,db_chi_min); DB_data(i,j)=db_chi_min

            !#################################
            !
            !           Pull Approach
            !
            !#################################
            !call chi2_db(Y,chi_dayabay); DB_data(i,j)=chi_dayabay

            !####################################################################################################
            !
            !                                         DOUBLE CHOOZ 
            !
            !#####################################################################################################

            call DC_double_chooz(Y,chi_doubleCHOOZ); DC_data(i,j)=chi_doubleCHOOZ
            
            !####################################################################################################
            !
            !                                         RENO
            !
            !#####################################################################################################
            call renoChi2(Y,chi_reno); RENO_data(i,j) = chi_reno            
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

    !call write_results(n,DB_data,'db_data_prueba.dat')
    !call get_min_from_data(n,'db_data_prueba.dat',val)    
    

    !###################################################
    !
    !           Double Chooz
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
    call write_results(n,RENO_data,             'reno_data_prueba.dat')
    call get_min_from_data(n,                   'reno_data_prueba.dat',val)
    call reno_confidenceRegions(n,val,RENO_data,'reno_data_prueba.dat')

    !call write_results(n,RENO_data,             'reno_data_far_approach.dat')
    !call get_min_from_data(n,                   'reno_data_far_approach.dat',val)
    !call reno_confidenceRegions(n,val,RENO_data,'reno_data_far_approach.dat')

    !call write_results(n,RENO_data,'reno_data_for_unified_analysis.dat')
    !call get_min_from_data(n,'reno_data_for_unified_analysis.dat',val)
    !call reno_confidenceRegions(n,val,RENO_data,'reno_data_for_unified_analysis.dat')
end program main_global