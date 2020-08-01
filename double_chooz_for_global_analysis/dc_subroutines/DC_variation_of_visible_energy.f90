function DC_variation_of_visible_energy(Evis,e_a,e_b,e_c)
    use types
    implicit none
    real(dp) :: DC_variation_of_visible_energy
    real(dp) :: Evis,e_a,e_b,e_c

    DC_variation_of_visible_energy=0.0_dp
    DC_variation_of_visible_energy=e_a + e_b*Evis + e_c*Evis**2
    print*,'DC_variation_of_visible_energy', DC_variation_of_visible_energy
    return
end function DC_variation_of_visible_energy