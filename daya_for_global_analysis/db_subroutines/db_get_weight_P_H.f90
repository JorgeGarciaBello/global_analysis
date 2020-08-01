subroutine db_get_weight_P_H(P,H,weight_w)
    use db_data, only:n,NBIN,w_6AD_H3_H1,w_6AD_H3_H2,w_8AD_H3_H1,w_8AD_H3_H2,w_7AD_H3_H1,w_7AD_H3_H2
    implicit none
    integer :: P,H    
    real(8) :: weight_w(n**2,NBIN)
    select case(P)
        case(1)
            select case(H)
                case(1)                    
                    weight_w=w_6AD_H3_H1
                case(2)                    
                    weight_w=w_6AD_H3_H2
            end select
        case(2)
            select case(H)
                case(1)                    
                    weight_w=w_8AD_H3_H1
                case(2)                    
                    weight_w=w_8AD_H3_H2
            end select
        case(3)
            select case(H)
                case(1)                    
                    weight_w=w_7AD_H3_H1
                case(2)                    
                    weight_w=w_7AD_H3_H2
            end select
    end select
    return
end subroutine db_get_weight_P_H
