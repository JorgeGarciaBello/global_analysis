!##################################################
!
!   subroutine chi2_D_C: subroutine que recibe un 
!       vector Y de parámetros de oscilación y 
!       regresa un chi_doubleCHOOZ que es el Valor
!       mínimo de la estadśitica Chi-cuadrada del 
!       experimento Double CHOOZ
!
!##################################################


Subroutine chi2_D_C(Y,chi_doubleCHOOZ)  !Calcula las integrales Ppromedio
    use DC_espectros
    use DC_condiciones
    use matriz
    implicit none
    real*8, dimension(12) :: Y                                ! Vector Y que contiene parámetros de oscilación
    real(8) :: chi_doubleCHOOZ                                ! Valor minimo de chi para Double CHOOZ

    real*8 chi2_DC
    real*8, dimension(9,8) :: PP
    real*8, dimension(9) :: YY !chi^2 del simplex
    real*8, dimension(8) :: entrada
    integer k,kk    
    
    CALL parametros(deltachi,ciclos,region,diagon,mm)
    CALL Invermat(M,diagon)    
    !###########################################
    !
    !   Leyendo el simplex para double chooz
    !
    !###########################################
    open(53,file='dc_data/DC_simplex.dat')
        read (53,*) PP
    close(53)
     !###########################################
    !
    !   Inicializando chi2_DC conel simplex
    !
    !############################################
    DO k=1,9
        do kk=1,8
            entrada(kk)=PP(k,kk)    !  (Puntos del simplex)
        end do
        YY(k)=chi2_DC(Y,entrada)
    END DO
     !###########################################
    !
    !   Minimizando chi2 de Double CHOOZ
    !
    !############################################
    CALL AMOEBA_DC(PP,YY,Y)
    
    chi_doubleCHOOZ = YY(1)
    
    58 format (3(E16.10,12X))
    CALL SaveP_DC(PP)
    return
end Subroutine chi2_D_C
