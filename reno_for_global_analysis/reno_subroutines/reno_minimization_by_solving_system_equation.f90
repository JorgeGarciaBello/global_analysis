subroutine reno_minimization_by_solving_system_equation(X)
    use reno_data, only: NDIM    
    implicit none        
        EXTERNAL             RFCN
        INTEGER              NSIG        
        INTEGER              ITMAX
        REAL*8               PAR(1),X(NDIM),FNORM,WK(NDIM*(3*NDIM+15)/2)

        INTEGER              u

        NSIG=10
        ITMAX=200
        PAR(1)=0.0d0
        X=(/0.0326D0,0.0561D0,                               &
            0.009D0,0.009D0,0.009D0,0.009D0,0.009D0,0.009D0, &
            0.0021D0,0.0015d0/)

        !print*, 'SE debe de quitar subroutine comentada'
        CALL ZSPOW(RFCN,NSIG,NDIM,ITMAX,PAR,X,FNORM,WK)

        !open(newunit=u,file='daya_for_global_analysis/db_data/db_solutions_to_system_of_pull_equations.dat', &
        !               position='append')
        !    write(u,*) X
        !close(u)
        !open(newunit=u,file='daya_for_global_analysis/db_data/db_FNORM_of_the_solutions_system_of_pull_equations.dat', &
        !               position='append')
        !    write(u,*) FNORM
        !close(u)  
    return
end subroutine reno_minimization_by_solving_system_equation