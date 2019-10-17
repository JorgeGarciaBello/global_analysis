!program main    
!    implicit none    
!    real(8) :: Y(12)                     ! Arreglo con los parámetros de oscilación
!    real(8) :: chi2_min
    !#############################################################################
!    print*, 'Estás en el programa principal de Daya Bay'
!    call readDBData() !Lectura de datos
    !#############################################################################
!    Y=(/0.5837630476d0,   &    !t12
!        0.147D0, &    !t13
!        0.d0,    &    !t14
!        0.0d0,   &    !t23
!        0.0d0,   &    !t24
!        0.0d0,   &    !t34
!        0.0d0,   &    !delta1
!        0.0d0,   &    !delta2
!        0.0d0,   &    !delta3
!        7.53D-5,   &    !dm21
!        2.5D-3,  &      !dm31
!        0.0d0/)       !dm41
    
!    call chi2_db(Y,chi2_min)
!    print*,'chi2_min: ',chi2_min
!    print*,''
!    print*,''
!    print*,''
!    print*,'Código finalizado'
!    return
!end program main