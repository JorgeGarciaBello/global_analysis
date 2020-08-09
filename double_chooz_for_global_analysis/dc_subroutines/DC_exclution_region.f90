subroutine DC_exclution_region(n,data)
    use types
    use data_settings, only: t13_M_data,dm_M_data
    implicit  none
    integer  :: n 
    real(dp) :: data(n,n)
    real(dp) :: min_val
    integer  :: u,i,j

    min_val = MINVAL(data)    
    do i=1,n
        do j=1,n
            data(i,j)=data(i,j)-min_val        
        enddo
    enddo
    print*,min_val    
    open(newunit=u,file='data/DC_exclution_region.dat')
    do i=1,n
        do j=1,n
            if (data(i,j) <= 50.0_dp) then
                write(u,*) sin(2.0_dp*t13_M_data(i,j))**2, dm_M_data(i,j)
            end if
        enddo
    enddo
    close(u)
    return
end subroutine DC_exclution_region