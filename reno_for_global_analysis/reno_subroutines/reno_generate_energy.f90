subroutine reno_generate_energy()
    use types
    use reno_data, only: NBIN,randDis,num_experiments, &
                       neutrino_energy,sigma_energy_scale,rand_Nenergy
    implicit none    
    real(dp) :: min_1(NBIN), max_1(NBIN)
    REAL(dp) :: ZBQLNOR
    real(dp) :: r,cal
    integer :: i,j,n
    cal=1.0_dp
    !sigma_energy_scale=0.0d0
    select case(randDis)
        case(1)            
            do i=1,NBIN
                do n=1,num_experiments
                    rand_Nenergy(i,n) = ZBQLNOR(1.0d0,sigma_energy_scale*cal/100.0d0)
                enddo
            enddo
        case(2)            
            do i=1,NBIN
                min_1(i)=neutrino_energy(i)-neutrino_energy(i)*(sigma_energy_scale*cal/100.0d0)
                max_1(i)=neutrino_energy(i)+neutrino_energy(i)*(sigma_energy_scale*cal/100.0d0)
            enddo
            do i=1,NBIN
                do n=1,num_experiments
                    CALL RANDOM_NUMBER(r)
                    rand_Nenergy(i,n) = min_1(i)*(1.0d0-r) + max_1(i)*r
                enddo
            enddo
    end select
    !PRINT*,'*****'
    !do i=1, num_experiments
    !    print*, rand_Nenergy(1,i)
    !    print*, rand_Nenergy(26,i)
    !enddo
    return
end subroutine reno_generate_energy