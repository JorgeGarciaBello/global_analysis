subroutine db_statistical_covariance_matrix_P_H_i(i,P,H,V)
     use db_data, only: n,NBIN
    implicit none
    integer :: i,P,H
    real(8) :: V(NBIN,NBIN)

    real(8) :: data(NBIN)
    real(8) :: weight_w(n**2,NBIN)
    integer :: j   

    call db_get_Nobs_P_H(P,H,data); call db_get_weight_P_H(P,H,weight_w)
    V=0.0d0
    do j=1,NBIN
        V(j,j)=data(j)*weight_w(i,j)
    enddo
    
    return
end subroutine db_statistical_covariance_matrix_P_H_i
