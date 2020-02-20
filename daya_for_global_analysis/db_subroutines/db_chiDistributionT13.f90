subroutine db_chiDistributionT13(n)
    implicit none
    integer :: n                        ! Number of partitions in the interest interval
    real(8) :: readminResults(3)
    real(8) :: dmee
    integer :: reason

    integer :: i,j
    real(8) :: t_jump
    real(8) :: t_0=0.1288985016d0   ! t_0= 0.112756703d0   asin(sqrt(0.045d0))/2.0d0
    real(8) :: t_1=0.180649968323d0      !0.198849708d0!0.785398163d0    asin(sqrt(0.15d0))/2.0d0!
    real(8) :: sen2_2t_13
    real(8) :: min_val =1e+10,t13_min
    real(8) :: t13
    real(8) :: chi2_min
    real(8) :: Z(12)
    real(8) :: minT13,valuesT13(n+1,2)

    real(8) :: new_chi
    real(8) :: uncer_t13_left=0
    real(8) :: uncer_t13_right=0
    
    print*,'You are running db_chiDistributionT13() . . . '
    open(90, file='daya_for_global_analysis/db_data/analysis_1_a/db_data_min_parameters.dat',status='old')
        read(90,*,IOSTAT=reason) readminResults
    close(90)

    open(194, file='daya_for_global_analysis/db_data/analysis_1_a/db_distribution_chi_t13.dat')
    open(195, file='daya_for_global_analysis/db_data/analysis_1_a/db_distribution_chi_t13_min.dat')
    dmee=readminResults(3)
    print*,'dmee', dmee
    t_jump = (t_1-t_0)/real(n)    ! For t13    
    t13=t_0
    do i=0,n        
            Z=(/0.0d0,t13,0.0d0,0.0d0,0.0d0,0.0d0,0.0d0,0.0d0,0.0d0,0.0d0,dmee,0.0d0/)
            call chi2_db(Z,chi2_min)
            sen2_2t_13 = sin(2.0d0*t13)**2            
            write(194,*) sen2_2t_13, chi2_min 
            if(min_val.GE.chi2_min) then 
                min_val = chi2_min
                t13_min = t13
             endif
            t13=t13+t_jump
        print*, i,'%'
    enddo
    write(195,*) min_val
    close(194)
    close(195)

    open(91,file='daya_for_global_analysis/db_data/analysis_1_a/db_distribution_chi_t13_min.dat',status='old')
        read(91,*) minT13
    close(91)
    open(92,file='daya_for_global_analysis/db_data/analysis_1_a/db_distribution_chi_t13.dat',status='old')
        read(92,*) ((valuesT13(i,j), j=1,2), i=1,n+1)
    close(92)

    open(196,file='daya_for_global_analysis/db_data/analysis_1_a/db_distribution_chi_t13.dat',status='old')
        do i=1,n+1
            new_chi=valuesT13(i,2)-minT13 !Valores de Delta chi
            write(196,*) valuesT13(i,1), new_chi
            if(valuesT13(i,1).LT.sin(2.0d0*t13_min)**2) then
                if((new_chi.GE.0.97).and.(new_chi.LE.1.035)) then
                    uncer_t13_left=sin(2.0d0*t13_min)**2-valuesT13(i,1)
                endif
            else
                if((new_chi.GE.0.97).and.(new_chi.LE.1.035)) then
                    uncer_t13_right=valuesT13(i,1)-sin(2.0d0*t13_min)**2
                endif
            endif
        enddo
        if((uncer_t13_left.eq.0.0).or.(uncer_t13_right.eq.0.0)) then
            print*,'Se requiere de un grid más fino para obtener la incertidumbre en t13 (db_chiDistributionT13)'
        endif
    close(196)
    open(181,file='daya_for_global_analysis/db_data/analysis_1_a/db_t13_uncertainty.dat')
        write(181,*) t13_min,sin(2.0d0*t13_min)**2, uncer_t13_left, uncer_t13_right
    close(181)
    !print*, 't13: '//t13_min//' => s22t12: '//sin(2.0d0*t13_min)**2//'-'//uncer_t13_left//'+'//uncer_t13_right
    return
end subroutine db_chiDistributionT13