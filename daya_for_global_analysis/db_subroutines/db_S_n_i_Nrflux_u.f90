real(8) function db_S_n_i_Nrflux_u(bin)
    use db_data, only: N_obs_n
    implicit none
    real(8) :: sigma_reactor_flux
    real(8) :: sigma_N
    integer :: bin
    real(8) :: min, max
    real(8) :: r

    if((bin>=1).and.(bin<=52)) then
        sigma_reactor_flux=0.8d0/100.0D0
    else if ((bin>=53).and.(bin<=104)) then
        sigma_reactor_flux=0.8d0/100.0D0
    else if ((bin>=105).and.(bin<=156)) then
        sigma_reactor_flux=0.8d0/100.0D0
    end if

    db_S_n_i_Nrflux_u=0.0d0
    sigma_N=sigma_reactor_flux*N_obs_n(bin)
    min=N_obs_n(bin)- sigma_N
    max=N_obs_n(bin)+ sigma_N

    CALL RANDOM_NUMBER(r)
    db_S_n_i_Nrflux_u=min*(1.0d0-r) + max*r
    return
end function db_S_n_i_Nrflux_u