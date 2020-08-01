function DC_M_reactor_spectrum(x,r,bin,k_rand) ! [MeV/s]
    use types        
    use DC_data, only: fission_fractions,rand_Nspectrum_R1,rand_Nspectrum_R2,rand_Nthermalpower,rand_Nfissionfraction, &
                       rand_Navrgenergyperfission
    implicit none
    real(dp) :: DC_M_reactor_spectrum
    real(dp) :: spectrum, spectrum235U, spectrum238U, spectrum239Pu, spectrum241Pu
    real(dp) :: x                  ! x es la energía de neutrino    
    real(dp) :: reactorFlu
    integer  :: r,bin,k_rand
       
    reactorFlu = 0.0    
    reactorFlu = rand_Nfissionfraction(bin,1,k_rand)*spectrum235U(x)  &
               + rand_Nfissionfraction(bin,2,k_rand)*spectrum238U(x)  &
               + rand_Nfissionfraction(bin,3,k_rand)*spectrum239Pu(x) &  
               + rand_Nfissionfraction(bin,4,k_rand)*spectrum241Pu(x)
    select case(r)
        case(1)
            reactorFlu = rand_Nspectrum_R1(bin,k_rand)*reactorFlu*6.2415D+21            
        case(2)
            reactorFlu = rand_Nspectrum_R1(bin,k_rand)*reactorFlu*6.2415D+21            
    end select
    DC_M_reactor_spectrum = (rand_Nthermalpower(bin,r,k_rand)/rand_Navrgenergyperfission(bin,k_rand))*reactorFlu
    ! 6.2415*1E+21 => [1GW] = [1GJ/s] = [6,2415 × 10^27 eV/s] = [6,2415 × 10^21 MeV/s]
    !                   [MeV/s]*[MeV-1*fission]*[# MeV-1 fission-1]=[# MeV-1 s-1]
end function DC_M_reactor_spectrum