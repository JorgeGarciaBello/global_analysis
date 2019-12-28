subroutine db_chiDistributionDmee(n)
    implicit none
    integer :: n                        ! Number of partitions in the interest interval
    real(8) :: readminResults(3)
    real(8) :: t13
    integer :: reason

    integer :: i,j
    real(8) :: m_jump
    real(8) :: m_0=2.3d-3
    real(8) :: m_1=2.6d-3
    real(8) :: sen2_2t_13
    real(8) :: min_val =1e+10,dmee_min
    real(8) :: dmee
    real(8) :: chi2_min
    real(8) :: Z(12)
    real(8) :: minDmee(2),valuesDmee(n+1,2)
    real(8) :: new_chi
    real(8) :: uncer_dmee_left=0.0
    real(8) :: uncer_dmee_right=0.0
    
    print*,'You are running db_chiDistributionDmee() . . . '
    open(93, file='daya_for_global_analysis/db_data/db_data_min_parameters.dat',status='old')
        read(93,*,IOSTAT=reason) readminResults
    close(93)
    open(197, file='daya_for_global_analysis/db_data/db_distribution_chi_dmee.dat')
    open(198, file='daya_for_global_analysis/db_data/db_distribution_chi_dmee_min.dat')
    t13=(asin(sqrt(readminResults(2))))/2.0d0
    m_jump = (m_1-m_0)/real(n)    ! For t13    
    dmee=m_0
    do i=0,n        
            Z=(/0.0d0,t13,0.0d0,0.0d0,0.0d0,0.0d0,0.0d0,0.0d0,0.0d0,0.0d0,dmee,0.0d0/)
            call chi2_db(Z,chi2_min)            
            write(197,*) dmee, chi2_min 
            if(min_val.GE.chi2_min) then 
                min_val = chi2_min
                dmee_min = dmee
             endif
            dmee=dmee+m_jump
        print*, i,'%'
    enddo
    write(198,*) min_val, dmee_min
    close(197)
    close(198)

    open(94,file='daya_for_global_analysis/db_data/db_distribution_chi_dmee_min.dat',status='old')
        read(94,*) minDmee
    close(94)
    open(95,file='daya_for_global_analysis/db_data/db_distribution_chi_dmee.dat',status='old')
        read(95,*) ((valuesDmee(i,j), j=1,2), i=1,n+1)
    close(95)
    open(199,file='daya_for_global_analysis/db_data/db_distribution_chi_dmee.dat',status='old')
        do i=1,n+1
            new_chi=valuesDmee(i,2)-minDmee(1) !Valores de Delta chi
            write(199,*) valuesDmee(i,1), new_chi
            if(valuesDmee(i,1).LT.dmee_min) then
                if((new_chi.GE.0.97).and.(new_chi.LE.1.035)) then
                    uncer_dmee_left=dmee_min-valuesDmee(i,1)
                endif
            else
                if((new_chi.GE.0.97).and.(new_chi.LE.1.035)) then
                    uncer_dmee_right=valuesDmee(i,1)-dmee_min
                endif
            endif
        enddo
        if((uncer_dmee_left.eq.0.0).or.(uncer_dmee_right.eq.0.0)) then
            print*,'Se requiere de un grid más fino para obtener la incertidumbre en dmee (db_chiDistributionDmee)'
        endif
    close(199)
    open(180,file='daya_for_global_analysis/db_data/db_dmee_uncertainty.dat')
        write(180,*) dmee_min, uncer_dmee_left, uncer_dmee_right
    close(180) 
    !print*, 'dmee_min: '//dmee_min//' - '//uncer_dmee_left//' + '//uncer_dmee_right
    return
end subroutine db_chiDistributionDmee