subroutine DBDetectorsTest()
    use db_data, only: n,NDIM,ADS,RCTS,Md=>Md_1607,Bd,grid_events_data_points
    use neu_osc_parameters
    implicit none
    real(8) :: P(NDIM),P_db(NDIM), P_res(NDIM)
    real(8) :: eps                ! is the parameter of absolute normalization
    real(8) :: alphaR(RCTS)       ! is an array with pull parameters reactor
    real(8) :: epsD(ADS)          ! is an array with pull parameters detector
    real(8) :: etaD(ADS)          ! is an array with pull parameters background-detector    
    real(8) :: eps_a                ! is the parameter of absolute normalization
    real(8) :: alphaR_a(RCTS)       ! is an array with pull parameters reactor
    real(8) :: epsD_a(ADS)          ! is an array with pull parameters detector
    real(8) :: etaD_a(ADS)          ! is an array with pull parameters background-detector    
    real(8) :: sum_W_alp
    integer :: d,r,i
    real(8) :: Td_db,Td_res
    real(8) :: neutrinos(ADS)    
    real(8) :: pulls(NDIM)
    real(8) :: Z(NDIM+1)    
    real(8) :: expectedNumberNeutrinosDetectorBin
    real(8) :: expectedNumberNeutrinosDetectorFromSumOfBin

    t13=asin(sqrt(0.0856d0))/2.0d0
    dm31=2.522d-3
    do d=1,ADS
        print*,d,expectedNumberNeutrinosDetectorFromSumOfBin(d,t13,dm31)
    enddo
    return
end subroutine DBDetectorsTest
