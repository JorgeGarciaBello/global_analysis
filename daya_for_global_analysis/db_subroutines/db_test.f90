subroutine db_test()
    use db_data
    use neu_osc_parameters
    implicit none
    integer :: i,d,u
    real(8) :: spectrum
    real(8) :: expectedNumberOfNeutrinosByDetectorBin
    real(8) :: expectedNeutrinoSpectrumByBinFar
    real(8) :: Y(12)              ! Arreglo con los parámetros de oscilación

    print*, 'Daya Bay Test'
    select case(2)
        case(1)
        !###########################################
        !
        !   Testing of neutrino spectrum by bin 
        !       in the Far site without calibration
        !
        !###########################################
        Y=0.0
        t12=Y(1)
        t13=Y(2)
        t14=Y(3)
        t23=Y(4)
        t24=Y(5)
        t34=Y(6)
        delta1=Y(7)
        delta2=Y(8)
        delta3=Y(9)
        dm21=Y(10)
        dm31=Y(11)
        dm41=Y(12)
        open(newunit=u, &
             file='daya_for_global_analysis/db_data/db_expected_neutrino_spectrum_by_bin_in_far_site_without_calibration.dat')
        do i=1,NBIN
            spectrum=expectedNeutrinoSpectrumByBinFar(i)
            write(u,*) i, spectrum
        enddo
        close(u)
        case(2)
        !###########################################
        !
        !   Testing of neutrino spectrum by bin 
        !       in the Far site calibrated
        !       with the valius of the best fit 
        !       of Daya Bay
        !
        !###########################################
        Y=0.0
        t12=Y(1)
        t13=asin(sqrt(0.0856d0))/2.0d0
        t14=Y(3)
        t23=Y(4)
        t24=Y(5)
        t34=Y(6)
        delta1=Y(7)
        delta2=Y(8)
        delta3=Y(9)
        dm21=Y(10)
        dm31=2.522d-3
        dm41=Y(12)
        open(newunit=u, &
             file='daya_for_global_analysis/'//  &
                  'db_data/'//                  &
                  'db_expected_neutrino_spectrum_by_bin_in_far_site_without_calibration_with_osc_best_fit_daya_bay.dat')
        do i=1,NBIN
            spectrum=expectedNeutrinoSpectrumByBinFar(i)
            write(u,*) i, spectrum
        enddo
        close(u)

        case(3)
        !##########################################
        !
        !    Number of detector
        !
        !##########################################       
        d=8
        open(newunit=u,file='db_expectedNumberOfNeutrinosByDetectorBin_sin_calibration.dat')
        do i=1,NBIN
            spectrum=expectedNumberOfNeutrinosByDetectorBin(d,i)
            write(u,*) i, spectrum
        enddo
        close(u)
    end select
    return
end subroutine db_test