	!	16-72
    !
	!	El vector de parámetros de oscilación Y, está definido como sigue:
    !
    !			6 ángulos de mezcla					3 Fases			  3 Diferencias de masas cuadradas
    !			theta_ij,							d_ij 			  dm21, dm31 y dm41.
    !		Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )
    !
    module condiciones			! Establece las condiciones de operación del programa
		implicit none
    	real*8 deltachi
    	integer ciclos,diagon,mm
    	real*8, dimension(4) :: region
    contains
		Subroutine parametros(deltachi,ciclos,region,diagon,mm)  !Calcula las integrales Ppromedio
			implicit none
			real*8 deltachi
    		integer ciclos,diagon,mm,cambio
    		real*8, dimension(4) :: region
            !
    		open(40,file='DC_RN_region.dat')		! Región define el dominio de los parámetros de oscilación que se buscan
			read(40,*) region
            close(40)
            cambio=0
    		!
    		print *												! Restriccion de dominio de parámetros de oscilación
			write(*,*) 'El angulo de mezcla se busca entre'
			!print *
			write(*,*) region(1), 'y', region(2)
            print *	
            write(*,*) 'El dominio completo es de 0 a 0.7853981634'
			print *
            print *
            print *	
			write(*,*) 'La diferencia de masas cuadradas se busca entre'
			!print *
    		write(*,*) region(3), 'y', region(4)
            print *	
            write(*,*) 'El dominio completo es de 1E-4 a 1'
			print *
            print *
            print *	
   			write(*,*) '1) Conservar'
            write(*,*) '2) Cambiar'
            write(*,*) '3) Reset'
			print *
    		read(*,*) cambio
    		print *
    		if(cambio==2)then
				print *
				write(*,*) 'theta min='
                read(*,*) region(1)
				print *
                !
				write(*,*) 'theta max='
                read(*,*) region(2)
				print *
                !
				write(*,*) 'dm2 min='
                read(*,*) region(3)
				print *
                !
				write(*,*) 'dm2 max='
                read(*,*) region(4)
				print *
                !
            end if
            if(cambio==3)then
              	region=(/0.d0,0.7853981634d0,0.0001d0,1.d0/)
            end if
            open(40,file='DC_RN_region.dat')
            write (40,*) region
            close(40)										! Termina restricción de dominio
            !
    		deltachi=2000.d0
            print *
			write(*,*) 'Particion:'
            read(*,*) ciclos
			print *									
    		!
    		!print *										! Matriz completa
    		!write(*,*) '1)Matriz diagonal'
			!print *
    		!write(*,*) '2)Matriz completa'
			!print *
   			!read(*,*) diagon
    		!print *
            diagon=2
            !
    		!write(*,*) '1)Sin restriccion de MINOS'		! Sin restricciones de masas
			!print *
   			!write(*,*) '2)Con restriccion de MINOS'
			!print *
    		!read(*,*) mm
    		!print *
            mm=1
			return
		end Subroutine parametros
    end module
!    
!
!
!
!
!
!
!
	module DC_espectros
	implicit none
    real*8, dimension(40) :: DC_Nobs,DC_Nexp,DC_acc,DC_LiHe
    real*8, dimension(41) :: DC_Enu
    real*8, dimension(9,8) :: DC_PP
    contains
    	Subroutine ReadDC(DC_Nobs,DC_Nexp,DC_acc,DC_LiHe,DC_Enu,DC_PP)  	!Calcula las integrales Ppromedio
			implicit none
    		real*8, dimension(40) :: DC_Nobs,DC_Nexp,DC_acc,DC_LiHe
    		real*8, dimension(41) :: DC_Enu
            real*8, dimension(9,8) :: DC_PP
			!
    		open(63,file='DC_far_obs.dat')
			read (63,*) DC_Nobs
			close(63)
			!
    		open(64,file='DC_far_exp.dat')
			read (64,*) DC_Nexp
			close(64)
    		!
    		open(65,file='DC_acc.dat')
			read (65,*) DC_acc
			close(65)
    		!
    		open(66,file='DC_LiHe.dat')
			read (66,*) DC_LiHe
			close(66)
     		!
    		open(67,file='DC_bins.dat')
			read (67,*) DC_Enu
			close(67)
    		!
    		open(71,file='DC_simplex.dat')
			read (71,*) DC_PP
			close(71)
			!
			return
		end Subroutine ReadDC
    end module
    !
    !
    !
    !
    !
    module RN_espectros
	implicit none
    	real*8, dimension(26) :: RN_Nobs,RN_Nexp,RN_Bg_fast,RN_Bg_acc,RN_Bg_LiHe,RN_Bg_Cf
    	real*8, dimension(27) :: RN_Enu
    	real*8, dimension(9,8) :: RN_PP
    contains
    	Subroutine ReadReno(RN_Nobs,RN_Nexp,RN_PP,RN_Enu)  	!Calcula las integrales Ppromedio
			implicit none
            real*8, dimension(26) :: RN_Nobs,RN_Nexp
    		real*8, dimension(27) :: RN_Enu
    		real*8, dimension(9,8) :: RN_PP
    		!
    		open(41,file='RENO_far_obs.dat')
			read (41,*) RN_Nobs
			close(41)
    		!
    		open(42,file='RENO_far_exp.dat')
			read (42,*) RN_Nexp
			close(42)
    		!
    		open(43,file='RENO_simplex.dat')
			read (43,*) RN_PP
			close(43)
    		!
    		open(44,file='RENO_bins.dat')
			read (44,*) RN_Enu
			close(44)
            !
    		open(45,file='RENO_fast.dat')
			read (45,*) RN_Bg_fast
			close(45)
            !
    		open(46,file='RENO_acc.dat')
			read (46,*) RN_Bg_acc
			close(46)
            !
    		open(47,file='RENO_LiHe.dat')
			read (47,*) RN_Bg_LiHe
			close(47)
            !
    		open(48,file='RENO_Cf.dat')
			read (48,*) RN_Bg_Cf
			close(48)
            !
			return
		end Subroutine ReadReno
    end module
	!
	!
    !
    !
    !
    !
    !
    !
module db_data
    implicit none
    integer,parameter :: NDIM=9       ! NDIM is the number of pull parameters
    integer,parameter :: ADS=8         ! ADS is the number of detectors
    integer,parameter :: RCTS=6        ! RCTS is the number of reactors
    integer,parameter :: RIR=4         ! RIR is the number of radioactive isotopes in the reactors     
    integer,parameter :: NBIN=26       ! NBIN is the number of energy's bin
    integer,parameter :: osc=1         ! osc = 1 para oscilaciones, osc = 0 ó 2 para no oscilaciones 
    real*8 :: pull_min(NDIM)
    real*8 :: Bd(ADS)
    real*8 :: Sb(ADS)
    real*8 :: FNF(RIR)
    real*8 :: IBD_fdr(ADS,RCTS)       ! Set of data of the Daya Bay experimento
    real*8 :: LT_d(ADS)
    real*8 :: TP_d(ADS)
    real*8 :: length_d_r(ADS,RCTS)
    real*8 :: TP_r(RCTS)              ! Set of data of the Daya Bay experimento    
    real*8 :: bines(NBIN,2)             ! bines es una matriz con los valores que determinan los bines de energía usados
    real*8 :: v_ij_1(NBIN,NBIN)           ! Matriz de covarianza invertida
    real*8 :: N_obs(ADS)              ! Is the number of neutrino events per detector
    real*8 :: N_nom(NBIN)               ! N_nom es la densidad de neutirnos en el i-ésimo bin promedio
    real*8 :: blueH(NBIN,3)             ! blueH is the blue spectrum without oscillations per Hall (i,j); i bin, j= hall
    real*8 :: blackH(NBIN,3)            ! blackH is the observed black-oint spectrum per Hall (i,j); i bin, j= hall
    real*8 :: wH(NBIN,8)
    real*8 :: wD(272,6)               ! wH, wD  ate the contribution ratios per detector to a Hall and per reacto to detectors    
    real*8 :: wNH(NBIN,2)               ! wNH is the contribution ratios per near hall to the total per bin    
    real*8 :: Md_1607(ADS)            ! Is the number of neutrino events per detector taken from  1607_05378 paper
    real*8 :: N_e(ADS)
    real*8 :: gFactor(4,RCTS)         ! Are the geometric factor that gives the cnotribution of neutrino events per reactor to far-detectors by bin 
    real*8 :: farObs(NBIN)            ! far observed background subtracted spectrum 
    real*8 :: farExp(NBIN)            ! far expected background subtracted spectrum
    real*8 :: sigmaFarBkg(NBIN)       ! sigmaFarBkg is the total uncertainty for the far spectrum by bin 
    real*8 :: farBkg(NBIN)            ! farBkg is the total background in the far detector for the three period of data taking
    real*8 :: pullEngy
    
    contains

        subroutine readDBData()            
            implicit none
            integer :: i,j,reason
            open(16,file="daya_for_global_analysis/db_data/DB_weightsPerNearHall.dat", status="old")
            open(17,file="daya_for_global_analysis/db_data/DB_weightsPerHs.dat", status="old")
            open(18,file="daya_for_global_analysis/db_data/DB_weithsPerAd.dat", status="old")    
            open(19,file="daya_for_global_analysis/db_data/DB_blue_spectrum_by_hall.dat", status="old")
            open(20,file="daya_for_global_analysis/db_data/DB_black_spectrum_by_hall.dat", status="old")
            !open(21,file="daya_for_global_analysis/db_data/DB_background_detector.dat", status="old")
            open(21,file="daya_for_global_analysis/db_data/DB_background_detector_1809.dat", status="old")    
            open(22,file="daya_for_global_analysis/db_data/DB_detector_sigma_background.dat", status="old")
            open(23,file="daya_for_global_analysis/db_data/DB_fraction_nuclear_fission.dat", status="old")
            open(24,file="daya_for_global_analysis/db_data/DB_IBD_fractions_dr.dat", status="old")
            open(25,file="daya_for_global_analysis/db_data/DB_live_time_days_per_ad_1809.dat", status="old")
            open(26,file="daya_for_global_analysis/db_data/DB_target_proton.dat", status="old")
            open(27,file="daya_for_global_analysis/db_data/DB_lengths_detector_reactor.dat", status="old")
            open(28,file="daya_for_global_analysis/db_data/DB_thermal_power_by_reactor.dat", status="old")
            open(29,file="daya_for_global_analysis/db_data/DB_bines.dat", status="old")
            open(30,file="daya_for_global_analysis/db_data/DB_v_ij_1.dat", status="old")
            open(31,file='daya_for_global_analysis/db_data/DB_n_nom_array.dat', status='old')
            open(32,file='daya_for_global_analysis/db_data/DB_n_obs.dat', status='old')
            !open(33, file='daya_for_global_analysis/db_data/DB_Md_1607.dat', status='old')
            open(33,file='daya_for_global_analysis/db_data/DB_Md_1809.dat', status='old')
            open(34,file='daya_for_global_analysis/db_data/DB_dayabay_efficiency_weighted_target_protons.dat' &
                          ,status='old')
            open(36,file='daya_for_global_analysis/db_data/DB_geometric_factor.dat',status='old')
            open(37,file='daya_for_global_analysis/db_data/dayabay_1809_far_obs_background_subtracted_spectrum_IBD.dat', &
                          status='old')
            open(38,file='daya_for_global_analysis/db_data/dayabay_1809_far_exp_background_subtracted_spectrum_IBD.dat', &
                          status='old')
            open(39,file='daya_for_global_analysis/db_data/dayabay_1809_total_period_uncertainty_of_background_H3_hall.dat', &
                           status='old')
            open(40,file='daya_for_global_analysis/db_data/dayabay_1809total_far_bkg_in_three_period_of_data_taking.dat', &
                           status='old')
            
                read(16,*,IOSTAT=reason) ((wNH(i,j), j=1,2), i=1,34)
                read(17,*,IOSTAT=reason) ((wH(i,j), j=1,8), i=1,34)
                read(18,*,IOSTAT=reason) ((wD(i,j), j=1,6), i=1,272)
                read(19,*,IOSTAT=reason) ((blueH(i,j),j=1,3),i=1,NBIN)
                read(20,*,IOSTAT=reason) ((blackH(i,j),j=1,3),i=1,NBIN)        
                read(21,*,IOSTAT=reason) Bd
                read(22,*,IOSTAT=reason) Sb
                read(23,*,IOSTAT=reason) FNF
                read(24,*,IOSTAT=reason) ((IBD_fdr(i,j), j=1,RCTS), i=1,ADS)
                read(25,*,IOSTAT=reason) LT_d   ! [days]
                read(26,*,IOSTAT=reason) TP_d
                read(27,*,IOSTAT=reason) ((length_d_r(i,j), j=1,RCTS), i=1,ADS) ! [m]
                read(28,*,IOSTAT=reason) TP_r
                read(29,*,IOSTAT=reason) ((bines(i,j), j=1,2), i=1,NBIN)
                read(30,*,IOSTAT=reason) ((v_ij_1(i,j), j=1,34), i=1,NBIN)
                read(31,*,IOSTAT=reason) N_nom
                read(32,*,IOSTAT=reason) N_obs
                read(33,*,IOSTAT=reason) Md_1607
                read(34,*,IOSTAT=reason) N_e
                read(36,*,IOSTAT=reason) ((gFactor(i,j), j=1,RCTS), i=1,4)
                read(37,*,IOSTAT=reason) farObs
                read(38,*,IOSTAT=reason) farExp
                read(39,*,IOSTAT=reason) sigmaFarBkg
                read(40,*,IOSTAT=reason) farBkg
            close(16)
            close(17)
            close(18)
            close(19)
            close(20)
            close(21)
            close(22)
            close(23)
            close(24)
            close(25)
            close(26)
            close(27)
            close(28)
            close(29)
            close(30)
            close(31)
            close(32)
            close(33)
            close(34)
            close(36)
            close(37)
            close(38)
            close(39)
            close(40)
            !print*, 'farObs', farObs
            !print*, 'farExp', farExp
            return
        end subroutine readDBData
end module db_data
    !
    !
    !
    !
    !
    module matriz
    	use condiciones
		implicit none
    	real*8, dimension(40,40) :: M
    contains
    	Subroutine InverMat(M,diagon)
			implicit none
    		integer i,j,k,l,n,diagon!,rep
    		real*8, dimension(40,40) :: Inv,Maux,Mst,Mrf,Mde,Mac,Mli,M
    		real*8 aux
    		CALL ReadMat(Mst,Mrf,Mde,Mac,Mli)
            Maux=Mst+Mrf+Mde+Mac+Mli				! Estadistico! Reactor! Deteccion! Accidental! Li+ He
			if(diagon==1)then
          		do i=1,40
            		M(i,i)=1.d0/(M(i,i))
          		end do
    		else
				M=Maux
	    		Inv=0.d0
    			do i=1,40
					Inv(i,i)=1.d0			! Generación de matriz unidad
				end do
				do j=1,40
    				aux=M(j,j)
    				do n=1,40
    					if((abs(aux) > 1E-10))then! .and. (flag==0))then
        					Inv(n,j)=Inv(n,j)/aux
        					M(n,j)=M(n,j)/aux		! elemento diagonal distinto de cero es unitario
        				end if
  					end do
!
    				if((j<40))then! .and. (flag==0))then
    					do k=j+1,40
        					aux=M(j,k)
          					do l=1,40
                				Inv(l,k)=Inv(l,k)-Inv(l,j)*aux
            					M(l,k)=M(l,k)-M(l,j)*aux		! Convierte la matriz en triangular inferior
        					end do
						end do
					end if
    			end do
!    
    			do i=1,40
        			do k=i,39
        				aux=M(41-i,40-k)
          				do l=1,40
                			Inv(l,40-k)=Inv(l,40-k)-Inv(l,41-i)*aux		! Diagonalizar matriz triangular 
            				M(l,40-k)=M(l,40-k)-M(l,41-i)*aux
        				end do
					end do
    			end do
!
  				M=Inv			! 	Se sustituye la matriz por su inversa
    		end if
    		return
		end Subroutine InverMat
    end module
!
!
!
!
!
    module RN_inc
    	implicit none
        real*8, dimension(26) :: RN_Inc2,RN_Deff,RN_SystUncor,RN_RFlux,RN_stat!RN_BGtotal,RN_EScale,
    contains
		Subroutine RN_CalInc(RN_Inc2)  ! Calcula las incertidumbres principales
			implicit none
            real*8, dimension(26) :: RN_Inc2
    		integer i
            !
			open(46,file='RENO_incstat.dat')
			read (46,*) RN_stat
			close(46)
            !
			!open(47,file='RENO_Deff.dat')
			!read (47,*) RN_Deff
			!close(47)
    		!
			!open(48,file='RENO_syst_uncor.dat')
			!read (48,*) RN_SystUncor
			!close(48)
    		!
            open(49,file='RENO_reactor_flux.dat')
			read (49,*) RN_RFlux
			close(49)
            !
            !open(50,file='RENO_energy_scale.dat')
			!read (50,*) RN_EScale
			!close(50)
            !
            !open(51,file='RENO_bg_total.dat')
			!read (51,*) RN_BGtotal
			!close(51)
    		!
    		do i=1,26        
    			RN_Inc2(i)=RN_stat(i)*RN_stat(i)+ RN_RFlux(i)*RN_RFlux(i)!+RN_Deff(i)*RN_Deff(i) + RN_SystUncor(i)*RN_SystUncor(i)
                !RN_Inc2(i)=RN_Inc2(i) 
                !RN_Inc2(i)=RN_Inc2(i)!+RN_EScale(i)*RN_EScale(i)!+RN_BGtotal(i)*RN_BGtotal(i)
    		end do
    		return
		end Subroutine RN_CalInc
    end module
!
!
!
!
!
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
    !
!
!
!
!
!
!
!
!
!
!   
!
!
!
!
!
Function DC_chi2(Y,DC_pulls)
    use condiciones
	use DC_espectros
    use matriz
    implicit none
	integer :: i,j,h!,rep
	real*8 :: aux,chialfa,chinum,pullsterm,chiOn,L,nm!,peso,x,POff,Toff,,B
    real*8 :: ep1,ep2,ep3,epa,epb,epc!,ep5,ChiOff,,NExpOff,NObsOff,NTot,TOn,ep4
    real*8 :: DC_chi2,MRes
	real*8, dimension(40) :: Pprom
	real*8, dimension(8) :: DC_pulls   !Valores a minimizar
    real*8, dimension(12) :: Y
    ep1=DC_pulls(1)
    ep2=DC_pulls(2)
    ep3=DC_pulls(3)
!   ep4=DC_pulls(4)
!	ep5=DC_pulls(5)
    epa=DC_pulls(6)
    epb=DC_pulls(7)
    epc=DC_pulls(8)
    L=1050.d0
!	B=1.56d0
    !CALL Promoff(t13,dm2,POff,epa,epb,epc)
	!P=1-0.75*sct
    !Toff=7.24d0
	!NExpOff=ep4*POff+B*Toff
	!NObsOff=7.d0
    !NTot=17304.d0
    !TOn=460.67
    !Maux=0.d0
    !x=0.5d0 !Energía del primer bin
    nm=3.d0
    do h=1,40
		call DC_Ppromedio(DC_Enu,DC_pulls,L,Y,Pprom(h),h) 	! (Calcula y guarda las 40 integrales de Pprom)						
	end do
!
! Chi On
!
    ChiOn=0.d0
	if(diagon==1)then
    	do i=1,40
	        pullsterm=ep1*(DC_LiHe(i))+ep2*(nm)+ep3*(DC_acc(i))
    	   	!aux=Nobs(i)-(Nexp(i))*(Pprom(i))*(1.d0+ep4*(TOn/(Toff*NTot)))-pulls_dc  ! Con off
            aux=DC_Nobs(i)-(DC_Nexp(i))*(Pprom(i))-pullsterm	! Sin off
        	aux=aux*aux
            aux=aux*M(i,i)
			chiOn=chiOn+aux
		end do
    else
    	do i=1,40
		do j=1,40
	        pullsterm=ep1*(DC_LiHe(i))+ep2*(nm)+ep3*(DC_acc(i))
    	   	aux=DC_Nobs(i)-DC_Nexp(i)*Pprom(i)-pullsterm												!	Sin off
            !aux=Nobs(i)-Nexp(i)*Pprom(i)-((ep4*TOn*(Nexp(i))*Pprom(i))/(Toff*NTot))-pulls_dc	!	Con off
        	pullsterm=ep1*(DC_LiHe(j))+ep2*(nm)+ep3*(DC_acc(j))
            aux=aux*(DC_Nobs(j)-DC_Nexp(j)*Pprom(j)-pullsterm)			!	Sin off
            !aux=aux*(Nobs(j)-Nexp(j)*Pprom(j)-((ep4*TOn*(Nexp(j))*Pprom(j))/(Toff*NTot))-pulls_dc)			!	Con off
            aux=aux*M(i,j)
			chiOn=chiOn+aux
  		end do
		end do
    end if
!
!	Chi off
!
!    ChiOff=NObsOff*alog(NObsOff/NExpOff) + NExpOff - NObsOff 
!	ChiOff=ChiOff*2.d0
!
!	Pulls 	
	chialfa=30.76064368d0*epa**2+18.89069749d0*epb**2+3056.249126d0*epc**2
    chialfa=chialfa+15.0095921d0*epa*epb+53.66907806d0*epa*epc+145.0223795d0*epb*epc
    chialfa=chialfa*1000.d0
!    chialfa=0.d0
!
!	Pulls numericos
!   1: Li+He   2: n-mu   3: acc   4: resid   5: masas
!
	chinum=(ep1/0.13d0)**2+(ep2/0.038d0)**2+(ep3/0.0026d0)**2
!    chinum=chinum+(ep4/0.47d0)**2!+(ep5/0.095)**2
!
!	Chi total
!
	if(mm==1)then
		DC_chi2=ChiOn+chialfa+chinum!+ChiOff
    else
!
!	Restriccion de masas
!
    	MRes=((0.00244-Y(11))**2)*(1.108E8)
    	DC_chi2=ChiOn+chialfa+chinum+MRes!+ChiOff
    end if
	return
	end function DC_chi2
    !
    !
    !
    !
    !
	Function RN_chi2(Y,RN_pulls)
    use condiciones
	use RN_espectros
    use RN_inc
	implicit none
	integer :: i,j!,rep
	real*8 :: aux,chialfa,chinum,pullsterm,chiOn,background!,peso,x,
    real*8 :: ep1,ep2,ep3,ep4,ep5,epa!,epb,epc
    real*8 :: RN_chi2,MRes!,omega
	real*8, dimension(26) :: PF
    real*8, dimension(26,6) :: PpromFar
    real*8, dimension(6) :: LFar,WF!,omega,LNear
	real*8, dimension(8) :: RN_pulls   !Valores a minimizar
    real*8, dimension(12) :: Y
    ep1=RN_pulls(1)	! fast
    ep2=RN_pulls(2)	! acc
    ep3=RN_pulls(3)	! LiHe
    ep4=RN_pulls(4)	! Cf
	ep5=RN_pulls(5)
    epa=RN_pulls(6)
    !epb=RN_pulls(7)
    !epc=RN_pulls(8)
    LFar=(/1556.5d0,1456.2d0,1395.9d0,1381.3d0,1413.8d0,1490.1d0/)
    WF=(/0.151d0,0.172d0,0.166d0,0.192d0,0.161d0,0.159d0/) ! Suman 1
!    LNear=(/667.9d0,451.8d0,304.8d0,336.1d0,513.9d0,739.1d0/)
!    WN=(/0.076d0,0.166d0,0.313d0,0.285d0,0.104d0,0.055d0/) ! Peso near, Suman 1
!    omega=(/0.0449d0,0.08661d0,0.17031d0,0.12539d0,0.05524d0,0.02963d0/)            !(LF*WF/LN*WN)**2 Salemuy bien
    PF=0.d0
    do j=1,6
	    do i=1,26
			call RN_Ppromedio(RN_pulls,LFar(j),Y,PpromFar(i,j),i) 	! (Calcula y guarda las 27 integrales de Pprom)
		end do
    end do
    ChiOn=0.d0
    	do i=1,26
!			R+S Far
!            	aux=(RN_NExpFar(i))*(RN_PpromFar(i)) - RN_NObsFar(i)
!            	aux=aux*aux
!            	aux=aux/Inc2(i)
				aux=0.d0
                PF=0.d0
				do j=1,6        
                	PF(i)=PF(i)+WF(j)*PpromFar(i,j)                
                end do
           		background=(ep1)*RN_Bg_fast(i)+(ep2)*RN_Bg_acc(i)+ (ep3)*RN_Bg_LiHe(i) 
                background=background+(ep4)*RN_Bg_Cf(i)
                aux=RN_Nobs(i)-background
                aux=RN_NExp(i)*(1.d0+ep5)*PF(i)-aux
           	aux=aux*aux
           	aux=aux/RN_Inc2(i)
!			
			chiOn=chiOn+aux
		end do
!	Pulls 	
!	chialfa=30.76064368d0*epa**2+18.89069749d0*epb**2+3056.249126d0*epc**2
!    chialfa=chialfa+15.0095921d0*epa*epb+53.66907806d0*epa*epc+145.0223795d0*epb*epc
!    chialfa=chialfa*1000.d0
    chialfa=(epa/0.0015d0)**2
!
!	Pulls numericos
!   1: Fast   2: Accidentals   3: Li-He   4: Cf   5: Detec eff
!
	chinum=((1.d0-ep1)/0.027d0)**2+((1.d0-ep2)/0.021d0)**2+((1.d0-ep3)/0.081d0)**2
	chinum=chinum+((1.d0-ep4)/0.093d0)**2 + (ep5/0.0021d0)**2
    !
    !do i=1,6
    !	chinum=chinum+(WF(i)/0.009d0)**2
    !end do
!	chinum=0.d0
!
	pullsterm=0.d0
	do i=6,8
    	pullsterm=pullsterm+RN_pulls(i)*RN_pulls(i)
	end do
!
    MRes=((0.00244-Y(11))**2)*(1.108E8)
!
!	Chi total
!
	if(mm==1)then
		RN_chi2=ChiOn+chialfa+pullsterm!+chinum
    else
    	RN_chi2=ChiOn+chialfa+pullsterm+MRes!+chinum
    end if
	return
	end function RN_chi2
    !
!
!
!
!
	Subroutine FakeData()  !Calcula las integrales Ppromedio
	implicit none
	real*8 fdm2,fsct,epa,epb,epc,L,Evis
    integer, dimension(2) :: experimento
    integer h
    real*8, dimension(40) :: FNO,Pprom
    print*
    print*
    print*
    print*
    print*
    print *, 'FAKE DATA genera datos experimentales falsos, para lo cual se introducen valores falsos de Dm^2 y sct.'
    print *, 'Al realizar un ajuste, se deben recuperar los valores introducidos y el mejor ajuste debe ser cercano a cero.'
    print *, 'La no oscilacion se alcanza si uno o ambos parametros son cero. Teorico y experimental coinciden.'
    print*
    print*
    print*
    print *, '(1/10) Seleccione el experimento a comprobar'
    print*
    print *, '1) Double Chooz (Solo RRM-Far)'
    print*
    print*
    print *, '2) RENO (no disponible)'
    print*
    print*
    print *, '3) Daya Bay (no disponible)'
    print*
    read(*,*) experimento(1)
    print*
    print*
    print*
  	print *, '(2/10) Seleccione el analisis (Por ahora Only-Far)'
    print*
    print*
    print*
    print*
    print *, '(3/10) Establecer parametros de oscilacion falsos'
    print*
    print *, 'Valor de entrada para Dm^2'
    print*
    read(*,*) fdm2
    print*
    print *, 'Valor de entrada para sct'
    print*
    read(*,*) fsct
    print *
    print*
    print*
    print*
  	print *, '(4/10) Se toma el espectro esperado'
    print *
    open(50,file='NNexp.dat')!renumerar canal
	read (50,*) FNO
	close(50)
	print*
    print*
    print*
    print*
  	print*, '(5/10) Se calculan las 40 probabilidades promedio'
    print*
	epa=0.d0
    epb=0.d0
    epc=0.d0
    L=1050.d0
    Evis=0.5d0
    do h=1,40
		!call Ppromedio(Evis,epa,epb,epc,L,fsct,fdm2,Pprom(h),h) 	! (Calcula y guarda las 40 integrales de Pprom)
        Evis=Evis+0.25d0					
	end do
    print*
    print*
    print*
  	print*, '(6/10) Se generan los N obs falsos y se guardan en FNobs.dat'
    print*
    do h=1,40
		FNO(h)=FNO(h)*Pprom(h)					
	end do
	open(61,file='FNobs.dat')! renumerar canal
	write (61,62) FNO
	close(61)
    62 format (1(E16.10)) !renumerar canal
    print*
    print*
    print*
  	print*, '(7/10) Se realiza la minimizacion'
    print*
	return
	end Subroutine FakeData
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
	Subroutine Grafica(minimo,RN_pulls,DC_pulls)  !Calcula las integrales Ppromedio
    use condiciones
    use RN_espectros
    use DC_espectros
	implicit none
    real porc
	real*8 dm,dt,minimo,aux,chimax,chimin,sct,DC_chi2,RN_chi2
    real*8, dimension(12) :: Y
    integer i,j
    real*8, dimension(3) :: coordenadas
    real*8, dimension(8) :: RN_pulls
    real*8, dimension(8) :: DC_pulls
    open(52,file='coordenadas.dat')	! (Región de confianza generada)
    deltachi=deltachi*0.5
 	!
	chimin=0.d0	! (criterios para CL)
	chimax=minimo+deltachi
    dm=4.d0/real(ciclos)
	dt=0.7853981634d0/real(ciclos)
    !
    aux=0.d0
    Y(11)=1E-4
    do i=0,ciclos+1
  		Y(2)=0.d0
  		do j=0,ciclos+1
            if(Y(11)<region(4) .and. Y(11)>region(3) .and. Y(2)<region(2) .and. Y(2)>=region(1))then
            	aux=RN_chi2(Y,RN_pulls)+DC_chi2(Y,DC_pulls)
      			if (chimin<=aux .AND. aux<=chimax ) then
                	sct=(sin(2.d0*Y(2)))**2
      				coordenadas=(/sct,Y(11),aux-minimo/)
      				write(52,53) coordenadas
            		write(*,53) coordenadas
        		end if
        	end if
            Y(2)=Y(2)+dt
  		end do
		Y(11)=exp((-4.0d0+dm*i)*2.3025) ! el segundo ciclo corre logaritmicamente en dm2
		porc=real(i*100)/real(ciclos)      ! imprime el avance en porcentaje
		print *
		print *, 'Grafica al:',porc,'%'
		print *
	end do
    close(52)
    53 format (3(E16.10,12X))
	return
	end Subroutine Grafica
    !
!
!
!
!
!
!
!
!		      
	Subroutine MinTot(minimo,sctmin,dm2min,RN_pulls,DC_pulls)  !Calcula las integrales Ppromedio
    use RN_espectros
    use DC_espectros
    use db_data
    use reno_data
    use condiciones
	implicit none
	real*8 minimo,sct,dm2min,dm,dt,RN_chi2,chi2,DC_chi2,chi2minDB,chi2minRENO
    integer i,j,k,ii
    real porc
    real*8, dimension(3) :: coo2
    real*8, dimension(2) :: sctmin
    real*8, dimension(9) :: RN_YY
    real*8, dimension(8) :: RN_entrada,RN_pulls
    real*8, dimension(9) :: DC_YY
    real*8, dimension(8) :: DC_entrada,DC_pulls
    real*8, dimension(12) :: Y
    CALL ReadReno(RN_Nobs,RN_Nexp,RN_PP,RN_Enu)
    CALL ReadDC(DC_Nobs,DC_Nexp,DC_acc,DC_LiHe,DC_Enu,DC_PP)
    CALL readDBData()
    CALL readRENOData()

    open(54,file='minimos.dat')         ! (coordenadas de los mínimos)
    !
!	YY=1E8
	Y=0.d0
    Y(11)=1E-4 
    dm=4.d0/real(ciclos)
	dt=0.7853981634d0/real(ciclos)
    minimo=1E8
    open(501,file='RENO_chi_min_in_global_test.dat')
    open(502,file='DC_chi_min_in_global_test.dat')
    open(503,file='DB_chi_min_in_global_test.dat')
    open(504,file='global_min_in_global_test.dat')
  	do i=0,ciclos
  		Y(2)=0.d0
  		do j=0,ciclos
        if(Y(11)<region(4) .and. Y(11)>region(3) .and. Y(2)<region(2) .and. Y(2)>=region(1))then
        !
        !!!!! Minimizar Double-Chooz
    		DO k=1,9
            	do ii=1,8
                	DC_entrada(ii)=DC_PP(k,ii)
    			end do
            	DC_YY(k)=DC_chi2(Y,DC_entrada) !<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  			END DO  
			CALL DC_AMOEBA(DC_PP,DC_YY,Y)	! Minimización de pulls DC
            
            
            
       !!!!!!! Mininimizar Daya Bay
       CALL chi2_db(Y,chi2minDB)

       !!!!!!! Minimizar RENO
       CALL renoChi2(Y,chi2minRENO)

        !    DO k=1,9
        !    	do ii=1,8
        !        	RN_entrada(ii)=RN_PP(k,ii)
        !   	end do
        !        RN_YY(k)=DC_chi2(Y,RN_entrada)
        !   	end do
 !           				! (minimización con AMOEBA)
        !	CALL RN_AMOEBA(RN_PP,RN_YY,Y)	! Minimización de pulls RENO
            
            
            
            !  Se suman los tres
            !            
            chi2=chi2minRENO+DC_YY(1)+chi2minDB                ! Valor de chi2 con pulls óptimos
            !chi2=RN_YY(1)+DC_YY(1)+chi2minDB                 ! Valor de chi2 con pulls óptimos

            
            write(501,*) (sin(2.d0*Y(2)))**2, Y(11), RN_YY(1)
            write(502,*) (sin(2.d0*Y(2)))**2, Y(11), DC_YY(1)
            write(503,*) (sin(2.d0*Y(2)))**2, Y(11), chi2minDB
            write(504,*) (sin(2.d0*Y(2)))**2, Y(11), chi2
            !
        if ((chi2<minimo) .or. (i==0 .and. j==0)) then     ! (Nuevo mínimo total)
        	minimo=chi2
            sct=(sin(2.d0*Y(2)))**2
        	coo2=(/sct,Y(11),minimo/)
            sctmin=(/Y(2),sct/)
            dm2min=Y(11)
        	print*
       		print*, 'nuevo minimo'
            write(*,56) coo2
       		print*
        	write(54,56) coo2
            do k=1,8
              RN_pulls(k)=RN_PP(1,k)!(coordenadas de mínimos)
           	end do
            do k=1,8
              DC_pulls(k)=DC_PP(1,k)!(coordenadas de mínimos)
           	end do
        end if
        end if
        Y(2)=Y(2)+dt  
  		end do
        write(501,*) ' '
        write(502,*) ' '
        write(503,*) ' '
        write(504,*) ' '
		Y(11)=exp((-4.0d0+dm*i)*2.3025)   ! el segundo ciclo corre logaritmicamente en dm2
		porc=i*100.d0/real(ciclos)        ! imprime el avance en porcentaje
		print *
		print *, 'Minimizacion al:',porc,'%'
		print *
	end do
    56 format (3(E16.10,12X))
    close(54)

    !close(501)
    close(502)
    !close(503)
    !close(504)
    CALL RN_SaveP(RN_PP)
    CALL DC_SaveP(DC_PP)
	return
	end Subroutine MinTot

!
!
!
!
!
!
!
!
!##########################################################
!
!       Amoeba Subroutine of minimization
!
!##########################################################
SUBROUTINE AMOEBA(P,Y,MP,NP,NDIM,FTOL,ITER)                  
IMPLICIT REAL*8 (A-H,O-Z)
PARAMETER(NMAX=25,ALPHA=1.d0,BETA=0.5d0,GAMMA=2.d0,ITMAX=20)
! Expected maximum number of dimensions, three parameters which define
! the expansions and contractions, and maximum allowed number of
! iterations.
DIMENSION P(MP,NP), Y(MP), PR(NMAX), PRR(NMAX), PBAR(NMAX)
  MPTS=NDIM+1
  ITER=0
1 ILO=1
  IF(Y(1).GT.Y(2)) THEN
    IHI=1
    INHI=2
  ELSE
    IHI=2
    INHI=1
  ENDIF
  DO I=1, MPTS
    IF(Y(I).LT.Y(ILO)) ILO=I
    IF(Y(I).GT.Y(IHI)) THEN
      INHI=IHI
      IHI=I
    ELSE IF (Y(I).GT.Y(INHI)) THEN
      IF(I.NE.IHI) INHI=I
    END IF
  END DO
! Compute the fractional range from highest to lowest and return if
! satisfactory.
  RTOL=2.d0*DABS(Y(IHI)-Y(ILO))/(DABS(Y(IHI))+DABS(Y(ILO)))
  IF(RTOL.LT.FTOL) RETURN
!  IF(ITER.EQ.ITMAX) Pause ' Amoeba exceeding maximum iterations.'

  ITER=ITER+1
  DO J=1, NDIM
    PBAR(J)=0.d0
  END DO
  DO I=1, MPTS
    IF(I.NE.IHI) THEN
      DO J=1,NDIM
        PBAR(J)=PBAR(J) + P(I,J)
      END DO
    END IF   
  END DO
  DO J=1, NDIM
    PBAR(J)=PBAR(J)/NDIM
    PR(J)=(1.d0+ALPHA)*PBAR(J) - ALPHA*P(IHI,J)
  END DO
  YPR=FUNC(PR)
  IF(YPR.LE.Y(ILO)) THEN
    DO J=1,NDIM
      PRR(J)=GAMMA*PR(J) + (1.d0-GAMMA)*PBAR(J)
    END DO
    YPRR=FUNC(PRR)
    IF(YPRR.LT.Y(ILO)) THEN
      DO J=1, NDIM
        P(IHI,J)=PRR(J)
      END DO
      Y(IHI)=YPRR
    ELSE
      DO J=1, NDIM
        P(IHI,J)=PR(J)
      END DO
      Y(IHI)=YPR      
    END IF
  ELSE IF(YPR.GE.Y(INHI)) THEN
    IF(YPR.LT.Y(IHI)) THEN
      DO J=1, NDIM
        P(IHI,J)=PR(J)
      END DO
      Y(IHI)=YPR
    END IF
    DO J=1, NDIM
      PRR(J)=BETA*P(IHI,J) + (1.d0-BETA)*PBAR(J)
    END DO
    YPRR=FUNC(PRR)
    IF(YPRR.LT.Y(IHI)) THEN
      DO J=1, NDIM
        P(IHI,J)=PRR(J)
      END DO
      Y(IHI)=YPRR
    ELSE
      DO I=1, MPTS
        IF(I.NE.ILO) THEN
          DO J=1,NDIM
            PR(J)=0.5d0*(P(I,J) + P(ILO,J))
      P(I,J)=PR(J)
      END DO
          Y(I)=FUNC(PR)
    END IF
      END DO
    END IF
  ELSE
    DO J=1, NDIM
      P(IHI,J)=PR(J)
    END DO
    Y(IHI)=YPR
  END IF
  GO TO 1
  END
  
!end of file tamoeba.f90
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
!
real*8 function averageProbability3f(bin,l,t13,dm31)
    use db_data, only: pullEngy
    implicit none
    real*8 :: bin(2)
    real*8 :: l
    real*8 :: t13
    real*8 :: dm31

    real*8 :: probability       ! is the probability of transition for a model of neutrino oscillations with a 3-framework
    real*8 :: x                 ! x es la energía del neutrino en MeV0    
    real*8 :: a,b,h
    integer :: i,n=400!000

    a=bin(1) ; b=bin(2);
    h = (b-a)/real(n)   
    averageProbability3f=0.d0
    do i=1,n
        x = a + h*real(i-1)
        x = x*(1.0d0 + pullEngy)
        averageProbability3f = averageProbability3f &
            + h*( probability(t13,dm31,l,x)     &
                + probability(t13,dm31,l,x+h))  &
                / real(2)
    enddo
    averageProbability3f = averageProbability3f/(b-a)
    return
end function averageProbability3f

!
!
!
!
!
!
!
	function P(Enu,Y,L)
	implicit none
    real*8 Enu,L,sct12,dm221,P,t13,dm2
    real*8, dimension(12) :: Y
    sct12=0.851004d0
    dm221=0.0000753d0
    t13=Y(2)
    dm2=Y(11)
	P=1.0d0-((sin(2.d0*t13))**2)*(sin((1.267d0*dm2*L)/Enu))**2
    P=P-((cos(t13))**4)*(sct12)*((sin((1.267d0*dm221*L)/Enu))**2)
	return
	end function P
!
!
!
!
!
!
!
!
!
	Subroutine Parabolas(minimo,sctmin,dm2min,RN_pulls,sctpm,dm2pm,DC_pulls)  !Calcula las integrales Ppromedio
    use RN_espectros
    use DC_espectros
    use condiciones
	implicit none
	real*8 dm,dt,minimo,aux,dm2min,sct,punto,RN_chi2,DC_chi2
    integer i,j,flag
    real*8, dimension(2) :: coordenadas,sctmin,sctpm,dm2pm
    real*8, dimension(8) :: RN_pulls,DC_pulls
    real*8, dimension(12) :: Y
    dm=4.d0/real(ciclos)
	dt=0.7853981634d0/real(ciclos)
    sctpm=0.d0
    dm2pm=0.d0
    !
    print *
    write(*,*) 'Parabola de sct'
    print *
    open(58,file='sct.dat')	! Parabola sct
  	Y(2)=0.d0
    flag=1
    coordenadas=(/0.d0,1000000.d0/)
  	do i=1,ciclos+1
    	Y(11)=1E-4
        punto=RN_chi2(Y,RN_pulls)+DC_chi2(Y,DC_pulls)
  		do j=1,ciclos+1
        	if(Y(11)<region(4) .and. Y(11)>region(3) .and. Y(2)<region(2) .and. Y(2)>region(1))then  
        		aux=RN_chi2(Y,RN_pulls)+DC_chi2(Y,DC_pulls)
        		if (aux<punto) then
            		punto=aux
                	sct=(sin(2.d0*Y(2)))**2
                    coordenadas=(/sct,aux-minimo/)
                    if(coordenadas(2)<=1.d0)then
                    	sctpm(flag)=abs(sctmin(2)-sct)
                        flag=2
					end if
        		end if
            end if
            Y(11)=exp((-4.0d0+dm*j)*2.3025)
        end do
        write(58,*) coordenadas
        write(*,*) coordenadas
        Y(2)=Y(2)+dt
  	end do
    close(58)
!
	print *
    write(*,*) 'Parabola de dm2'
    print *
    open(59,file='dm2.dat')	! Parabola dm2
    Y(11)=1E-4
    flag=1
    coordenadas=(/0.0001d0,1000000.d0/)
    do i=1,ciclos+1
      	Y(2)=0.d0
        punto=RN_chi2(Y,RN_pulls)+DC_chi2(Y,DC_pulls)
        do j=1,ciclos+1
        	if(Y(11)<region(4) .and. Y(11)>region(3) .and. Y(2)<region(2) .and. Y(2)>=region(1))then
          		aux=RN_chi2(Y,RN_pulls)+DC_chi2(Y,DC_pulls)
            	if (aux<punto) then
              		punto=aux
      				coordenadas=(/Y(11),aux-minimo/) 
                	if(coordenadas(2)<=1.d0)then
                    	dm2pm(flag)=abs(dm2min-Y(11))
                    	flag=2
					end if
          		end if
            end if
            Y(2)=Y(2)+dt
       	end do
        write(59,*) coordenadas
    	write(*,*) coordenadas
        Y(11)=exp((-4.0d0+dm*i)*2.3025)
	end do
    close(59)
    !
	return
	end Subroutine Parabolas
!
!
!
!
!
	Subroutine DC_Ppromedio(Enu,DC_pulls,L,Y,Pprom,k)  !Calcula las integrales Ppromedio
	implicit none
	real*8 Pprom,L,P,Eaux,dE,norma,DEA,epa,epb,epc,part
    real*8, dimension(12) :: Y
    real*8, dimension(41) :: Enu
    real*8, dimension(8) :: DC_pulls
    integer k,i
    epa=DC_pulls(6)
    epb=DC_pulls(7)
    epc=DC_pulls(8)
    part=100.d0
    norma=Enu(k+1)-Enu(k)
	dE=(norma)/part
	Eaux=Enu(k)+(dE*0.5d0)
   	Pprom=0.d0
	do i=1,int(part)
    !
		DEA=epa+epb*Eaux+epc*Eaux*Eaux !Corrección en energía
        !
        Pprom=Pprom+P(Eaux+DEA,Y,L)*dE
        Eaux=Eaux+dE
	end do
    Pprom=Pprom/norma
	return
	end Subroutine DC_Ppromedio
    !
    !
    !
    !
    !
	Subroutine RN_Ppromedio(RN_pulls,L,Y,Pprom,k)  !Calcula las integrales Ppromedio
    use RN_espectros
	implicit none
	real*8 Pprom,L,P,Eaux,dE,norma,DEA,epa,part!,,epb,epc
    real*8, dimension(12) :: Y
    real*8, dimension(8) :: RN_pulls
    integer k,i
    epa=RN_pulls(6)
    part=100.d0
    norma=RN_Enu(k+1)-RN_Enu(k)
	dE=(norma)/part
	Eaux=RN_Enu(k)+(dE*0.5d0)!+0.782d0!Inicialización, corrimiento al extremo izquierdo del bin, transformación a la energía del neutrino y al corrimiento al centro del rectángulo integrando
   	Pprom=0.d0
	do i=1,int(part)
		!Corrimiento al centro del integrando
		!DEA=epa+epb*Eaux+epc*Eaux*Eaux !Corrección en energía
        DEA=epa   !Suprimido por el momento
        Pprom=Pprom+P(Eaux+DEA,Y,L)*dE!
        Eaux=Eaux+dE
	end do
    Pprom=Pprom/norma
	return
	end Subroutine RN_Ppromedio
    !
!
!
!
!					 
	Subroutine DC_Promoff(Y,POff,epa,epb,epc)  
	implicit none
	real*8 POff,Enu,L,dE,DeltaE,epa,epb,epc,x
    integer i
    real*8, dimension(12) :: Y
    DeltaE=19.5d0
	dE=DeltaE/1000.d0
	Enu=2.3d0+(dE*0.5d0)
   	POff=0.d0
    L=1050.d0
	do i=1,1000
        x=Enu+epa+epb*Enu+epc*Enu*Enu
        POff=POff+((sin((1.27d0*Y(11)*L)/(x)))**2)*dE
        Enu=Enu+dE
	end do
    POff=POff/DeltaE
!    print *, 'Poff:',POff
    POff=1.d0-(((sin(2.d0*Y(2)))**2)*POff)
	return
	end Subroutine DC_Promoff
!
!
!
!
!
!
!
!
!
!
!
!
	Subroutine ReadMat(Mst,Mrf,Mde,Mac,Mli)  !Calcula las integrales Ppromedio
	implicit none
	real*8, dimension(40,40) :: Mst,Mrf,Mde,Mac,Mli
  	!
    open(64,file='DC_Mst.dat')
	read (64,*) Mst
	close(64)
    !
    open(65,file='DC_Mrf.dat')
	read (65,*) Mrf
	close(65)
    !
    open(66,file='DC_Mde.dat')
	read (66,*) Mde
	close(66)
    !
    open(67,file='DC_Mli.dat')
	read (67,*) Mli
	close(67)
    !
    open(68,file='DC_Mac.dat')
	read (68,*) Mac
	close(68)
    !
	return
	end Subroutine ReadMat
!
!
!
!
!
!
!
	Subroutine RN_SaveP(RN_PP)
	implicit none
    real*8, dimension(9,8) :: RN_PP
    integer i
    real*8 :: r
    call RANDOM_NUMBER(r)
    do i=1,8
      RN_PP(i,i)=(r*4.d0)-2.d0
      RN_PP(i+1,i)=0.d0
    end do
    open(61,file='RENO_simplex.dat')
	write (61,62) RN_PP
	close(61)
    62 format (9(E16.10,12X))
    End Subroutine RN_SaveP
    !
!
!
!
!
	Subroutine DC_SaveP(DC_PP)
	implicit none
    real*8, dimension(9,8) :: DC_PP
    integer i
    real*8 :: r
    call RANDOM_NUMBER(r)
    do i=1,8
      DC_PP(i,i)=(r*4.d0)-2.d0
      DC_PP(i+1,i)=0.d0
    end do
    open(69,file='DC_simplex.dat')
	write (69,70) DC_PP
	close(69)
    70 format (9(E16.10,12X))
    End Subroutine DC_SaveP
    !
!
!
!
!
!  
	SUBROUTINE DC_AMOEBA(PP,YY,Y)
    use DC_espectros
	IMPLICIT REAL*8 (A-H,O-Z)
    real*8, dimension(12) :: Y
!    real*8, dimension(5) :: NN
	PARAMETER(NMAX=20,ALPHA=1.d0,BETA=0.5d0,GAMMA=2.d0,ITMAX=6000,NDIM=8,MP=9,NP=8)
! Expected maximum number of dimensions, three parameters which define
! the expansions and contractions, and maximum allowed number of
! iterations.
	DIMENSION PP(MP,NP), YY(MP), PR(NMAX), PRR(NMAX), PBAR(NMAX)
    FTOL=1.D-8 	! precisión exigida a amoeba
    ITER=9000
  MPTS=NDIM+1
  ITER=0
	1 ILO=1
  IF(YY(1).GT.YY(2)) THEN
    IHI=1
    INHI=2
  ELSE
    IHI=2
    INHI=1
  ENDIF
  DO I=1, MPTS
    IF(YY(I).LT.YY(ILO)) ILO=I
    IF(YY(I).GT.YY(IHI)) THEN
      INHI=IHI
      IHI=I
    ELSE IF (YY(I).GT.YY(INHI)) THEN
      IF(I.NE.IHI) INHI=I
    END IF
  END DO
! Compute the fractional range from highest to lowest and return if
! satisfactory.  
  RTOL=2.d0*DABS(YY(IHI)-YY(ILO))/(DABS(YY(IHI))+DABS(YY(ILO)))
  IF(RTOL.LT.FTOL) RETURN
  IF(ITER.EQ.ITMAX) Pause 'DC ha excedido el numero de iteraciones'
  ITER=ITER+1
  DO J=1, NDIM
    PBAR(J)=0.d0
  END DO
  DO I=1, MPTS
    IF(I.NE.IHI) THEN
      DO J=1,NDIM
        PBAR(J)=PBAR(J) + PP(I,J)
      END DO
    END IF   
  END DO
  DO J=1, NDIM
    PBAR(J)=PBAR(J)/NDIM
    PR(J)=(1.d0+ALPHA)*PBAR(J) - ALPHA*PP(IHI,J)
  END DO
  YPR=DC_chi2(Y,PR)
  IF(YPR.LE.YY(ILO)) THEN
    DO J=1,NDIM
      PRR(J)=GAMMA*PR(J) + (1.d0-GAMMA)*PBAR(J)
    END DO
    YPRR=DC_chi2(Y,PRR)
    IF(YPRR.LT.YY(ILO)) THEN
      DO J=1, NDIM
        PP(IHI,J)=PRR(J)
      END DO
      YY(IHI)=YPRR
    ELSE
      DO J=1, NDIM
        PP(IHI,J)=PR(J)
      END DO
      YY(IHI)=YPR	  
    END IF
  ELSE IF(YPR.GE.YY(INHI)) THEN
    IF(YPR.LT.YY(IHI)) THEN
      DO J=1, NDIM
        PP(IHI,J)=PR(J)
      END DO
      YY(IHI)=YPR
    END IF
    DO J=1, NDIM
      PRR(J)=BETA*PP(IHI,J) + (1.d0-BETA)*PBAR(J)
    END DO
    YPRR=DC_chi2(Y,PRR)
    IF(YPRR.LT.YY(IHI)) THEN
      DO J=1, NDIM
        PP(IHI,J)=PRR(J)
      END DO
      YY(IHI)=YPRR
    ELSE
      DO I=1, MPTS
        IF(I.NE.ILO) THEN
          DO J=1,NDIM
            PR(J)=0.5d0*(PP(I,J) + PP(ILO,J))
	    PP(I,J)=PR(J)
	  END DO
          YY(I)=DC_chi2(Y,PR)
	END IF
      END DO
    END IF
  ELSE
    DO J=1, NDIM
      PP(IHI,J)=PR(J)
    END DO
    YY(IHI)=YPR
  END IF
  GO TO 1
  END subroutine DC_amoeba
!
!
!
!
!
!
!
!
	SUBROUTINE RN_AMOEBA(simplex,YY,Y)
    use RN_espectros
	IMPLICIT REAL*8 (A-H,O-Z)
    real*8, dimension(12) :: Y
!    real*8, dimension(5) :: NN
	PARAMETER(NMAX=20,ALPHA=1.d0,BETA=0.5d0,GAMMA=2.d0,ITMAX=6000,NDIM=8,MP=9,NP=8)  ! NP es el número de pulls, MP = NDIM = NP+1 
! Expected maximum number of dimensions, three parameters which define
! the expansions and contractions, and maximum allowed number of
! iterations.
	DIMENSION simplex(MP,NP),YY(MP), PR(NMAX), PRR(NMAX), PBAR(NMAX)!  
    FTOL=1.D-8 	! precisión exigida a amoeba
    ITER=9000
  MPTS=NDIM+1
  ITER=0
	1 ILO=1
  IF(YY(1).GT.YY(2)) THEN
    IHI=1
    INHI=2
  ELSE
    IHI=2
    INHI=1
  ENDIF
  DO I=1, MPTS
    IF(YY(I).LT.YY(ILO)) ILO=I
    IF(YY(I).GT.YY(IHI)) THEN
      INHI=IHI
      IHI=I
    ELSE IF (YY(I).GT.YY(INHI)) THEN
      IF(I.NE.IHI) INHI=I
    END IF
  END DO
! Compute the fractional range from highest to lowest and return if
! satisfactory.
  RTOL=2.d0*DABS(YY(IHI)-YY(ILO))/(DABS(YY(IHI))+DABS(YY(ILO)))
  IF(RTOL.LT.FTOL) RETURN
  IF(ITER.EQ.ITMAX) Pause 'RENO ha excedido el numero de iteraciones'
  ITER=ITER+1
  DO J=1, NDIM
    PBAR(J)=0.d0
  END DO
  DO I=1, MPTS
    IF(I.NE.IHI) THEN
      DO J=1,NDIM
        PBAR(J)=PBAR(J) + simplex(I,J)
      END DO
    END IF   
  END DO
  DO J=1, NDIM
    PBAR(J)=PBAR(J)/NDIM
    PR(J)=(1.d0+ALPHA)*PBAR(J) - ALPHA*simplex(IHI,J)
  END DO
  YPR=RN_chi2(Y,PR)
  IF(YPR.LE.YY(ILO)) THEN
    DO J=1,NDIM
      PRR(J)=GAMMA*PR(J) + (1.d0-GAMMA)*PBAR(J)
    END DO
    YPRR=RN_chi2(Y,PRR)
    IF(YPRR.LT.YY(ILO)) THEN
      DO J=1, NDIM
        simplex(IHI,J)=PRR(J)
      END DO
      YY(IHI)=YPRR
    ELSE
      DO J=1, NDIM
        simplex(IHI,J)=PR(J)
      END DO
      YY(IHI)=YPR	  
    END IF
  ELSE IF(YPR.GE.YY(INHI)) THEN
    IF(YPR.LT.YY(IHI)) THEN
      DO J=1, NDIM
        simplex(IHI,J)=PR(J)
      END DO
      YY(IHI)=YPR
    END IF
    DO J=1, NDIM
      PRR(J)=BETA*simplex(IHI,J) + (1.d0-BETA)*PBAR(J)
    END DO
    YPRR=RN_chi2(Y,PRR)
    IF(YPRR.LT.YY(IHI)) THEN
      DO J=1, NDIM
        simplex(IHI,J)=PRR(J)
      END DO
      YY(IHI)=YPRR
    ELSE
      DO I=1, MPTS
        IF(I.NE.ILO) THEN
          DO J=1,NDIM
            PR(J)=0.5d0*(simplex(I,J) + simplex(ILO,J))
	    simplex(I,J)=PR(J)
	  END DO
          YY(I)=RN_chi2(Y,PR)
	END IF
      END DO
    END IF
  ELSE
    DO J=1, NDIM
      simplex(IHI,J)=PR(J)
    END DO
    YY(IHI)=YPR
  END IF
  GO TO 1
  END subroutine RN_amoeba