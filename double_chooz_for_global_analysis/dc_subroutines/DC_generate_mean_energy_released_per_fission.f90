subroutine DC_generate_mean_energy_released_per_fission()
    use types
    use DC_settings, only: NBIN,randDis, num_experiments
    use DC_data, only: mean_energy_released_per_fission,sigma_mean_energy_released_per_fission,rand_Navrgenergyperfission
    implicit none    
    real(dp) :: min, max
    real(dp) :: ZBQLNOR
    real(dp) :: r
    integer :: i,n
    !sigma_average_energy_released_per_fission=0.0d0
    select case(randDis)
    case(1)
        do i=1,NBIN
            do n=1,num_experiments
                rand_Navrgenergyperfission(i,n) = &
                            ZBQLNOR(mean_energy_released_per_fission, &
                                    mean_energy_released_per_fission*(sigma_mean_energy_released_per_fission/100.0_dp))                
            enddo
        enddo
    case(2)
        min=mean_energy_released_per_fission &
              -mean_energy_released_per_fission*(sigma_mean_energy_released_per_fission/100.0_dp)
        max=mean_energy_released_per_fission &
              +mean_energy_released_per_fission*(sigma_mean_energy_released_per_fission/100.0_dp)
        do i=1,NBIN
            do n=1,num_experiments
                CALL RANDOM_NUMBER(r)
                rand_Navrgenergyperfission(i,n) = min*(1.0d0-r) + max*r                
            enddo
        enddo       
    end select
    !do i=1, num_experiments
    !    print*, rand_Navrgenergyperfission(1,i),rand_Navrgenergyperfission(38,i)
    !enddo
    return
end subroutine DC_generate_mean_energy_released_per_fission