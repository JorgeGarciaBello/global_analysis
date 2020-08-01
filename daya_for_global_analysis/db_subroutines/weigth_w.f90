!#####################################################################################
!
!       weigth_w: is a weight where the model is included
!
!#####################################################################################
real(8) function  weigthW(i,t13,dm31)
    implicit none    
    integer :: i                                 ! is the number of energy bin
    real(8) :: t13, dm31
    real(8) :: expectedNeutrinoSpectrumByBinFar  ! expected neutirno spectrum bay energy-bin and by far-hall
    real(8) :: expectedNeutrinoSpectrumByBinNear ! expected neutirno spectrum bay energy-bin and by near-hall

    weigthW = 0.0D0
    ! Debido a que tenemos la razón entre espectros y el tamaño 
    ! del bin coincide para los dos, da lo mismo que si lo 
    ! hicieramos con el número de neutrinos
    weigthW = expectedNeutrinoSpectrumByBinFar(i,t13,dm31)/expectedNeutrinoSpectrumByBinNear(i,t13,dm31)
    return
end function weigthW