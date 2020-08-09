subroutine DC_grid_setting()
    use types
    implicit none
    real(dp) :: dm_min,dm_max
    real(dp) :: t13_min,t13_max


    dm_min=1.0e-3
    dm_max=1.0_dp

    t13_min=asin(sqrt(0.0_dp))/2.0_dp
    t13_max=asin(sqrt(0.3_dp))/2.0_dp

    call DC_create_grid(t13_min,t13_max,dm_min,dm_max)
    call read_grid()
    return
end subroutine DC_grid_setting