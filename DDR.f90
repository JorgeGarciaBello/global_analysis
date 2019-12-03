program DDR
    use condiciones
    use RN_inc
    use matriz
    implicit none
    integer rep,tipo
    real*8 :: minimo,dm2min
    real*8, dimension(2) :: sctmin,sctpm,dm2pm
    real*8, dimension(8) :: RN_pulls,DC_pulls
    rep=1
    print *
    write(*,*) '   Programa RENO_DC.'
    print *
    write(*,*) '   Este programa toma los datos obtenidos por el experimento Double-Chooz III y RENO'
    write(*,*) '   y estima el valor del angulo de mezcla theta_13 y la diferencia de masas cuadradas Dm2_ee'
    print *
    do while(rep==1)
        write(*,*) '1) Encontrar parametros de oscilacion'
        write(*,*) '2) Comprobacion por FAKE DATA'
        print * 
        read(*,*) tipo
        print *
        if(tipo==1)then
            CALL parametros(deltachi,ciclos,region,diagon,mm) 
            CALL RN_CalInc(RN_Inc2)
            CALL Invermat(M,diagon)
            CALL MinTot(minimo,sctmin,dm2min,RN_pulls,DC_pulls)
            CALL Grafica(minimo,RN_pulls,DC_pulls) 
            CALL Parabolas(minimo,sctmin,dm2min,RN_pulls,sctpm,dm2pm,DC_pulls)
            print *
            print *, 'Los datos estan en formato dm2(eV^2), Sin^2(2*theta), chi2 '
            print*, 'El nuevo minimo es:', minimo
            print*, 'en:'
            print*
            print*, 't13=', sctmin(1)
            print*
            print*, 'sct=', sctmin(2), '+' ,sctpm(1), '-', sctpm(2)
            print*
            print*, 'dm2=', dm2min, '+' ,dm2pm(1), '-', dm2pm(2)
            print*
            print*
            print*
            print *
            print *, 'De nuevo?'
            print*
            print *, '1) Si   2)No'
            print * 
            read(*,*) rep
            print *
        else
            CALL FakeData()
        end if
    end do
    end program 
    