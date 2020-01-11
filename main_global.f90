program main_global
    implicit none
    real(8) :: chi_dayabay, chi_reno, chi_doubleCHOOZ, chi_min_global
    real(8) :: Y(12)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )
    integer :: n=80                                        ! Es el tamaño del grid
    real(8) :: dm_min,dm_max
    real(8) :: t13_min,t13_max
    real(8) :: dm_jump,t13_jump
    integer :: i,j
    real(8) :: time_1, time_2

    call readDBData()      ! Lee datos de Dayabay   
        
    !call gridMinLog()
    
    !call readRENOData()    ! Lee datos de RENO
    !CALL ReadDC()          ! Lee datos de Double CHOOZ

    Y=0.0
    dm_min=1.9105d-3        ! 2.105d-3
    dm_max=3.0805d-3        ! 2.805d-3

    t13_min=asin(sqrt(0.08))/2.0d0
    t13_max=asin(sqrt(0.2))/2.0d0

    dm_jump=(dm_max-dm_min)/real(n)
    t13_jump=(t13_max-t13_min)/real(n)    

       
    !open(336,file='global_data.dat')
    !open(337,file='db_data.dat', position="append", status="old")
    open(337,file='db_data.dat', position="append", status='old')
   ! open(338,file='reno_data.dat')
   ! open(339,file='dc_data.dat')
   write(337,*) ' '
   call cpu_time(time_1)
    do i=3,n
        Y(2)=t13_min + t13_jump*(i-1)
        do j=1,n
            Y(11)=dm_min + dm_jump*(j-1)
            
            call chi2_db(Y,chi_dayabay)      ! Subroutina que dado Y, regresa el valor de la chi-cuadrada para Daya Bay
            !call renoChi2(Y,chi_reno)        ! Subroutina que dado Y, regresa el valor de la chi-cuadrada para RENO
            !call chi2_D_C(Y,chi_doubleCHOOZ) ! Subroutina que dado Y, regresa el valor de la chi-cuadrada para Double CHOOZ
            !chi_min_global=chi_dayabay+chi_reno+chi_doubleCHOOZ
            !write (336,*)  sin(2.0d0*Y(2))**2, Y(11), chi_min_global ! Escrotura de los datos del análisis global
            write (337,*)  sin(2.0d0*Y(2))**2, Y(11), chi_dayabay ! Escrotura de los datos del análisis db
            !write (338,*)  sin(2.0d0*Y(2))**2, Y(11), chi_reno ! Escrotura de los datos del análisis reno
            !write (339,*)  sin(2.0d0*Y(2))**2, Y(11), chi_doubleCHOOZ ! Escrotura de los datos del análisis dc
            print*, j
        enddo
        print*,i
        write(337,*)
    enddo
    call cpu_time(time_2)
    !close(336)
    close(337)
    !close(338)
    !close(339)
    print*, 'Time: ', time_2-time_1
    call get_chi_min_from_data_grid(n)    
    call confidenceRegions(n)

    !call db_chiDistributionT13(350)
    
    
end program main_global