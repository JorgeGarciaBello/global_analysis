subroutine DC_generate_total_Bkg()
    use types
    use DC_settings, only: NBIN,randDis,num_experiments
    use DC_data, only: fast_neutron_n,litio_n,accidental_n,fast_neutron_f,litio_f,accidental_f,                  &
    sigma_fast_neutron_n,sigma_litio_n,sigma_accidental_n,sigma_fast_neutron_f,sigma_litio_f,sigma_accidental_f, &
    rand_Nbkgtotal
    implicit none
    real(dp) :: min_n(3), max_n(3)
    real(dp) :: min_f(3), max_f(3)
    real(dp) :: r
    integer  :: i,j,n    
    do i=1,NBIN        
            min_n(1)= - fast_neutron_n(i)*(sigma_fast_neutron_n(i)/100.0_dp)
            max_n(1)=   fast_neutron_n(i)*(sigma_fast_neutron_n(i)/100.0_dp)
            min_n(2)= - litio_n(i)*(sigma_litio_n(i)/100.0_dp)
            max_n(2)=   litio_n(i)*(sigma_litio_n(i)/100.0_dp)
            min_n(3)= - accidental_n(i)*(sigma_accidental_n(i)/100.0_dp)
            max_n(3)=   accidental_n(i)*(sigma_accidental_n(i)/100.0_dp)

            min_f(1)= - fast_neutron_f(i)*(sigma_fast_neutron_f(i)/100.0_dp)
            max_f(1)=   fast_neutron_f(i)*(sigma_fast_neutron_f(i)/100.0_dp)
            min_f(2)= - litio_f(i)*(sigma_litio_f(i)/100.0_dp)
            max_f(2)=   litio_f(i)*(sigma_litio_f(i)/100.0_dp)
            min_f(3)= - accidental_f(i)*(sigma_accidental_f(i)/100.0_dp)
            max_f(3)=   accidental_f(i)*(sigma_accidental_f(i)/100.0_dp)

            !!print*,'i:', i
            !print*,min_n(1),max_n(1)
            !print*,min_n(2),max_n(2)
            !print*,min_n(3),max_n(3)
            !print*,' '
            !print*,min_f(1),max_f(1)
            !print*,min_f(2),max_f(2)
            !print*,min_f(3),max_f(3)           

        do n=1,num_experiments
                CALL RANDOM_NUMBER(r)
                rand_Nbkgtotal(i,1,1,n) = min_n(1)*(1.0d0-r) + max_n(1)*r
                CALL RANDOM_NUMBER(r)            
                rand_Nbkgtotal(i,2,1,n) = min_f(1)*(1.0d0-r) + max_f(1)*r
                CALL RANDOM_NUMBER(r)
                rand_Nbkgtotal(i,1,2,n) = min_n(2)*(1.0d0-r) + max_n(2)*r
                CALL RANDOM_NUMBER(r)            
                rand_Nbkgtotal(i,2,2,n) = min_f(2)*(1.0d0-r) + max_f(2)*r
                CALL RANDOM_NUMBER(r)
                rand_Nbkgtotal(i,1,3,n) = min_n(3)*(1.0d0-r) + max_n(3)*r
                CALL RANDOM_NUMBER(r)            
                rand_Nbkgtotal(i,2,3,n) = min_f(3)*(1.0d0-r) + max_f(3)*r            
        enddo
    enddo
    !do i=1,38
    !    print*,rand_Nbkgtotal(i,1,1,1),rand_Nbkgtotal(i,1,2,1),rand_Nbkgtotal(i,1,3,1) ! Near
    !    print*,rand_Nbkgtotal(i,2,1,1),rand_Nbkgtotal(i,2,2,1),rand_Nbkgtotal(i,2,3,1) ! Far     
    !enddo
    return
end subroutine DC_generate_total_Bkg