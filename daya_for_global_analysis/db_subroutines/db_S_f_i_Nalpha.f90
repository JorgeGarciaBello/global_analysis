real(8) function db_S_f_i_Nalpha(bin)
    use db_data, only: N_obs_f,Bkg_sigma2_N_f,bkg_all_N_f
    implicit none
    integer :: bin    
    real(8) :: weigthW_P_HFar_HNear
    real(8) :: sigma=0.5d0
    real(8) :: min, max
    real(8) :: r,re

    db_S_f_i_Nalpha=0.0d0
    !min=N_obs_f(bin)-sqrt(Bkg_sigma2_N_f(bin,2))
    !max=N_obs_f(bin)+sqrt(Bkg_sigma2_N_f(bin,2))

    min=N_obs_f(bin)-bkg_all_N_f(bin,2)*sigma
    max=N_obs_f(bin)+bkg_all_N_f(bin,2)*sigma

    CALL RANDOM_NUMBER(r)
    db_S_f_i_Nalpha=min*(1.0d0-r) + max*r
    return
end function db_S_f_i_Nalpha