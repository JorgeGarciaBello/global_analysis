!##############################################################################################
!
!   Instituto Politécnico Nacional. 
!   Escuela Superior de Física y Matemáticas
!   
!   Autor: M. en C. Jorge Garcia Bello
!
!   renoChi2. Subroutina del experimento de oscilaciones de neutrinos RENO.
!       Tiene la estructura ( Vector Y: son los parámetros de oscilación en un modelo de 4 neutrinos,
!                             chi2_min: es el valor minimo de la estadśitica chi-square para
!                                       valores definidos en el vector Y )
!
!   Descripción =>
!
!        Vector Y(12): t12 es el ángulo de mezcla theta_12
!                    t13 es el ángulo de mezcla theta_13
!                    t14 es el ángulo de mezcla theta_14
!                    t23 es el ángulo de mezcla theta_23
!                    t24 es el ángulo de mezcla theta_24
!                    t34 es el ángulo de mezcla theta_34
!                    delta1 es el factor de fase la violación de CP_13
!                    delta2 es el factor de fase la violación de CP_24
!                    delta3 es el factor de fase la violación de CP_34
!                    dm21 es la direfencia del cuadrado de las masas Solar (m^2_2 - m^2_1)
!                    dm31 es la direfencia del cuadrado de las masas       (m^2_3 - m^2_1)
!                    dm41 es la direfencia del cuadrado de las masas       (m^2_4 - m^2_1)
!
!       chi2_min:    Es el valor minimo develto de la estadística chi utilizada en daya bay  
!                    para valores definidos en Y (parámetros de osciulación)
!
!##############################################################################################

subroutine renoChi2(Y,chi2_min)
    use neu_osc_parameters
    use reno_data, only: NDIM
    implicit none
    real(8) :: Y(12)              ! Arreglo con los parámetros de oscilación
    real(8) :: chi2_min           ! is the min value of the chi-square

    real(8) :: Z(NDIM+1)
    real(8) :: P(NDIM+1,NDIM)

    t12=Y(1)
    t13=Y(2)
    t14=Y(3)
    t23=Y(4)
    t24=Y(5)
    t34=Y(6)
    delta1=Y(7)
    delta2=Y(8)
    delta3=Y(9)
    dm21=Y(10)
    dm31=Y(11)
    dm41=Y(12)
    !print*,'Iniciando minimización'
    call reno_minimization(P,Z)
    chi2_min=Z(1)
    return
end subroutine renoChi2