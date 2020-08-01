subroutine db_get_Nobs_P_H(P,H,data)
    use db_data, only:NBIN, N_obs_H1_6AD, N_obs_H2_6AD, N_obs_H1_8AD, N_obs_H2_8AD, N_obs_H1_7AD, N_obs_H2_7AD
    implicit none
    integer :: P,H    
    real(8) :: data(NBIN)
    select case(P)
        case(1)
            select case(H)
                case(1)                    
                    data=N_obs_H1_6AD
                case(2)                    
                    data=N_obs_H2_6AD
            end select
        case(2)
            select case(H)
                case(1)                    
                    data=N_obs_H1_8AD
                case(2)                    
                    data=N_obs_H2_8AD
            end select
        case(3)
            select case(H)
                case(1)                    
                    data=N_obs_H1_7AD
                case(2)                    
                    data=N_obs_H2_7AD
            end select
    end select
    return
end subroutine db_get_Nobs_P_H
