function DC_energy_product(e_a,e_b,e_c)
    use types
    implicit none
    real(dp) :: DC_energy_product
    real(dp) :: e_a,e_b,e_c
    real(dp) :: v1(3),v2(3)
    real(dp) :: V_e(3,3)

    DC_energy_product=0.0_dp
    v1=(/e_a,e_b,e_c/)
    call DC_matrix_of_energy(V_e)
    DC_energy_product=dot_product(MATMUL(v1,V_e),v1)    
    return
end function DC_energy_product