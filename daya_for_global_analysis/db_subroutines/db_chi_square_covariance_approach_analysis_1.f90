subroutine db_chi_square_covariance_approach_analysis_1()
    use db_data, only: n,NBIN,grid_data_points
    implicit none
    real(8) :: t13, dm31
    real(8) :: chi_square
    integer :: i,j,u
    integer :: P
    real(8) :: VH11(NBIN,NBIN),VH12(NBIN,NBIN),VH13(NBIN,NBIN)
    real(8) :: VH21(NBIN,NBIN),VH22(NBIN,NBIN),VH23(NBIN,NBIN)
    real(8) :: VH31(NBIN,NBIN),VH32(NBIN,NBIN),VH33(NBIN,NBIN)

    real(8) :: VB11(NBIN,NBIN),VB12(NBIN,NBIN),VB13(NBIN,NBIN)
    real(8) :: VB21(NBIN,NBIN),VB22(NBIN,NBIN),VB23(NBIN,NBIN)
    real(8) :: VB31(NBIN,NBIN),VB32(NBIN,NBIN),VB33(NBIN,NBIN)

    real(8) :: VSP1H1(NBIN,NBIN),VSP1H2(NBIN,NBIN),VSP1H3(NBIN,NBIN)
    real(8) :: VSP2H1(NBIN,NBIN),VSP2H2(NBIN,NBIN),VSP2H3(NBIN,NBIN)
    real(8) :: VSP3H1(NBIN,NBIN),VSP3H2(NBIN,NBIN),VSP3H3(NBIN,NBIN)

    real(8) :: VP1H3(NBIN,NBIN),VP1H2(NBIN,NBIN),VP1H1(NBIN,NBIN)
    real(8) :: VP2H3(NBIN,NBIN),VP2H2(NBIN,NBIN),VP2H1(NBIN,NBIN)
    real(8) :: VP3H3(NBIN,NBIN),VP3H2(NBIN,NBIN),VP3H1(NBIN,NBIN)

    real(8) :: db_chi_square_spectral_analysis_period
    Character(len=80) :: filename
    real(8) :: results(n**2,3)

    real(8) :: sum1=0,sum2=0,sum3=0
    call db_create_statistical_covariance_matrix_by_period_and_hall(VH11,VH12,VH13, &
                                                                    VH21,VH22,VH23, &
                                                                    VH31,VH32,VH33  )
    call db_create_background_covariance_matrix_by_period_and_hall( VB11,VB12,VB13, &
                                                                    VB21,VB22,VB23, &
                                                                    VB31,VB32,VB33  )
    call db_get_signal_covariance_matrix_by_period_and_hall(VSP1H1,VSP1H2,VSP1H3, &
                                                            VSP2H1,VSP2H2,VSP2H3, &
                                                            VSP3H1,VSP3H2,VSP3H3)

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

    VP1H3 =  VH31+VB31+VSP1H3  !  VH31+1.5d0*VB31+6.d0*VSP1H3;
    VP1H2 =  VH21+VB21+VSP1H2  !  VH21+1.5d0*VB21+6.d0*VSP1H2;
    VP1H1 =  VH11+VB11+VSP1H1  !  VH11+1.5d0*VB11+6.d0*VSP1H1;

     VP2H3= VB32 ! 6*VH32!2.0d0*(VH32+VB32+VSP2H3) !+ 2.2d0*VB32 + 5.0d0*VSP2H3
     VP2H2= VB22   ! 6*(1.d0/3.4955075171179426d0)*VH22!0.30d0*(VH22+VB22+VSP2H2)       !+ VB22       + VSP2H2
     VP2H1= VB12   ! 6*(1.d0/3.7205160359752738d0)*VH12!0.40d0*(VH12+VB12+VSP2H1)       !+ VB12       + VSP2H1
    
    !VP2H3=0.
    !VP2H2=0.
    !VP2H1=0.
    !do i=1,NBIN
        !if((i==2).or.(i==1)) then
    !    if(i==1) then
    !    else
    !        VP2H3(i,i)=1.0d0
    !    end if        
        !VP2H2(i,i)=100000.0d0
        !VP2H1(i,i)=100000.0d0
    !ENDDO
    sum1=0.d0; sum2=0.d0; sum3=0.d0;
    do i=1,NBIN
        sum1=sum1+VP2H3(i,i)
        sum2=sum2+VP2H2(i,i)
        sum3=sum3+VP2H1(i,i)
    ENDDO
    print*,'sum1/sum1', sum1/sum1
    print*,'sum2/sum1', sum2/sum1
    print*,'sum3/sum1', sum3/sum1
    
    call db_write_matrix(NBIN,VP2H3,"VP2H3_stat")
    call db_write_matrix(NBIN,VP2H2,"VP2H2_stat")
    call db_write_matrix(NBIN,VP2H1,"VP2H1_stat")

    VP3H3=VH33+VB33+VSP3H3
    VP3H2=VH23+VB23+VSP3H2
    VP3H1=VH13+VB13+VSP3H1
    call db_get_inverse_covariance_matrix(VP1H3); call db_get_inverse_covariance_matrix(VP2H3); 
    call db_get_inverse_covariance_matrix(VP1H2); call db_get_inverse_covariance_matrix(VP2H2); 
    call db_get_inverse_covariance_matrix(VP1H1); call db_get_inverse_covariance_matrix(VP2H1); 

    call db_get_inverse_covariance_matrix(VP3H3)
    call db_get_inverse_covariance_matrix(VP3H2)
    call db_get_inverse_covariance_matrix(VP3H1)

    do i=1,n**2
        dm31=grid_data_points(i,1); t13=grid_data_points(i,2);
        chi_square=db_chi_square_spectral_analysis_period(i,P,VP1H3,VP1H2,VP1H1,VP2H3,VP2H2,VP2H1,VP3H3,VP3H2,VP3H1)
        results(i,:)=(/sin(2.0d0*t13)**2,dm31,chi_square/)
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
    return
end subroutine db_chi_square_covariance_approach_analysis_1