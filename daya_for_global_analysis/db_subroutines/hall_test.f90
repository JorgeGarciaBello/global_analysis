subroutine hallTest()
    use neu_osc_parameters
    use db_data, only: NBIN,farObs,farExp,N_obs_near,N_obs_far
    implicit none    
    real(8) :: t13_db, dm31_db
    real(8) :: t13_my, dm31_my

    real(8) :: expectedNumberNeutrinosDetector
    real(8) :: expectedNeutrinoSpectrum_H
    real(8) :: expectedNumberNeutrinosHall
    real(8) :: model
    integer :: num
    
    real(8) :: expectedNumberNeutrinoByHallAndBin
    real(8) :: expectedNeutrinoSpectrumByHallAndBin
    real(8) :: expectedNeutrinoSpectrumByBinNear, expectedNeutrinoSpectrumByBinFar

    real(8) :: expectedNumberNeutrinoByBinNear
    real(8) :: expectedNumberNeutrinoByBinFar

    integer :: d
    integer :: i
    integer :: H
    real(8) :: corrections(NBIN)
    real(8) :: db_partial_chi2_alpha_r
    
    print*, ' In hallTest'
   
    !t13=asin(sqrt(0.0856d0))/2.0d0
    !dm31=2.522D-3!2.8560000000000000d-003!2.5D-3

    select case(2)
        case(1)
            print*, '*Spectrum from H1'
            H=1
            do i=1,NBIN
                print*, expectedNumberNeutrinoByHallAndBin(H,i,t13,dm31)    
            enddo
            print*, '*Spectrum from H2'
            H=2
            do i=1,NBIN
                print*, expectedNumberNeutrinoByHallAndBin(H,i,t13,dm31)       
            enddo
            print*, '*Spectrum from H3'
            H=3
            do i=1,NBIN
                print*, expectedNumberNeutrinoByHallAndBin(H,i,t13,dm31)        
            enddo
        case(2)
            t13_db=asin(sqrt(0.0856d0))/2.0d0; dm31_db=2.522D-3
            t13_my=asin(sqrt(0.21131558192543945d0))/2.0d0; dm31_my=2.4337748344370859d-003
            print*, 'N_obs_Near,N_epx_Near '
            do i=1, NBIN
                print*,N_obs_near(i), &               
                       expectedNumberNeutrinoByBinNear(i,t13_db,dm31_db), &
                       expectedNumberNeutrinoByBinNear(i,t13_my,dm31_my) 
            enddo
            print*,''
            print*, 'N_obs_Far,N_epx_Far '
            do i=1, NBIN
                print*,N_obs_far(i), &
                       expectedNumberNeutrinoByBinFar(i,t13_db,dm31_db), &
                       expectedNumberNeutrinoByBinFar(i,t13_my,dm31_my)
            enddo
        case(3)
            t13=0.0d0
            dm31=0.0d0
            print*, 'Near data'
            do i=1,NBIN                
                print*, i,expectedNeutrinoSpectrumByBinNear(i,t13,dm31)
            enddo
            print*, ''
            print*, 'Far data'
            do i=1,NBIN                
                print*, i,expectedNeutrinoSpectrumByBinFar(i,t13,dm31)
            enddo
    end select
    return
end subroutine hallTest