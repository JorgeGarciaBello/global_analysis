SUBROUTINE db_get_chi_min_from_spectral_analysis(n,filename)
    implicit none
    integer :: n
    Character(len=*) :: filename
    real(8) :: data(n**2,3)

    real(8) :: ARRAY(n**2),RESULT(3)
    integer :: i,j,u    
    
    open(newunit=u,file='db_data/'//filename,status='old')
        read(u,*) ((data(i,j),j=1,3),i=1,n**2)
    close(u)

    ARRAY=data(:,3)
    RESULT(1) = MINVAL(ARRAY)

    do i=1,n**2
        if (data(i,3).eq.RESULT(1)) then
            RESULT(2)=data(i,1)
            RESULT(3)=data(i,2)
        end if
    enddo
    open(newunit=u,file='db_data/db_min_param_'//filename)
        write(u,*) RESULT
    close(u)
    return
end SUBROUTINE db_get_chi_min_from_spectral_analysis