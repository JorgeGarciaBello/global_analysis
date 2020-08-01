subroutine test_delta_chi_by_spectrum()
    use db_data, only:NDIM,pull_min,P,delta_chi_db
    implicit none
    integer,parameter :: MP=NDIM+1      ! MP is the number of points for polygon of ABOEBA
    integer,parameter :: NP=NDIM        ! NP is the number of pulls                   
    real(8) :: P_a(MP,NP), Y(MP)          ! Array con el que se construye AMOEBA        
    integer :: i,j
    integer :: u
    

    do i=1,10201
        call minimization(Y,P_a)
    enddo
    





    return
end subroutine test_delta_chi_by_spectrum