real(8) function FUNC(P)
    use db_data, only:NDIM
    !use neu_osc_parameters, only: t13,dm31
    implicit none
    real(8) :: P(NDIM)

    real(8) :: chiSquarePull1
    real(8) :: chiSquarePull2
    real(8) :: chiSquareProposal
    real(8) :: db_covariance_matrix_function
    
    
    !print*,'t13, dm31:*',t13,dm31
    FUNC=0.0D0
    !FUNC=1.0d0 &!+t13 + dm31 &
    !           +(1.0d0-P(1))**2 +(1.0d0-P(2))**2 +(1.0d0-P(3))**2 &
    !           +(1.0d0-P(4))**2 +(1.0d0-P(5))**2 +(1.0d0-P(6))**2 &
    !           +(1.0d0-P(7))**2 +(1.0d0-P(8))**2 +(1.0d0-P(9))**2 

    FUNC=chiSquarePull1(P)
    !FUNC=chiSquarePull2(P)
    !FUNC=chiSquareProposal(P)
    !FUNC=db_covariance_matrix_function(P)
    PRINT*,'FUNC: ',FUNC
    return
end function FUNC