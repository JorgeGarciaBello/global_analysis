!#####################################################
!
!   minimization es una subroutina que se encargar de 
!       ejecutar las subroutinas paa realizar la 
!       minimización de la función FUNC, y escribe
!       los resultaods en un archivo.
!
!#####################################################
subroutine minimization(Y,P_a)
    use db_data, only:NDIM,pull_min,P
    implicit none    
    integer,parameter :: MP=NDIM+1      ! MP is the number of points for polygon of ABOEBA
    integer,parameter :: NP=NDIM        ! NP is the number of pulls                   
    real(8) :: P_a(MP,NP), Y(MP)          ! Array con el que se construye AMOEBA    
    real(8) :: FTOL=1.D-4             ! Required tolerance
    integer :: ITER                     ! Número de iteraciones realizadas por AMOEBA

    real(8) :: newSimplex(MP,NDIM)
    integer :: i
    !do i=1,NDIM
    !    newSimplex(i,:)=P(i,:)
    !end do
    P_a=P
    CALL initializing_to_simplex(Y)    
    CALL AMOEBA(P_a,Y,MP,NP,NDIM,FTOL,ITER)
    pull_min=P_a(1,:)

    !newSimplex(MP,:)=P(1,:)
    !call reWriteSimplex(newSimplex)
    return
end subroutine minimization