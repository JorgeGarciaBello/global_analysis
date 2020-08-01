subroutine db_initial_data_for_signal_matrix(P,H,data)
    use db_data, only: NBIN
    implicit none
    integer :: P,H
    real(8) :: data(NBIN)
    real(8) :: expectedNumberNeutrinoByHallPeriodBin
    real(8) :: t13,dm31
    integer :: i
    t13=0.0d0
    dm31=0.0d0
    do i=1,NBIN
        data(i)=expectedNumberNeutrinoByHallPeriodBin(H,P,i,t13,dm31)
    enddo
    return
end subroutine db_initial_data_for_signal_matrix