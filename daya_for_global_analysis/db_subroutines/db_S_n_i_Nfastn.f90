real(8) function db_S_n_i_Nfastn(bin)
    use db_data, only: N_obs_n,Bkg_sigma2_N_n,bkg_all_N_n
    implicit none
    integer :: bin
    real(8) :: min, max
    real(8) :: r

    db_S_n_i_Nfastn=0.0d0
    !min=N_obs_n(bin)-sqrt(Bkg_sigma2_N_n(bin,5))
    !max=N_obs_n(bin)+sqrt(Bkg_sigma2_N_n(bin,5))

    !min=bkg_all_N_n(bin,5)-bkg_all_N_n(bin,5)*(0.13d0)
    !max=bkg_all_N_n(bin,5)+bkg_all_N_n(bin,5)*(0.13d0)

    min=N_obs_n(bin)-bkg_all_N_n(bin,5)*(0.13d0)
    max=N_obs_n(bin)+bkg_all_N_n(bin,5)*(0.13d0)

    CALL RANDOM_NUMBER(r)
    db_S_n_i_Nfastn=min*(1.0d0-r) + max*r
    return
end function db_S_n_i_Nfastn