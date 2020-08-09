function DC_prompt_to_antineutrino_energy(E_vis,e_a,e_b,e_c)
    use types
    implicit none    
    real(dp) :: DC_prompt_to_antineutrino_energy
    real(dp) :: E_vis    ! E_vis
    real(dp) :: DC_variation_of_visible_energy
    real(dp) :: e_a,e_b,e_c    

    DC_prompt_to_antineutrino_energy=0.0d0    
    DC_prompt_to_antineutrino_energy = E_vis + DC_variation_of_visible_energy(E_vis,e_a,e_b,e_c) + 0.782d0 ! [MeV]

    if (DC_prompt_to_antineutrino_energy<=1.8010001) DC_prompt_to_antineutrino_energy=1.8010001
    !print*,'DC_prompt_to_antineutrino_energy',E_vis, DC_prompt_to_antineutrino_energy
    return
end function DC_prompt_to_antineutrino_energy