!####################################################################
!
!   renoExpectedNeutrinoSpectrum_dr is the function that return the
!       expected neutirno spectrum in the detector "d" from the
!       reactor "r"
!
!####################################################################
real(8) function renoExpectedNeutrinoSpectrum_dr(x,d,r) ![#/MeV]
    use reno_data, only: osc,length_d_r,TP_d,NBIN
    use neu_osc_parameters
    implicit none    
    real(8) :: x                  ! Neutrino energy in [MeV]
    integer :: d,r                ! the number ot detector and reactor respectively
    integer :: i
    
    real(8) :: probabilityOfTransition_4f! Is the probability of transition three-framework
    real(8) :: probabilityOfTransition,probability
    real(8) :: crossSection       ! Is the cross section for the inverse beta decay [m^2]
    real(8) :: reno_reactorSpectrum    ! Is the spectrum of the reactors
    real(8) :: length             ! Is the length between reacto-detector [m]
    real(8) :: corrections(NBIN)
    !Datos tomados de: Daya Bay Reactor Neutrino Experiment
    !Supplemental Material
    !March 2016

    length = length_d_r(d,r)
    select case(osc)
        case(1)
            !print*,'probability',probability(t13,dm31,length,x)       
            !print*,'reno_reactorSpectrum',         reno_reactorSpectrum(x,r)                   ![#/MeV]                            
            !print*,'crossSection',         crossSection(x)                           ![m^2]                            
            !print*,    'TP_d',     TP_d(d)                                         ![#ofProtons]
            renoExpectedNeutrinoSpectrum_dr = (1.0D0 / (4.0D0*3.1415D0*length**2))* &   ![1/m^2]
                            !probabilityOfTransition_4f(1,1,t12,t13,t14,t23,t24,t34, &
                            !                               delta1,delta2,delta3,    &
                            !                               dm21,dm31,dm41,length,x)*&
                            probability(t13,dm31,length,x)*       &
                            reno_reactorSpectrum(x,r)* &                         ![#/MeV]                            
                            crossSection(x)* &                              ![m^2]                            
                            TP_d(d)                                         ![#ofProtons]
        case(2)
                renoExpectedNeutrinoSpectrum_dr = (1.0D0 / (4.0D0*3.1415D0*length**2))* &   ![1/m^2]                            
                            reno_reactorSpectrum(x,r)* &                         ![#/MeV]
                            crossSection(x)* &                              ![m^2]
                            TP_d(d)                                         ![#ofProtons]
        case DEFAULT
            renoExpectedNeutrinoSpectrum_dr = (1.0D0 / (4.0D0*3.1415D0*length**2))* &   ![1/m^2]
                            probabilityOfTransition_4f(1,1,t12,t13,t14,t23,t24,t34, &
                                                           delta1,delta2,delta3,    &
                                                           dm21,dm31,dm41,length,x)*&
                            reno_reactorSpectrum(x,r)* &                         ![#/MeV]
                            crossSection(x)* &                              ![m^2]
                            TP_d(d)                                     ![#ofProtons]
    end select    
    return
end function renoExpectedNeutrinoSpectrum_dr