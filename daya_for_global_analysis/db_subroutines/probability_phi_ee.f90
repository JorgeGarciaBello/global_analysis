function probability_phi_ee(t13,t12,dm21,dm32,L,E)
    use types
    implicit none
    real(dp) :: probability_phi_ee
    real(dp) :: t13,t12,dm21,dm32,L,E,phi_ee
    
    phi_ee=atan(cos(t12)**2*sin(2.0_dp*1.27_dp*dm21*L/E) / (cos(t12)**2*cos(2.0_dp*1.27_dp*dm21*L/E) + sin(t12)**2))

    select case(2)
        ! 1 Para la Jeraquía Normal
        case(1)
        probability_phi_ee=1.0_dp - 2.0_dp*sin(t13)**2*cos(t13)**2                                      &
                              - 4.0_dp*cos(t13)**4*sin(t12)**2*cos(t12)**2*sin(1.27_dp*dm21*L/E)**2     &
                              + 2.0_dp*sin(t13)**2*cos(t13)**2*                                         &
                                (sqrt(1.0_dp-4.0_dp*sin(t12)**2*cos(t12)**2*sin(1.27_dp*dm21*L/E)**2))* &
                                cos((2.0_dp*1.27_dp*dm32*L/E) + phi_ee)
        ! 2 Para la Jeraquía Inversa
        case(2)
        probability_phi_ee=1.0_dp - 2.0_dp*sin(t13)**2*cos(t13)**2                                      &
                              - 4.0_dp*cos(t13)**4*sin(t12)**2*cos(t12)**2*sin(1.27_dp*dm21*L/E)**2     &
                              + 2.0_dp*sin(t13)**2*cos(t13)**2*                                         &
                                (sqrt(1.0_dp-4.0_dp*sin(t12)**2*cos(t12)**2*sin(1.27_dp*dm21*L/E)**2))* &
                                cos((2.0_dp*1.27_dp*dm32*L/E) - phi_ee)
    end select
    return
end function

