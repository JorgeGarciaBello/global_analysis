subroutine db_create_covariance_matrix(t13,dmee)
 use db_data, only: NBIN, PD,V, V_my, &
                    Vstat,Vsignal,    &
                    VNacc,VNalpha,VNamc,VNLiHe,VNfastn
                       
    implicit none
    real(8) :: t13, dmee
    call db_generate_weight_w_array(t13,dmee)

    call db_create_statistical_covariance_matrix(t13,dmee,Vstat)
    call db_create_M_Signal(t13,dmee,Vsignal)

    call db_create_M_Nacc(t13,dmee,VNacc)
    call db_create_M_Nalpha(t13,dmee,VNalpha)
    call db_create_M_Namc(t13,dmee,VNamc)
    call db_create_M_NLiHe(t13,dmee,VNLiHe)
    call db_create_M_Nfastn(t13,dmee,VNfastn)

    !########################################
    !call db_read_matrix(t13,dmee,NBIN*2*PD,Vstat,'db_M_statistical_covariance_matrix.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,Vsignal,'db_M_M_Nsignal_plus_bkg.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNacc,'db_M_M_Nacc.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNalpha,'db_M_M_Nalpha.dat')
    !all db_read_matrix(t13,dmee,NBIN*2*PD,VNamc,'db_M_M_Namc.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNLiHe,'db_M_M_NLiHe.dat')
    !call db_read_matrix(t13,dmee,NBIN*2*PD,VNfastn,'db_M_M_Nfastn.dat'

    !V=Vstat
    !V=692.1*(VNacc+VNalpha+VNamc+VNLiHe+VNfastn) + Vstat+ Vsignal
    !V=350.0d0*(VNacc+VNalpha+VNamc+VNLiHe+VNfastn) + Vstat+ Vsignal
    !V=Vsignal
    V=Vstat+Vsignal+VNacc+VNalpha+VNamc+VNLiHe+VNfastn

    call db_write_matrix(NBIN*2*PD,V,"M_final_bkg")
    call db_get_inverse_covariance_matrix(NBIN*2*PD,V)
    call db_write_matrix(NBIN*2*PD,V,"M_inv_final_bkg")
    return
end subroutine db_create_covariance_matrix