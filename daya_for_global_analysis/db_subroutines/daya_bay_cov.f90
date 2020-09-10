subroutine daya_bay_cov(Y,db_chi_min)
    use types
    use neu_osc_parameters
    implicit none
    real(dp) :: Y(12),db_chi_min
    real(dp) :: db_chi_square_spectral_analysis2_period
    real(dp) :: dmee

    t13=Y(2)
    dmee=Y(11)
    db_chi_min=db_chi_square_spectral_analysis2_period(t13,dmee)
    return
end subroutine daya_bay_cov