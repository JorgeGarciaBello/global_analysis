subroutine db_read_weight_w()
    use db_data, only: n,NBIN,results_w
    implicit none
    integer :: i,u
     open(newunit=u,file='db_data/db_data_base_by_weight_w.dat')
        do i=1,n**2
            read(u,*) results_w(i,:)
        enddo
    close(u)    
    return
end subroutine db_read_weight_w