subroutine DC_generate_spectrum()
    use types
    use DC_settings, only: NBIN,num_experiments
    use DC_data, only: spectrum,sigma_spectrum,rand_Nspectrum_R1,rand_Nspectrum_R2
    implicit none    
    real(dp) :: min_AD1(NBIN), max_AD1(NBIN)
    real(dp) :: min_AD2(NBIN), max_AD2(NBIN)
    real(dp) :: r
    integer  :: i,n
    
    do i=1,NBIN
        min_AD1(i)=spectrum(i)-(sigma_spectrum(i)/100.0_dp)
        max_AD1(i)=spectrum(i)+(sigma_spectrum(i)/100.0_dp)

        min_AD2(i)=spectrum(i)-(sigma_spectrum(i)/100.0_dp)
        max_AD2(i)=spectrum(i)+(sigma_spectrum(i)/100.0_dp)
    enddo
    do i=1,NBIN
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Nspectrum_R1(i,n) = min_AD1(i)*(1.0d0-r) + max_AD1(i)*r
            CALL RANDOM_NUMBER(r)
            rand_Nspectrum_R2(i,n) = min_AD2(i)*(1.0d0-r) + max_AD2(i)*r
        enddo
    enddo
    do i=1, 1
        print*, rand_Nspectrum_R1(4,1:5)
        print*, rand_Nspectrum_R1(NBIN,1:5)
        print*, rand_Nspectrum_R2(4,1:5)
        print*, rand_Nspectrum_R2(NBIN,1:5)
    enddo
    return
end subroutine DC_generate_spectrum