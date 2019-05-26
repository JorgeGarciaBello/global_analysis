subroutine readDBData()
    use db_data
    implicit none
    integer :: i,j,reason

    open(16,file="data/dataService/weightsPerNearHall.dat", status="old")
    open(17,file="data/dataService/weightsPerHs.dat", status="old")
    open(18,file="data/dataService/weithsPerAd.dat", status="old")    
    open(19,file="data/dataService/blue_spectrum_by_hall.dat", status="old")
    open(20,file="data/dataService/black_spectrum_by_hall.dat", status="old")
    !open(21,file="data/dataService/background_detector.dat", status="old")
    open(21,file="data/dataService/background_detector_1809.dat", status="old")    
    open(22,file="data/dataService/detector_sigma_background.dat", status="old")
    open(23,file="data/dataService/fraction_nuclear_fission.dat", status="old")
    open(24,file="data/dataService/IBD_fractions_dr.dat", status="old")
    open(25,file="data/dataService/live_time_days_per_ad_1809.dat", status="old")
    open(26,file="data/dataService/target_proton.dat", status="old")
    open(27,file="data/dataService/lengths_detector_reactor.dat", status="old")
    open(28,file="data/dataService/thermal_power_by_reactor.dat", status="old")
    open(29,file="data/dataService/bines.dat", status="old")
    open(30,file="data/dataService/v_ij_1.dat", status="old")
    open(31,file='data/dataService/n_nom_array.dat', status='old')
    open(32,file='data/dataService/n_obs.dat', status='old')
    !open(33, file='data/dataService/Md_1607.dat', status='old')
    open(33,file='data/dataService/Md_1809.dat', status='old')
    open(34,file='data/dataService/dayabay_efficiency_weighted_target_protons.dat',status='old')
    open(36,file='data/dataService/geometric_factor.dat',status='old')
    open(37,file='data/dataService/dayabay_1809_far_obs_background_subtracted_spectrum_IBD.dat',status='old')
    open(38,file='data/dataService/dayabay_1809_far_exp_background_subtracted_spectrum_IBD.dat',status='old')
    open(39,file='data/dataService/dayabay_1809_total_period_uncertainty_of_background_H3_hall.dat',status='old')
    open(40,file='data/dataService/dayabay_1809total_far_bkg_in_three_period_of_data_taking.dat',status='old')
    
        read(16,*,IOSTAT=reason) ((wNH(i,j), j=1,2), i=1,34)
        read(17,*,IOSTAT=reason) ((wH(i,j), j=1,8), i=1,34)
        read(18,*,IOSTAT=reason) ((wD(i,j), j=1,6), i=1,272)
        read(19,*,IOSTAT=reason) ((blueH(i,j),j=1,3),i=1,34)
        read(20,*,IOSTAT=reason) ((blackH(i,j),j=1,3),i=1,34)        
        read(21,*,IOSTAT=reason) Bd
        read(22,*,IOSTAT=reason) Sb
        read(23,*,IOSTAT=reason) FNF
        read(24,*,IOSTAT=reason) ((IBD_fdr(i,j), j=1,RCTS), i=1,ADS)
        read(25,*,IOSTAT=reason) LT_d   ! [days]
        read(26,*,IOSTAT=reason) TP_d
        read(27,*,IOSTAT=reason) ((length_d_r(i,j), j=1,RCTS), i=1,ADS) ! [m]
        read(28,*,IOSTAT=reason) TP_r
        read(29,*,IOSTAT=reason) ((bines(i,j), j=1,2), i=1,34)
        read(30,*,IOSTAT=reason) ((v_ij_1(i,j), j=1,34), i=1,34)
        read(31,*,IOSTAT=reason) N_nom
        read(32,*,IOSTAT=reason) N_obs
        read(33,*,IOSTAT=reason) Md_1607
        read(34,*,IOSTAT=reason) N_e
        read(36,*,IOSTAT=reason) ((gFactor(i,j), j=1,RCTS), i=1,4)
        read(37,*,IOSTAT=reason) farObs
        read(38,*,IOSTAT=reason) farExp
        read(39,*,IOSTAT=reason) sigmaFarBkg
        read(40,*,IOSTAT=reason) farBkg
    close(16)
    close(17)
    close(18)
    close(19)
    close(20)
    close(21)
    close(22)
    close(23)
    close(24)
    close(25)
    close(26)
    close(27)
    close(28)
    close(29)
    close(30)
    close(31)
    close(32)
    close(33)
    close(34)
    close(36)
    close(37)
    close(38)
    close(39)
    close(40)
    !print*, 'farObs', farObs
    !print*, 'farExp', farExp
    return
end subroutine readDBData