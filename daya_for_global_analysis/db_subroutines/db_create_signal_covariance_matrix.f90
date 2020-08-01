subroutine db_create_signal_covariance_matrix(V,Hn,Hf,P,data_far,m,data_near)
    use db_data, only: NBIN,n=>num_experiments
    implicit none
    real(8) :: V(NBIN,NBIN)
    integer :: Hn,Hf,P
    real(8) :: data_far(NBIN,n)
    real(8) :: data_near(NBIN,n)

    real(8) :: e_ij
    integer :: i,j,m

    do i=1,NBIN
        do j=1,NBIN
            call db_create_Vdr_ij_component(n,i,j,Hn,Hf,P,data_near,data_far,e_ij,m)
            V(i,j)=e_ij
        enddo
    enddo
    return
end subroutine db_create_signal_covariance_matrix