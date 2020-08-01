subroutine DC_generate_efficiency()
    use types, only: dp
    use DC_settings, only: ADS,NBIN,num_experiments,randDis
    use DC_data, only:   efficiency,sigma_efficiency,rand_Nefficiency  
    implicit none    
    real(dp) :: sigma_efficiency_corr(ADS)
    real(dp) :: min_val(ADS), max_val(ADS)
    real(dp) :: ZBQLNOR
    real(dp) :: r
    integer :: i,n,d
    sigma_efficiency_corr=0.0_dp
    select case(randDis)
        case(1)
            do i=1,NBIN
                do n=1,num_experiments
                    do d=1,ADS
                    rand_Nefficiency(i,d,n) = ZBQLNOR(efficiency(d), efficiency(d)                      &
                                            *( (sigma_efficiency(d)+sigma_efficiency_corr(d))/100.0_dp )   )
                    enddo
                enddo
            enddo
        case(2)
          do d=1,ADS
            min_val(d)=efficiency(d)-efficiency(d)*( (sigma_efficiency(d) + sigma_efficiency_corr(d))/100.0_dp)
            max_val(d)=efficiency(d)+efficiency(d)*( (sigma_efficiency(d) + sigma_efficiency_corr(d))/100.0_dp)
          enddo
           do i=1,NBIN
              do n=1,num_experiments
                  do d=1,ADS
                      CALL RANDOM_NUMBER(r)
                      rand_Nefficiency(i,d,n) = min_val(d)*(1.0d0-r) + max_val(d)*r               
                  enddo
              enddo
          enddo

    end select
    !do i=1,100
    !  print*, rand_Nefficiency(1,1,i), rand_Nefficiency(38,2,i)    
    !enddo
    return
end subroutine DC_generate_efficiency