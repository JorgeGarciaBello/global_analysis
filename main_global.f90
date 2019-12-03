program main_global    
    implicit none
    real(8) :: chi_dayabay, chi_reno, chi_doubleCHOOZ, chi_min_global
    real(8) :: Y(12)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )
    integer :: n=100                                          ! Es el tamaño del grid
    real(8) :: dm_min,dm_max
    real(8) :: t13_min,t13_max
    real(8) :: dm_jump,t13_jump
    integer :: i,j


    call readDBData()      ! Lee datos de Dayabay
    call readRENOData()    ! Lee datos de RENO
    CALL ReadDC()          ! Lee datos de Double CHOOZ

    Y=0.0

    dm_min=2.0d-3
    dm_max=3.0d-3

    t13_min=0.05d0
    t13_max=0.17d0

    dm_jump=(dm_max-dm_min)/real(n)
    t13_jump=(t13_max-t13_min)/real(n)    
    
   
    !open(336,file='global_data.dat')
    open(337,file='db_data.dat')
   ! open(338,file='reno_data.dat')
   ! open(339,file='dc_data.dat')
    do i=1,n
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
        enddo
        print*,i
    enddo
    !close(336)
    close(337)
    !close(338)
    !close(339)
    call confidenceRegions(n)
end program main_global