real(8) function db_partial_chi2_eta_d(d,eps,alpha_r,eps_d,eta_d)
    use db_data, only: n,ADS,RCTS,Md=>Md_1607,Bd,w=>IBD_fdr,grid_events_data_points,neuN
    use neu_osc_parameters, only: t13,dm31
    implicit none
    integer :: d
    real(8) :: eps
    real(8) :: alpha_r(RCTS)
    real(8) :: eps_d(ADS)
    real(8) :: eta_d(ADS)

    integer :: i    
    real(8) :: sigmaB(ADS)
    real(8) :: Td(ADS)

    sigmaB=(/1040,1176,875,782,155,150,150,133/)     
    Td=neuN
    db_partial_chi2_eta_d=0.0d0    
    db_partial_chi2_eta_d=2.0d0*(Md(d)-Td(d)*(1.0d0+eps+w(d,1)*alpha_r(1)         &
                                                       +w(d,2)*alpha_r(2)         &
                                                       +w(d,3)*alpha_r(3)         &
                                                       +w(d,4)*alpha_r(4)         &
                                                       +w(d,5)*alpha_r(5)         &
                                                       +w(d,6)*alpha_r(6)         &
                                                       +eps_d(d)                  &
                                              )                                   &    
                                              +eta_d(d)                           &
                                )                                                 &
    /(Md(d)+Bd(d))
    db_partial_chi2_eta_d=db_partial_chi2_eta_d + 2.0d0*eta_d(d)/sigmaB(d)**2
    return
end function db_partial_chi2_eta_d