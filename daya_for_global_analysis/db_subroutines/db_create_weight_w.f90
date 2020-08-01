subroutine db_create_weight_w()
    use db_data, only: n,NBIN,grid_data_points,results_w
    implicit none
    real(8) :: t13,dm31                     ! are the neutrino oscillation parameters we are interested
    real(8) :: weigthW    
    integer :: i,u    
    
    !$omp parallel do private(dm31,t13)
    do i=1,n**2
        dm31=grid_data_points(i,1); t13=grid_data_points(i,2);
        results_w(i,1)=weigthW(1,t13,dm31)
        results_w(i,2)=weigthW(2,t13,dm31)
        results_w(i,3)=weigthW(3,t13,dm31)
        results_w(i,4)=weigthW(4,t13,dm31)
        results_w(i,5)=weigthW(5,t13,dm31)
        results_w(i,6)=weigthW(6,t13,dm31)
        results_w(i,7)=weigthW(7,t13,dm31)
        results_w(i,8)=weigthW(8,t13,dm31)
        results_w(i,9)=weigthW(9,t13,dm31)
        results_w(i,10)=weigthW(10,t13,dm31)
        results_w(i,11)=weigthW(11,t13,dm31)
        results_w(i,12)=weigthW(12,t13,dm31)
        results_w(i,13)=weigthW(13,t13,dm31)
        results_w(i,14)=weigthW(14,t13,dm31)
        results_w(i,15)=weigthW(15,t13,dm31)
        results_w(i,16)=weigthW(16,t13,dm31)
        results_w(i,17)=weigthW(17,t13,dm31)
        results_w(i,18)=weigthW(18,t13,dm31)
        results_w(i,19)=weigthW(19,t13,dm31)
        results_w(i,20)=weigthW(20,t13,dm31)
        results_w(i,21)=weigthW(21,t13,dm31)
        results_w(i,22)=weigthW(22,t13,dm31)
        results_w(i,23)=weigthW(23,t13,dm31)
        results_w(i,24)=weigthW(24,t13,dm31)
        results_w(i,25)=weigthW(25,t13,dm31)
        results_w(i,26)=weigthW(26,t13,dm31)
    enddo
    !$omp end parallel do
    open(newunit=u,file='db_data/db_data_base_by_weight_w.dat')
        do i=1,n**2
            write(u,*) results_w(i,:)
        enddo
    close(u)
    return
end subroutine db_create_weight_w