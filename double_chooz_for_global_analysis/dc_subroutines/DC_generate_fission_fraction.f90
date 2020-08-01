subroutine DC_generate_fission_fraction()
    use types, only: dp
    use DC_settings, only: NBIN,RIR,randDis,num_experiments
    use DC_data, only: fission_fractions,sigma_fission_fractions,rand_Nfissionfraction                                                   
    implicit none    
    real(dp) :: min_p1(RIR), max_p1(RIR)
    real(dp) :: ZBQLNOR
    real(dp) :: r
    integer  :: i,j,n

    !sigma_fission_fractions=0.0d0
    select case(randDis)
    case(1)
        do i=1,NBIN
            do n=1,num_experiments
                do j=1,RIR
                    rand_Nfissionfraction(i,j,n) = &
                    ZBQLNOR(fission_fractions(j),fission_fractions(j)*(sigma_fission_fractions(j)/100.0_dp))
                enddo
            enddo
        enddo
    case(2)
        do i=1,RIR
            min_p1(i)=fission_fractions(i)-fission_fractions(i)*(sigma_fission_fractions(i)/100.0_dp)
            max_p1(i)=fission_fractions(i)+fission_fractions(i)*(sigma_fission_fractions(i)/100.0_dp)     
        enddo
        do i=1,NBIN
            do n=1,num_experiments
                do j=1,RIR
                    CALL RANDOM_NUMBER(r)            
                    rand_Nfissionfraction(i,j,n) = min_p1(j)*(1.0d0-r) + max_p1(j)*r
                enddo            
            enddo
        enddo
    end select
    !do i=1, num_experiments
    !    print*, rand_Nfissionfraction(38,1,i),rand_Nfissionfraction(38,2,i), rand_Nfissionfraction(38,3,i), &
    !            rand_Nfissionfraction(38,4,i)    
    !enddo
    return
end subroutine DC_generate_fission_fraction