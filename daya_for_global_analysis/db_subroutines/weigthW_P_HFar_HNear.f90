real(8) function  weigthW_P_HFar_HNear(P,Hf,Hn,i,t13,dm31)
    implicit none    
    integer :: i                                 ! is the number of energy bin
    real(8) :: t13, dm31
    real(8) :: expectedNumberNeutrinoByHallPeriodBin
    integer :: P,Hf,Hn

    weigthW_P_HFar_HNear = 0.0D0
    ! Debido a que tenemos la razón entre espectros y el tamaño 
    ! del bin coincide para los dos, da lo mismo que si lo 
    ! hicieramos con el número de neutrinos    
    weigthW_P_HFar_HNear =   expectedNumberNeutrinoByHallPeriodBin(Hf,P,i,t13,dm31) &  !+ Nbkg_Far()
                           / expectedNumberNeutrinoByHallPeriodBin(Hn,P,i,t13,dm31)    !+Nbkg_near
    return
end function weigthW_P_HFar_HNear