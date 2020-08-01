real(8) function db_S_n_i_Neff(bin)
    use db_data, only: N_obs_n
    implicit none
    real(8) :: sigma_effy
    integer :: bin    
    real(8) :: weigthW_P_HFar_HNear
    real(8) :: sigma
    real(8) :: min, max
    real(8) :: r,re

    if((bin>=0).and.(bin<=52)) then
        sigma_effy=1.90d0/100.0D0
    else if((bin>=53).and.(bin<=104)) then
        sigma_effy=1.93d0/100.0D0
    else if((bin>=105).and.(bin<=156)) then
        sigma_effy=1.93d0/100.0D0
    endif

    db_S_n_i_Neff=0.0d0
    min=N_obs_n(bin)-sigma_effy*N_obs_n(bin)
    max=N_obs_n(bin)+sigma_effy*N_obs_n(bin)

    CALL RANDOM_NUMBER(r)
    db_S_n_i_Neff=min*(1.0d0-r) + max*r
    return
end function db_S_n_i_Neff