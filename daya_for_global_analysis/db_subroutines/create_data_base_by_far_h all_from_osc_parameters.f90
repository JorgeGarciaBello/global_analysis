subroutine create_data_base_by_far_hall_from_osc_parameters()
    use db_data, only: n, NBIN, grid_data_points, far_bin_events
    implicit none    
    integer :: d                            ! d is the detector number
    real(8) :: t13,dm31                     ! are the neutrino oscillation parameters we are interested
    real(8) :: expectedNeutrinoSpectrumByHallAndBin  ! is the function that return the number of neutrinos by detector from fixed neutrino oscillation parameters
    real(8) :: neuN(NBIN)    
    integer :: i,j,u
    !$omp parallel do private(dm31,t13,neuN)
    do i=1,n**2
        dm31=grid_data_points(i,1); t13=grid_data_points(i,2);         
        neuN(1)=expectedNeutrinoSpectrumByHallAndBin(3,1,t13,dm31)
        neuN(2)=expectedNeutrinoSpectrumByHallAndBin(3,2,t13,dm31)
        neuN(3)=expectedNeutrinoSpectrumByHallAndBin(3,3,t13,dm31)
        neuN(4)=expectedNeutrinoSpectrumByHallAndBin(3,4,t13,dm31)
        neuN(5)=expectedNeutrinoSpectrumByHallAndBin(3,5,t13,dm31)
        neuN(6)=expectedNeutrinoSpectrumByHallAndBin(3,6,t13,dm31)
        neuN(7)=expectedNeutrinoSpectrumByHallAndBin(3,7,t13,dm31)
        neuN(8)=expectedNeutrinoSpectrumByHallAndBin(3,8,t13,dm31)
        neuN(9)=expectedNeutrinoSpectrumByHallAndBin(3,9,t13,dm31)
        neuN(10)=expectedNeutrinoSpectrumByHallAndBin(3,10,t13,dm31)
        neuN(11)=expectedNeutrinoSpectrumByHallAndBin(3,11,t13,dm31)
        neuN(12)=expectedNeutrinoSpectrumByHallAndBin(3,12,t13,dm31)
        neuN(13)=expectedNeutrinoSpectrumByHallAndBin(3,13,t13,dm31)
        neuN(14)=expectedNeutrinoSpectrumByHallAndBin(3,14,t13,dm31)
        neuN(15)=expectedNeutrinoSpectrumByHallAndBin(3,15,t13,dm31)
        neuN(16)=expectedNeutrinoSpectrumByHallAndBin(3,16,t13,dm31)
        neuN(17)=expectedNeutrinoSpectrumByHallAndBin(3,17,t13,dm31)
        neuN(18)=expectedNeutrinoSpectrumByHallAndBin(3,18,t13,dm31)
        neuN(19)=expectedNeutrinoSpectrumByHallAndBin(3,19,t13,dm31)
        neuN(20)=expectedNeutrinoSpectrumByHallAndBin(3,20,t13,dm31)
        neuN(21)=expectedNeutrinoSpectrumByHallAndBin(3,21,t13,dm31)
        neuN(22)=expectedNeutrinoSpectrumByHallAndBin(3,22,t13,dm31)
        neuN(23)=expectedNeutrinoSpectrumByHallAndBin(3,23,t13,dm31)
        neuN(24)=expectedNeutrinoSpectrumByHallAndBin(3,24,t13,dm31)
        neuN(25)=expectedNeutrinoSpectrumByHallAndBin(3,25,t13,dm31)
        neuN(26)=expectedNeutrinoSpectrumByHallAndBin(3,26,t13,dm31)
        far_bin_events(i,:)= &
        (/sin(2.0d0*t13)**2, dm31, neuN(1), neuN(2), neuN(3), neuN(4), neuN(5), neuN(6), neuN(7), neuN(8), neuN(9), neuN(10),     &
          neuN(11), neuN(12), neuN(13), neuN(14), neuN(15), neuN(16), neuN(17), neuN(18), neuN(19), neuN(20), neuN(21), neuN(22), &
          neuN(23), neuN(24), neuN(25), neuN(26)/)
    enddo
    !$omp end parallel do
    open(newunit=u,file='data_base_by_far_hall_from_osc_parameters.dat')
        do i=1,n**2
        write(u,*) far_bin_events(i,:)
        enddo
    close(u)    
    return
end subroutine create_data_base_by_far_hall_from_osc_parameters