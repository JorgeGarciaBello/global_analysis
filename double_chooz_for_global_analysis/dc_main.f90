program DC_RMS
    use DC_espectros
    use DC_condiciones
    use matriz
    implicit none
    real*8, dimension(12) :: Y                                ! Vector Y que contiene parámetros de oscilación
    real(8) :: chi_doubleCHOOZ                                ! Valor minimo de chi para Double CHOOZ   
    integer :: n=100                                          ! Es el tamaño del grid
    real(8) :: dm_min,dm_max
    real(8) :: t13_min,t13_max
    real(8) :: dm_jump,t13_jump
    integer :: i,j

    dm_min=2.0d-3
    dm_max=3.0d-3

    t13_min=0.05d0
    t13_max=0.17d0

    dm_jump=(dm_max-dm_min)/real(n)
    t13_jump=(t13_max-t13_min)/real(n)
    
    Y=0.0
    Y(2)=0.1415D0
    Y(11)=2.45d-3
    !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )

    CALL ReadDC(Nobs,Nexp,acc,LiHe,Enu)
    open(99,file='dc_data/grafica_3D.dat')
    do i=1,n
        Y(2)=t13_min + t13_jump*(i-1)
        do j=1,n            
            Y(11)=dm_min + dm_jump*(j-1)
            CALL chi2_D_C(Y,chi_doubleCHOOZ)
            write (99,*)  sin(2.0d0*Y(2))**2, Y(11), chi_doubleCHOOZ
        enddo
        print*,i
    enddo 
    close(99)  

    print*,'Chi Double CHOOZ: ',chi_doubleCHOOZ
    
end program DC_RMS