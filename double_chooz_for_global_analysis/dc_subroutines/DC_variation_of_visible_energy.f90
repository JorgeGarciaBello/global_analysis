function DC_variation_of_visible_energy(Evis,e_a,e_b,e_c)
    use types
    implicit none
    real(dp) :: DC_variation_of_visible_energy
    real(dp) :: Evis,e_a,e_b,e_c

    DC_variation_of_visible_energy=0.0_dp
    if(e_a>0.006_dp)  e_a=0.006_dp
    if(e_b>0.008_dp)  e_b=0.008_dp
    if(e_c>0.0006_dp) e_c=0.0006_dp
    DC_variation_of_visible_energy=e_a + e_b*Evis + e_c*Evis**2    
    return
end function DC_variation_of_visible_energy