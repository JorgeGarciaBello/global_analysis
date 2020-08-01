subroutine DC_create_accidental_matrix(M_acc)
    use types
    use DC_settings, only: NBIN
    use DC_data, only : accidental_f,accidental_n
    implicit none
    real(dp) :: M_acc(NBIN,NBIN)
    integer  :: i,j 

    M_acc=0.0_dp
    do i=1,NBIN        
        M_acc(i,i)=accidental_f(i)
    enddo
    call write_matrix(NBIN,M_acc,'DC_M_acc')
    return
end subroutine DC_create_accidental_matrix