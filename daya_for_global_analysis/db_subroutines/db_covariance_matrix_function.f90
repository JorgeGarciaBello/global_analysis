real(8) function db_covariance_matrix_function(P)
    use db_data, only: NBIN,PD, V_my, V, Vstat, VNacc, VNalpha, VNamc, VNLiHe, VNfastn, Veff, Vrctr
    implicit none
    real(8) :: P(8)
    real(8) :: result
    real(8) :: Mtrx(NBIN*2*PD,NBIN*2*PD)
    integer :: i,j

    result=0.0d0
    !do i=1,NBIN*2*PD
    !    do j=1,NBIN*2*PD
    !        result=result+ &
    !               (V(i,j) &
    !                -      &
    !                (P(1)*Vstat(i,j)+P(2)*VNacc(i,j)+P(3)*VNalpha(i,j)+P(4)*VNamc(i,j)+&
    !                 P(5)*VNLiHe(i,j)+P(6)*VNfastn(i,j)+P(7)*Veff(i,j)+P(8)*Vrctr(i,j)))**2/abs(V(i,j))
    !    enddo
    !enddo

    Mtrx=V-( P(1)*Vstat+ P(2)*VNacc+   P(3)*VNalpha+ P(4)*VNamc+ &
             P(5)*VNLiHe+P(6)*VNfastn+ P(7)*Veff+    P(8)*Vrctr  )
    
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD
            result=result+(Mtrx(i,j))**2/2500.0d0
        enddo
    enddo

    db_covariance_matrix_function=result
    return
end function db_covariance_matrix_function