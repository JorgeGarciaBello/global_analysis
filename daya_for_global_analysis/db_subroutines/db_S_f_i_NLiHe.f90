real(8) function db_S_f_i_NLiHe(bin)
    use db_data, only: N_obs_f,Bkg_sigma2_N_f, bkg_all_N_f
    implicit none
    integer :: bin    
    real(8) :: min, max
    real(8) :: r

    db_S_f_i_NLiHe=0.0d0
    !min=N_obs_f(bin)-sqrt(Bkg_sigma2_N_f(bin,4))
    !max=N_obs_f(bin)+sqrt(Bkg_sigma2_N_f(bin,4))


    min=N_obs_f(bin)-bkg_all_N_f(bin,4)*0.4d0
    max=N_obs_f(bin)+bkg_all_N_f(bin,4)*0.4d0

    CALL RANDOM_NUMBER(r)
    db_S_f_i_NLiHe=min*(1.0d0-r) + max*r
    return
end function db_S_f_i_NLiHe