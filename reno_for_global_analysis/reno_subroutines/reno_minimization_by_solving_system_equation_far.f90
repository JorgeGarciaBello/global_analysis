subroutine reno_minimization_by_solving_system_equation_far(X)
    use reno_data, only: NDIM
    implicit none        
        EXTERNAL             RFCNF
        INTEGER              NSIG        
        INTEGER              ITMAX
        REAL*8               PAR(1),X(NDIM-1),FNORM,WK((NDIM-1)*(3*(NDIM-1)+15)/2)

        INTEGER              u

        NSIG=10
        ITMAX=200
        PAR(1)=0.0d0
        X=(/0.0561D0,                                        &
            0.009D0,0.009D0,0.009D0,0.009D0,0.009D0,0.009D0, &
            0.0021D0,0.0015d0/)
        
        CALL ZSPOW(RFCNF,NSIG,NDIM-1,ITMAX,PAR,X,FNORM,WK)
    return
end subroutine reno_minimization_by_solving_system_equation_far