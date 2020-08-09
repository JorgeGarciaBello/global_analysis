function DC_M_Total_ij(i,j,Nbar_i,U)
    use types
    use DC_settings, only: NBIN,num_experiments     
    implicit none
    real(dp) :: DC_M_Total_ij    
    integer  :: i,j,k    
    real(dp) :: Nbar_i(NBIN,num_experiments),U(NBIN)    
    ! Obtención la entrada ij de la matriz M de la incertidumbre en Accidental-Background
    DC_M_Total_ij=0.0d0
    do k=1,num_experiments
        DC_M_Total_ij=DC_M_Total_ij+(  Nbar_i(i,k) - U(i)  )  *  ( Nbar_i(j,k) - U(j) )
    enddo
    DC_M_Total_ij=DC_M_Total_ij/real(num_experiments)
    return
end function DC_M_Total_ij