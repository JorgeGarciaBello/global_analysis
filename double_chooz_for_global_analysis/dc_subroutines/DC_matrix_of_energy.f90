subroutine DC_matrix_of_energy(V)
    use types
    use DC_data, only: sigma_energy,ro_energy
    implicit none
    real(dp) :: V(3,3)
    real(dp) :: v1(3),v2(3)

    V=0.0_dp
    V(1,1)=sigma_energy(1)**2; 
    V(2,2)=sigma_energy(2)**2; 
    V(3,3)=sigma_energy(3)**2

    V(1,2)=ro_energy(1)*sigma_energy(1)*sigma_energy(2); 
    V(1,3)=ro_energy(3)*sigma_energy(1)*sigma_energy(3); 
    V(2,3)=ro_energy(2)*sigma_energy(2)*sigma_energy(3)

    V(2,1)=V(1,2); 
    V(3,1)=V(1,3);
    V(3,2)=V(2,3);
    call db_get_inverse_covariance_matrix(3,V)
    return
end subroutine DC_matrix_of_energy