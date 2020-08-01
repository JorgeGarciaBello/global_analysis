subroutine db_create_confidence_regions_from_pull_min()
    use db_data, only: n,NDIM,ADS,grid_events_data_points
    use neu_osc_parameters
    implicit none
    real(8) :: chiSquarePull1,result
    real(8) :: P(NDIM)
    real(8) ::  Y(12)
    integer :: i
    integer :: u

    Y=0.0d0
!P=(/-3.9425599302974276D-003,-7.2430222840762204D-004,2.5635001639783255D-003,3.3786127701957219D-003,-1.5157065679257797D-003, &
!    -6.1485991364758829D-004,-2.0010322122922175D-003,4.4791018046708381D-004,2.8380238319997542D-005,5.2060414489007371D-004,  &
!    -1.2835218162956841D-004,7.4686718634303477D-004,-1.0215156122431930D-003,5.9208993282897451D-004,-1.0384302333926380D-3, &
!    1280.3678407214243d0,903.44282109557162d0,1427.4213217062702d0,595.70834868925374d0, &
!    459.15820294269554d0,-254.15622380287812d0,354.59301404657197d0,-255.61797773195673d0/)
    open(newunit=u,file='gnuplot_data.dat')
     do i=1,n*n
        t13=asin(sqrt(grid_events_data_points(i,1)))/2.0d0     ! s22t13        
        dm31=grid_events_data_points(i,2)    ! dm31 [eV^2]        
        result=chiSquarePull1(P)
        write(u,*) grid_events_data_points(i,1),grid_events_data_points(i,2),result
    enddo
    close(u)


end subroutine db_create_confidence_regions_from_pull_min