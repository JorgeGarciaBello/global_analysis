!subroutine grid_setting()
!    implicit none
!    real(8) :: dm_min,dm_max
!    real(8) :: t13_min,t13_max
!    print*, 'Making data-grid  . . .'
    !################################################
    !
    !   Inicialización de los limites del grid 
    !
    !##################################################
!    dm_min=2.1d-3           ! 2.2d-3
!    dm_max=2.8d-3           ! 3.d-3
!    t13_min=asin(sqrt(0.07d0))/2.0d0               !0.08d0
!    t13_max=asin(sqrt(0.10d0))/2.0d0               !0.19d0    
    !######################################################
    !
    !   Conjunto de subroutinas que:
    !   1) create_grid: Genera el grid a ser implementado
    !   2) db_read_grid: Lee el grid generado en create_grid
    !   3) db_create_weight_w: Calcula la razón (w_bin) de 
    !      eventos N_far_bin/N_near_bin para cada pareja 
    !      ordenada de parámetros de oscilación 
    !
    !#####################################################
    !call db_create_weight_w_period_hall(t13_min,t13_max,dm_min,dm_max)

!    call create_grid(t13_min,t13_max,dm_min,dm_max)
!    call db_read_grid()
    
    !call db_create_weight_w()
    !call db_read_weight_w()
    
    
    !call db_create_weight_w_period_hall()
    !call db_read_weight_w_period_hall()  ! Subroutina que falta por hacer
    
    !call create_data_base_by_detector_from_osc_parameters()
    !call db_read_data_base_by_detector_from_osc_parameters()
    !call create_data_base_by_far_hall_from_osc_parameters()    
    !call db_create_confidence_regions_from_pull_min()    
!    return
!end subroutine grid_setting