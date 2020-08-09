subroutine DC_create_grid(t13_min,t13_max,dm_min,dm_max)
    use types
    use data_settings, only: n,t13_M_data,dm_M_data
    implicit none    
    real(dp) :: t13_min, t13_max                 ! Initial and final Values of the mixing angle
    real(dp) :: dm_min, dm_max                   ! Initial and final Values of the mass mixing term
    real(dp) :: jump_t13, jump_dm                ! Jumps in th grid    
    real(dp) :: kn
    integer :: i,j
    integer :: u


    print*, 'dm_min ', dm_min
    print*, 'log(dm_min) ', log10(dm_min)
    jump_t13=(t13_max-t13_min)/real(n)
    jump_dm =(log10(dm_max) -  log10(dm_min))/real(n)
    kn=jump_dm

    do i=1,n
        do j=1,n
            t13_M_data(i,j)=t13_min+jump_t13*j
        enddo
    enddo    
    do j=1,n
        do i=1,n
            dm_M_data(i,j)=exp(   log(10.0_dp)*( (i-1)*kn + log10(dm_min) )      )            
        enddo
    enddo    
    call write_matrix_m_n(n,t13_M_data,'grid_t13_M')
    call write_matrix_m_n(n,dm_M_data,'grid_dm_M')

    open(newunit=u,file='data/grid_data_dmee.dat')
    do i=1,n        
        write(u,*) exp(   log(10.0_dp)*( (i-1)*kn + log10(dm_min) )      )         
    enddo
    close(u)
    open(newunit=u,file='data/grid_data_s22t13_.dat')
    do i=1,n        
        write(u,*) sin(2.0d0*(t13_min+jump_t13*(i)))**2
    enddo
    close(u)
    return
end subroutine DC_create_grid