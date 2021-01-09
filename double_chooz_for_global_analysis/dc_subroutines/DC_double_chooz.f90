subroutine DC_double_chooz(YY,dc_ji_min)
    use types
    use DC_settings, only: NDIM
    use neu_osc_parameters
    implicit none
    real(dp) :: X(NDIM),W(10000)
    integer  :: IPRINT=2
    integer  :: MAXFUN=5000
    real(dp) :: RHOBEG
    real(dp) :: RHOEND=1.0D-6
    integer  :: N,NPT

    real(dp) :: YY(12),dc_ji_min    
    real(dp) :: P(NDIM+1,NDIM), Y(NDIM)          ! Array con es que se construye AMOEBA

    t13 = YY(2)
    dm31= YY(11)

    N=NDIM
    NPT=2*N+1
    X(1)=DFLOAT(1)/DFLOAT(N+1)    
    RHOBEG=0.2D0*X(1)  
    CALL NEWUOA (N,NPT,X,RHOBEG,RHOEND,IPRINT,MAXFUN,W)
    !call DC_minimization(t13,dmee,P,Y)
    !dc_ji_min=Y(1)
    return
end subroutine DC_double_chooz