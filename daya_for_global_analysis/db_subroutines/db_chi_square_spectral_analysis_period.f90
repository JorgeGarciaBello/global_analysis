real(8) function db_chi_square_spectral_analysis_period(i,P,VP1H31,VP1H32,VP2H31,VP2H32,VP3H31,VP3H32)
    use db_data, only: NBIN
    implicit none
    integer :: i
    integer :: P
    real(8) :: VP1H31(NBIN,NBIN),VP1H32(NBIN,NBIN)
    real(8) :: VP2H31(NBIN,NBIN),VP2H32(NBIN,NBIN)
    real(8) :: VP3H31(NBIN,NBIN),VP3H32(NBIN,NBIN)

    real(8) :: db_chi_square_spectral_analysis_period_6AD
    real(8) :: db_chi_square_spectral_analysis_period_8AD
    real(8) :: db_chi_square_spectral_analysis_period_7AD
    real(8) :: chi

    chi=0.d0
    select case(P)
        case(1) ! '6AD-Period analysis '            
            chi=db_chi_square_spectral_analysis_period_6AD(i,VP1H31,VP1H32)            
        case(2) ! '8AD-Period analysis '
            chi=db_chi_square_spectral_analysis_period_8AD(i,VP2H31,VP2H32)
        case(3) ! '7AD-Period analysis '
            chi=db_chi_square_spectral_analysis_period_7AD(i,VP3H31,VP3H32)            
        case default ! 'All-Periods analysis '
            chi= db_chi_square_spectral_analysis_period_6AD(i,VP1H31,VP1H32)   &
                +db_chi_square_spectral_analysis_period_8AD(i,VP2H31,VP2H32)!   &
                !+db_chi_square_spectral_analysis_period_7AD(i,VP3H31,VP3H32)
    end select
    db_chi_square_spectral_analysis_period=chi
    return
end function db_chi_square_spectral_analysis_period