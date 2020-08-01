subroutine DC_generate_thermal_power()
    use types
    use DC_settings, only: NBIN,RCTRS,randDis,num_experiments
    use DC_data, only: NBIN,thermal_power,sigma_thermal_power,rand_Nthermalpower
    implicit none    
    real(dp) :: min_p1(RCTRS),max_p1(RCTRS)
    real(dp) :: ZBQLNOR
    real(dp) :: r
    integer  :: i,j,n

    
    select case(randDis)
    case(1)
        do i=1,NBIN
            do n=1,num_experiments
                rand_Nthermalpower(i,1,n)=ZBQLNOR(thermal_power(1),thermal_power(1)*(sigma_thermal_power(1)/100.0_dp))
                rand_Nthermalpower(i,2,n)=ZBQLNOR(thermal_power(2),thermal_power(2)*(sigma_thermal_power(2)/100.0_dp))                
            enddo
        enddo
    case(2)
        do i=1,RCTRS
            min_p1(i)=thermal_power(i)-thermal_power(i)*(sigma_thermal_power(i)/100.0_dp)
            max_p1(i)=thermal_power(i)+thermal_power(i)*(sigma_thermal_power(i)/100.0_dp)
        enddo
        do i=1,NBIN
            do n=1,num_experiments
                do j=1,RCTRS
                    CALL RANDOM_NUMBER(r)
                    rand_Nthermalpower(i,j,n) = min_p1(j)*(1.0d0-r) + max_p1(j)*r                    
                enddo
            enddo
        enddo
    end select    
    !do i=1,10
    !    print*, rand_Nthermalpower(38,1,i),rand_Nthermalpower(38,2,i)
    !enddo
    return
end subroutine DC_generate_thermal_power