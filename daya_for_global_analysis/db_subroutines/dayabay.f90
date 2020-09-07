!##############################################################################################
!
!   Instituto Politécnico Nacional. 
!   Escuela Superior de Física y Matemáticas
!   
!   Autor: M. en C. Jorge Garcia Bello
!
!   chi2_db. Subroutina del experimento Daya Bay.
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
subroutine chi2_db(Y,chi2_min)    
    use db_data, only: NDIM
    use neu_osc_parameters
    implicit none
    real(8) :: Y(12)              ! Arreglo con los parámetros de oscilación
    real(8) :: chi2_min           ! is the min value of the chi-square
    real(8) :: Z(NDIM+1)
    real(8) :: P(NDIM+1,NDIM)
    real(8) :: FUNC
    integer :: u
    REAL*8     X(NDIM)
    real(8) :: get_chi_square_from_a_set_of_pulls

    t12=Y(1);     t13=Y(2);     t14=Y(3);     t23=Y(4);    t24=Y(5);    t34=Y(6);
    delta1=Y(7);  delta2=Y(8);  delta3=Y(9);
    dm21=Y(10);   dm31=Y(11);   dm41=Y(12)
    call db_create_number_of_antineutrino_events_by_detector(t13,dm31)
    select case(1)
        case(1)
            call minimization_by_solving_linear_system_equation(X)
            chi2_min=get_chi_square_from_a_set_of_pulls(X)
            open(newunit=u, file='daya_for_global_analysis/db_data/table_of_pulls.dat', &
                            position='append',status='old')
                write(u,*) t13, dm31, X
            close(u)
        case(2)
            call minimization(Z,P)
            chi2_min=Z(1)
            !open(newunit=u, file='db_data/table_of_pulls.dat',position='append',status='old')
            !    write(u,*) t13, dm31, P(1,:)
            !close(u)
    end select
    !chi2_min=FUNC(0.0d0)
    return
end subroutine chi2_db