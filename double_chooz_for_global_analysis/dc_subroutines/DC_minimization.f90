subroutine DC_minimization(t13,dmee,P,Y)
    use types
    use DC_settings, only: NDIM
    implicit none
    real(dp) :: t13,dmee
    integer,parameter :: NP=NDIM         ! NP is the number of pulls    
    integer,parameter :: MP=NDIM+1       ! MP is the number of points for polygon of ABOEBA
    real(dp) :: P(MP,NP), Y(MP)          ! Array con es que se construye AMOEBA
    real(dp) :: FTOL=1.D-3               ! Required tolerance
    integer  :: ITER                     ! Número de iteraciones realizadas por AMOEBA    
    
    call DC_read_simplex(t13,dmee,P,Y) 

    call DC_AMOEBA(t13,dmee,P,Y,MP,NP,NDIM,FTOL,ITER)
    !print*,'P(1,:): ', P(1,:)
    return
end subroutine DC_minimization