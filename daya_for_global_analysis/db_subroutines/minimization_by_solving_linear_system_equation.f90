subroutine minimization_by_solving_linear_system_equation(X)
    use db_data, only: NDIM
    implicit none        
        EXTERNAL             FCN
        INTEGER              NSIG        
        INTEGER              ITMAX
        REAL*8               PAR(1),X(NDIM),FNORM,WK(NDIM*(3*NDIM+15)/2)

        INTEGER              u

        NSIG=10
        ITMAX=200
        PAR(1)=0.0d0
        X=(/0.0D0,                                                                     &
            0.004d0,0.004d0,0.004d0,0.004d0,0.004d0,0.004d0,                           &
            0.001d0,0.001d0,0.001d0,0.001d0,0.001d0,0.001d0,0.001d0,0.001d0,           &
            1040.0D0,1176.0D0,875.0D0,782.0D0,155.0D0,150.0D0,150.0D0,133.0D0/)

        print*, 'SE debe de quitar subroutine comentada'
        !CALL ZSPOW(FCN,NSIG,NDIM,ITMAX,PAR,X,FNORM,WK)

        open(newunit=u,file='db_data/db_solutions_to_system_of_pull_equations.dat',position='append')
            write(u,*) X
        close(u)
        open(newunit=u,file='db_data/db_FNORM_of_the_solutions_system_of_pull_equations.dat',position='append')
            write(u,*) FNORM
        close(u)  
    return
end subroutine minimization_by_solving_linear_system_equation