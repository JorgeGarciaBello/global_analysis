subroutine db_chi_square_covariance_approach_analysis()
    use db_data, only: n,NBIN,grid_data_points
    implicit none
    real(8) :: t13, dm31
    real(8) :: chi_square
    integer :: i,j,u
    integer :: P
    real(8) :: VP1H31(NBIN,NBIN),VP1H32(NBIN,NBIN)
    real(8) :: VP2H31(NBIN,NBIN),VP2H32(NBIN,NBIN)
    real(8) :: VP3H31(NBIN,NBIN),VP3H32(NBIN,NBIN)

    real(8) :: VP1B31(NBIN,NBIN),VP1B32(NBIN,NBIN)
    real(8) :: VP2B31(NBIN,NBIN),VP2B32(NBIN,NBIN)
    real(8) :: VP3B31(NBIN,NBIN),VP3B32(NBIN,NBIN)

    real(8) :: VSP1H1(NBIN,NBIN),VSP1H2(NBIN,NBIN)
    real(8) :: VSP2H1(NBIN,NBIN),VSP2H2(NBIN,NBIN)
    real(8) :: VSP3H1(NBIN,NBIN),VSP3H2(NBIN,NBIN)

    real(8) :: db_chi_square_spectral_analysis_period
    Character(len=80) :: filename
    real(8) :: results(n**2,3)
    real(8) :: sum1=0,sum2=0,sum3=0
    !call db_create_statistical_covariance_matrix_by_period_and_hall(VP1H31,VP1H32,VP2H31,VP2H32,VP3H31,VP3H32)    
    !call db_create_background_covariance_matrix_by_period_and_hall(VP1B31,VP1B32,VP2B31,VP2B32,VP3B31,VP3B32)
    P=1  ! 0 => para hacer un análisis incluyendo los 3 conjuntos de datos
         ! (1,2,3) => para los diferentes conjuntos de datos (6AD,8AD,7AD)    
    select case (P)
        case(1)
        print*, '6AD-Period analysis . . . '
        case(2)
        print*, '8AD-Period analysis . . . '
        case(3)
        print*, '7AD-Period analysis . . . '
        case default
        print*, 'All-Periods analysis . . . '
    end select    
        !VP1H31= VP1H31 !+ VP1B31 !+ VSP1H1
        !VP1H32= VP1H32 !+ VP1B32 !+ VSP1H2
        !call db_get_inverse_covariance_matrix(VP1H31);
        !call db_get_inverse_covariance_matrix(VP1H32);
        !call db_get_inverse_covariance_matrix(VP2H31);
        !call db_get_inverse_covariance_matrix(VP2H32);        
    do i=1,n**2
        dm31=grid_data_points(i,1); t13=grid_data_points(i,2);
        !call db_create_statistical_covariance_matrix_by_period_and_hall_i(i,VP1H31,VP1H32,VP2H31,VP2H32,VP3H31,VP3H32)
        !VP1H31=VSP1H1+VP1B31+VP1H31!+VP1B31
        !VP1H32=VSP1H2+VP1B32+VP1H32!+VP1B32
        !call db_get_inverse_covariance_matrix(VP1H31);
        !call db_get_inverse_covariance_matrix(VP1H32);

        !VP2H31= VP2H31+40.0*VP2B31
        !VP2H32= VP2H32+40.0*VP2B32
        !call db_get_inverse_covariance_matrix(VP2H31);
        !call db_get_inverse_covariance_matrix(VP2H32);
        call db_get_signal_covariance_matrix_by_period_and_hall_i(i,VSP1H1,VSP1H2,VSP2H1,VSP2H2,VSP3H1,VSP3H2)
        VP1H31= VSP1H1!+VP1B31+VP1H31
        VP1H32= VSP1H2!+VP1B32+VP1H32
        call db_get_inverse_covariance_matrix(VP1H31);
        call db_get_inverse_covariance_matrix(VP1H32);        
        chi_square=db_chi_square_spectral_analysis_period(i,P,VP1H31,VP1H32,VP2H31,VP2H32,VP3H31,VP3H32)
        results(i,:)=(/sin(2.0d0*t13)**2,dm31,chi_square/)
        print*, i
    enddo
    select case(P)
        case(1)
            filename='db_spectral_analysis_6AD_resulted_data_.dat'
        case(2)
            filename='db_spectral_analysis_8AD_resulted_data_.dat'
        case(3)
            filename='db_spectral_analysis_7AD_resulted_data_.dat'
        case default
            filename='db_spectral_analysis_ALL_AD_resulted_data_.dat'
    end select
    open(newunit=u, file='db_data/'//filename)
    do i=1,n**2
        write(u,*) results(i,:)
        if(MOD(i,n)==0) then
            write(u,*) ''
        endif
    enddo
    close(u)
    call db_get_chi_min_from_spectral_analysis(n,filename)
    call confidenceRegions(n,filename)
end subroutine db_chi_square_covariance_approach_analysis