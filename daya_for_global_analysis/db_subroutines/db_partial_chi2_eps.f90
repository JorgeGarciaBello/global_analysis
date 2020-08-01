real(8) function db_partial_chi2_eps(eps,alpha_r,eps_d,eta_d)
    use db_data, only: n,ADS,RCTS,Md=>Md_1607,Bd,w=>IBD_fdr,grid_events_data_points
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
    
     do i=1,n*n
        if((grid_events_data_points(i,1)==t13).and.(grid_events_data_points(i,2)==dm31)) then
            Td=grid_events_data_points(i,3:)            
        end if
    enddo
    db_partial_chi2_eps=0.0d0
    do d=1,ADS
      db_partial_chi2_eps=db_partial_chi2_eps-2.0d0*Td(d)*(Md(d)-Td(d)*(1.0d0+eps+w(d,1)*alpha_r(1)         &
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
    enddo
    return
end function db_partial_chi2_eps