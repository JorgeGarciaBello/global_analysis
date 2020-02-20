!#################################################################################################################
!
!       expectedNumberOfNeutrinosByDetectorBin: is the function that return 
!           the expected neutirno spectrum bay energy-bin and by far-hall
!
!#################################################################################################################
real(8) function expectedNumberOfNeutrinosByDetectorBin(d,i)
    use db_data, only: bines,NBIN
    implicit none   
    integer :: i                          ! is the number of energy bin
    integer :: d                          ! is the number of antineutrino detector    
    real(8) :: a,b                        ! limits of the bin
    real(8) :: h
    integer :: k,n=100
    real(8) :: x
    real(8) :: expectedNeutrinoSpectrum_d !function that return the expected neutirno spectrum by hall        
    
    real(8) :: scaled(NBIN)
    real(8) :: ALPHA(NBIN)
    real(8) :: corrections_percetage(NBIN)    

    !PROBAR CON LA SIGUIETE ALPHA POR BIN
    ALPHA=(/1.02,1.026,1.034,1.03,1.03,1.02,1.01,1.01,1.01,1.01,   &
            1.00,1.01,1.00,1.01,1.00,1.01,1.00,1.00,1.01,0.99,     &
            0.95,0.98,1.00,1.00,0.90,0.70/)
            
    corrections_percetage=(/1.32477148644256,1.5500858788633,1.41907408490622,1.34533759811376,1.30442442923759,   &
                            1.30059002819114,1.29469740363737,1.28807123120626,1.30459540986711,1.31625507801924,  &
                            1.31011244550608,1.30624498764775,1.34262402548813,1.4067285619341,1.47400688596567,   &
                            1.51171390358526,1.53910448100627,1.54718696058569,1.5226560040757,1.53483904964685,   &
                            1.57304367810321,1.5615914239757,1.56683898112058,1.29239009110244,1.79612504926691,   &
                            1.18819852607375/)
    scaled=(/1.35235593677508,1.61259710861774,1.44386426222964,1.38584122519551,1.3424133006237, &
            1.33543778873297,1.31467415513425,1.3079203160526,1.33631340514895,1.32620991071718, &
            1.32020327220882,1.3226751677687,1.35152141224265,1.42616143547303,1.47728476558342, &
            1.53450551452618,1.55140628154286,1.55479917080536,1.55128566163626,1.53194780002657, &
            1.50891570954927,1.53640609683665,1.55395857219627,1.27975321481621,1.71655384919,    &
            0.835093739150404/)
    

        
    a=bines(i,1); b=bines(i,2)
    expectedNumberOfNeutrinosByDetectorBin=0.0d0
    h=(b-a)/real(n)
    do k=1,n
        x=a+h*real(k-1)
        expectedNumberOfNeutrinosByDetectorBin=expectedNumberOfNeutrinosByDetectorBin      &
                                    + h*( expectedNeutrinoSpectrum_d(x,d)   &
                                         +expectedNeutrinoSpectrum_d(x+h,d) &
                                        )/2.0d0
    enddo    
    !expectedNumberOfNeutrinosByDetectorBin=ALPHA(i)*corrections_percetage(i)*expectedNumberOfNeutrinosByDetectorBin
    expectedNumberOfNeutrinosByDetectorBin=scaled(i)*expectedNumberOfNeutrinosByDetectorBin    
    return
end function expectedNumberOfNeutrinosByDetectorBin