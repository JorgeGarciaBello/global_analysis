subroutine DC_generate_cross_section()
    use types, only: dp
    use DC_settings, only: NBIN,randDis,num_experiments 
    use DC_data, only: mean_cross_section,sigma_mean_cross_section,rand_Ncrosssection                                                    
    implicit none
    REAL(dp) :: ZBQLNOR
    real(dp) :: min_val(NBIN), max_val(NBIN)
    real(dp) :: r
    integer :: i,n
    !sigma_mean_cross_section=0.0d0
    select case(randDis)
        case(1)
            do i=1,NBIN
                do n=1,num_experiments
                    rand_Ncrosssection(i,n) = ZBQLNOR(mean_cross_section(i), &
                                                   mean_cross_section(i)*(sigma_mean_cross_section(i)/100.0_dp))                    
                enddo
            enddo
        case(2)
            do i=1,NBIN       
                min_val(i)=mean_cross_section(i)-mean_cross_section(i)*( sigma_mean_cross_section(i)/100.0_dp )
                max_val(i)=mean_cross_section(i)+mean_cross_section(i)*( sigma_mean_cross_section(i)/100.0_dp )                
            enddo
            do i=1,NBIN
                do n=1,num_experiments
                    CALL RANDOM_NUMBER(r)
                    rand_Ncrosssection(i,n) = min_val(i)*(1.0d0-r) + max_val(i)*r                    
                enddo
            enddo
    end select    
    !do i=1, num_experiments
    !   print*, rand_Ncrosssection(1,i),rand_Ncrosssection(38,i)
    !enddo
    return
end subroutine DC_generate_cross_section