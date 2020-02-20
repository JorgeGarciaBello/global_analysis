subroutine makeFakeData()
    use neu_osc_parameters
    use db_data, only:NBIN,farExp
    implicit none
    real(8) :: expectedNumberNeutrinosDetector ! return the number of expected neutrinos per detector. T_d in paper.
    real(8) :: expectedNumberOfNeutrinosByDetectorFromSumOfBins
    real(8) :: model
    
    real(8) :: T_d
    integer :: d,i

    print*,'Making fake data'
    !Fit dm31 and theta_13
    t12=0.5837630476d0
    t13=asin(sqrt(0.0856d0))/2.0d0                  !########## Parámetro de ocilación impuesto para generar FAKE-DATA  ########### se tomma del paper de 2018
    t14=0.0d0
    t23=0.71011D0 ! Normal Hierarchy 0.71011D0 ! Inverted Hierarchy 0.87487d0
    t24=0.0d0
    t34=0.0d0

    delta1=0.0d0
    delta2=0.0d0
    delta3=0.0d0
    
    dm21=7.53D-5
    dm31=2.5220d-3                  !########## Parámetro de ocilación impuesto para generar FAKE-DATA ###########3  Se toma del paper de 2018
    dm41=0.0d0   

    open(201,file='daya_for_global_analysis/db_data/fake_data_2019_spectrum_maked_by_detector_analysis_x.dat')
    do d=1,8
        T_d=expectedNumberOfNeutrinosByDetectorFromSumOfBins(d)
        write(201,*) T_d
    enddo

    !do d=1,8
    !    T_d=expectedNumberNeutrinosDetector(d)
    !    write(201,*) T_d
    !enddo

    !do i=1,NBIN
    !    write(201,*) farExp(i)*model(i)
    !enddo
    close(201)
    return
end subroutine makeFakeData