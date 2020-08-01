real(8) function db_S_n_i_Nacc(bin)
    use db_data, only: n,PD,NBIN,N_obs_n,Bkg_sigma2_N_n,bkg_all_N_n
    implicit none
    integer :: bin    
    real(8) :: weigthW_P_HFar_HNear
    !real(8) :: sigma=(0.19612d0/100.0d0)
    real(8) :: sigma=(0.01d0)
    real(8) :: min, max
    real(8) :: r,re

    db_S_n_i_Nacc=0.0d0
    !min=N_obs_n(bin)-sqrt(Bkg_sigma2_N_n(bin,1))
    !max=N_obs_n(bin)+sqrt(Bkg_sigma2_N_n(bin,1))

    min=N_obs_n(bin)-bkg_all_N_n(bin,1)*sigma
    max=N_obs_n(bin)+bkg_all_N_n(bin,1)*sigma

    CALL RANDOM_NUMBER(r)
    db_S_n_i_Nacc=min*(1.0d0-r) + max*r
    return
end function db_S_n_i_Nacc