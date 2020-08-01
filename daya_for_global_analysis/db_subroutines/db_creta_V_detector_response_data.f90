subroutine db_creta_Vdr_data(n,Hn,Hf,period,data_near,data_far)
    use db_data, only: NBIN
    implicit none
    integer :: n,Hn,Hf,period
    real(8) :: data_near(NBIN,n), data_far(NBIN,n)
    
    real(8) :: expectedSpectrumNeutrinoByHallPeriodBin, expectedNumberNeutrinoByHallPeriodBin
    real(8) :: t13, dm31
    real(8) :: ra_near(n),ra_far(n)
    integer :: i, u

    t13=0.0d0; dm31=0.0d0;
    do i=1,NBIN
        call random_array_from_one_sigma_error(n,expectedSpectrumNeutrinoByHallPeriodBin(Hn,period,i,t13,dm31),ra_near)
        call random_array_from_one_sigma_error(n,expectedSpectrumNeutrinoByHallPeriodBin(Hf,period,i,t13,dm31),ra_far)

        !call random_array_from_one_sigma_error(n,expectedNumberNeutrinoByHallPeriodBin(Hn,period,i,t13,dm31),ra_near)
        !call random_array_from_one_sigma_error(n,expectedNumberNeutrinoByHallPeriodBin(Hf,period,i,t13,dm31),ra_far)        
        data_near(i,:)=ra_near
        data_far(i,:)=ra_far
    enddo 
    return
end subroutine db_creta_Vdr_data