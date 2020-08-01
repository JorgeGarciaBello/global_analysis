real(8) function expectedNumberNeutrinoByPeriodHallDetectorBin(P,H,d,i)
    implicit none
    integer :: P,H,d,i

    real(8) :: expectedNumberNeutrinosDetectorBin
    real(8) :: r


    ! expectedNumberNeutrinosDetectorBin(d,j,t13,dm31)


!    r=expectedNumberNeutrinosDetectorBin(d,j,t13,dm31)

    ! Valores del núemro de neutrinos esperado para el periodo 1 (6AD-period) de colecta de datos
    select case(H)
        case(1)            
                    
        case(2)
                        
        case(3)            
            
    end select

    ! Valores del núemro de neutrinos esperado para el periodo 2 (8AD-period) de colecta de datos
    select case(H)
        case(1)
            
        case(2)
            
        case(3)
            
    end select

    ! Valores del núemro de neutrinos esperado para el periodo 3 (7AD-period) de colecta de datos
    select case(H)
        case(1)
           
        case(2)
           
        case(3)
           
    end select
end function expectedNumberNeutrinoByPeriodHallDetectorBin