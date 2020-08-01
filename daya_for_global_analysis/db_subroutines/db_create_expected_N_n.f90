subroutine db_create_expected_N_n(t13,dmee)
    use db_data, only: NBIN,PD, N_n,                    &
                       N_obs_H1_6AD, N_obs_H2_6AD,     &
                       N_obs_H1_8AD, N_obs_H2_8AD,     &
                       N_obs_H1_7AD, N_obs_H2_7AD
    implicit none
    real(8) :: t13, dmee

    real(8) :: weigthW_P_HFar_HNear
    integer :: i, j
    
    do i=1,NBIN*2*PD
        if(i.lt.NBIN+1) then
            N_n(i)=weigthW_P_HFar_HNear(1,3,1,i,t13,dmee)*N_obs_H1_6AD(i)
        else if( i.lt.((2*NBIN)+1) ) then
            N_n(i)=weigthW_P_HFar_HNear(1,3,2,i-NBIN,t13,dmee)*N_obs_H2_6AD(i-NBIN)


        else if( i.lt.((3*NBIN)+1) ) then
            N_n(i)=weigthW_P_HFar_HNear(2,3,1,i-2*NBIN,t13,dmee)*N_obs_H1_8AD(i-2*NBIN)
        else if( i.lt.((4*NBIN)+1) ) then
            N_n(i)=weigthW_P_HFar_HNear(2,3,2,i-3*NBIN,t13,dmee)*N_obs_H2_8AD(i-3*NBIN)


        else if( i.lt.((5*NBIN)+1) ) then
            N_n(i)=weigthW_P_HFar_HNear(3,3,1,i-4*NBIN,t13,dmee)*N_obs_H1_7AD(i-4*NBIN)
        else if( i.lt.((6*NBIN)+1) ) then
            N_n(i)=weigthW_P_HFar_HNear(3,3,2,i-5*NBIN,t13,dmee)*N_obs_H2_7AD(i-5*NBIN)
        end if
    enddo
    return
end subroutine db_create_expected_N_n