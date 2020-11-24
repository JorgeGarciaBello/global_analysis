!##################################################################
!
!   reno_probability_of_survival: is the probability of survival
!       for a model of neutrino oscillations with a effective
!       mass difference delta_ee
!
!##################################################################
function reno_probability_of_survival(x, l, t13_, dmee)
    use types
    use neu_osc_parameters
    implicit none    
    real(dp) :: reno_probability_of_survival
    real(dp) :: x,l ! l is the lth between reactor-detector                                               ! l es la distancia entre r_d en Metros 
    real(dp) :: t13_, dmee
    real(dp) :: reno_probability_1
    real(dp) :: reno_probability_2
    real(dp) :: probability_phi_ee
    
    select case(3)
        case(1)
        reno_probability_of_survival=reno_probability_1(t13_,dmee,l,x)
        case(2)
        reno_probability_of_survival=reno_probability_2(dmee,l,x)
        case(3)
        reno_probability_of_survival=probability_phi_ee(t13,t12,dm21,dm32,l,x)
    end select
    return
end function reno_probability_of_survival