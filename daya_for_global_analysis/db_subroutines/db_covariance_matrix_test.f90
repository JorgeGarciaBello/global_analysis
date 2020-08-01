subroutine db_covariance_matrix_test()
    use db_data, only: NBIN, PD,V, V_my, Vstat, &
                       VNacc, VNalpha, VNamc, VNLiHe, VNfastn, &
                       Veff, Vrctr, Veffu, Vrctru, Vsignal
    implicit none
    real(8) :: t13, dmee

    !t13=asin(sqrt(8.9322923097768223d-002))/2.0d0
    !dmee=2.6465346534653464d-003

    t13=asin(sqrt(0.0841d0))/2.0d0
    dmee=2.50d-003

    !call db_create_statistical_covariance_matrix(t13,dmee,Vstat)

    !call db_create_M_Nacc(t13,dmee,VNacc)
    !call db_create_M_Nalpha(t13,dmee,VNalpha)
    !call db_create_M_Namc(t13,dmee,VNamc)
    !call db_create_M_NLiHe(t13,dmee,VNLiHe)
    !call db_create_M_Nfastn(t13,dmee,VNfastn)

    call db_create_M_Signal(t13,dmee,Vsignal)


    !########################################3
    !########################################3
    !########################################3

    !call db_read_matrix(t13,dmee,NBIN*2*PD,Vstat,'db_M_statistical_covariance_matrix.dat')
    
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNacc,'db_M_M_Nacc.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNalpha,'db_M_M_Nalpha.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNamc,'db_M_M_Namc.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNLiHe,'db_M_M_NLiHe.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNfastn,'db_M_M_Nfastn.dat')

    !call db_read_matrix(t13,dmee,NBIN*2*PD,Vsignal,'db_M_M_Nsignal_plus_bkg.dat')

    !V=Vstat
    !V=692.1*(VNacc+VNalpha+VNamc+VNLiHe+VNfastn) + Vstat+ Vsignal
    !V=350.0d0*(VNacc+VNalpha+VNamc+VNLiHe+VNfastn) + Vstat+ Vsignal
    V=Vsignal
    !V=Vstat+Vsignal+VNacc+VNalpha+VNamc+VNLiHe+VNfastn

    call db_write_matrix(NBIN*2*PD,V,"M_final_bkg")
    call db_get_inverse_covariance_matrix(NBIN*2*PD,V)
    call db_write_matrix(NBIN*2*PD,V,"M_inv_final_bkg")
    stop
    !Listo    
    !call db_create_bkg_covM_Nacc(t13,dmee,VNacc)    
    !Listo
    !call db_create_bkg_covM_Nalpha(t13,dmee,VNalpha)
    !Listo
    !call db_create_bkg_covM_Namc(t13,dmee,VNamc)
    !Listo
    !call db_create_bkg_covM_NLiHe(t13,dmee,VNLiHe)
    !Listo
    !call db_create_bkg_covM_Nfastn(t13,dmee,VNfastn)

    !Listo
    !call db_create_efficiency_cov_M_c(t13,dmee,Veff)
    !call db_create_efficiency_cov_M_u(t13,dmee,Veffu)

    !Listo
    !call db_create_reactor_cov_M(t13,dmee,Vrctr)
    !call db_create_reactor_cov_M_u(t13,dmee,Vrctru)    
    
    !V=1.0d0*(Vstat+1.0d0*(VNacc+VNalpha+VNamc+VNLiHe+VNfastn)+0.6*Veff+Veffu+0.5*Vrctr+Vrctru)

    !V=1.1303496278373735d0*Vstat+ &
    !     0.36182099104694843d0*VNacc+ &
    !     1.1303496278373735d0*VNalpha+ &
    !     0.33620336982060095d0*VNamc+   &
    !     0.41305623349964360d0*VNLiHe+   &
    !     0.38743861227329618d0*VNfastn+   &
    !     0.48990909717868625d0*Vrctr+      &
    !     0.43867385472599119d0*Veff

    !V=3*V
                                                         
    !call db_write_matrix(NBIN*2*PD,V,"final_covM_new_6_plus_8")
    
    !stop
    return
end subroutine db_covariance_matrix_test